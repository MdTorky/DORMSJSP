package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.checkOutApplication;
import com.model.user;
import com.mysql.cj.protocol.Resultset;

import databaseConnection.DbConnect;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * checkOutApplication
 */
@Controller
public class checkOutApplicationController {

	@RequestMapping("/checkOutApp")
	public String checkOut(@RequestParam("check_out_date") Date checkOutDate,
			@RequestParam("check_out_time") String checkOutTime, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DbConnect.openConnection();
			System.out.println("Connection successfully opened : " + conn.getMetaData());

			String sql = "INSERT INTO checkoutapplication (checkOutApplicationDate, userCheckOutDate, userCheckOutTime, checkOutApplicationStatus, userId) VALUES (?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setDate(1, currentDate);
			pstmt.setDate(2, checkOutDate);
			pstmt.setString(3, checkOutTime);
			pstmt.setString(4, "Waiting Approval");
			pstmt.setInt(5, userId);

			pstmt.executeUpdate();
			session.setAttribute("checkOutUserId", userId);

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		return "student_home";

	}

	@RequestMapping("/managerCheckOutApplications")
	public ModelAndView managerCheckOutApplications() {
		Connection conn = DbConnect.openConnection();
		ModelAndView model = new ModelAndView("managerCheckOutApplications");

		String sql = "SELECT * from checkoutapplication";
		String userSql = "SELECT * from user where userId = ?";
		ResultSet resultSet, userResultSet;
		ArrayList<checkOutApplication> checkOutApplications = new ArrayList<checkOutApplication>();
		ArrayList<user> applicants = new ArrayList<user>();

		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery(sql);
			PreparedStatement userPreparedStatement = conn.prepareStatement(userSql);

			while (resultSet.next()) {
				checkOutApplication checkOutApplicationInstance = new checkOutApplication();
				user applicant = new user();

				int checkOutApplicationId = resultSet.getInt("checkOutApplicationId");
				int userId = resultSet.getInt("userId");
				Date checkOutApplicationDate = resultSet.getDate("checkOutApplicationDate");
				Date userCheckOutDate = resultSet.getDate("userCheckOutDate");
				String userCheckOutTime = resultSet.getString("userCheckOutTime");
				String checkOutApplicationStatus = resultSet.getString("checkOutApplicationStatus");

				checkOutApplicationInstance.setCheckOutApplicationId(checkOutApplicationId);
				checkOutApplicationInstance.setUserId(userId);
				checkOutApplicationInstance.setCheckOutApplicationDate(checkOutApplicationDate);
				checkOutApplicationInstance.setUserCheckOutDate(userCheckOutDate);
				checkOutApplicationInstance.setUserCheckOutTime(userCheckOutTime);
				checkOutApplicationInstance.setCheckOutApplicationStatus(checkOutApplicationStatus);

				checkOutApplications.add(checkOutApplicationInstance);

				userPreparedStatement.setInt(1, userId);
				userResultSet = userPreparedStatement.executeQuery();
				userResultSet.next();

				int applicantUserId = userResultSet.getInt("userId");
				String userFullName = userResultSet.getString("userFullName");
				String userPassportNo = userResultSet.getString("userPassportNo");
				String userNationality = userResultSet.getString("userNationality");
				String userPhoneNo = userResultSet.getString("userPhoneNo");

				applicant.setUserId(applicantUserId);
				applicant.setUserFullName(userFullName);
				applicant.setUserPassportNo(userPassportNo);
				applicant.setUserNationality(userNationality);
				applicant.setUserPhoneNo(userPhoneNo);

				applicants.add(applicant);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addObject("checkOutApplications", checkOutApplications);
		model.addObject("applicants", applicants);

		return model;

	}

	@RequestMapping("/roomApproveCheckOut")
	public ModelAndView approveCheckOut(@RequestParam("checkOutApplicationId") int checkOutApplicationId) {
		Connection conn = DbConnect.openConnection();
		ModelAndView model = new ModelAndView("manager_home");

		String sql = "UPDATE checkoutapplication SET checkOutApplicationStatus=? where checkOutApplicationId=?";

		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "Approved");
			preparedStatement.setInt(2, checkOutApplicationId);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return model;
	}

}