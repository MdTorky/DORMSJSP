
package com.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.checkInApplication;
import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class checkInApplicationController {

  @RequestMapping("/checkInApp")
  public String add(@RequestParam("passport") String passport, @RequestParam("check_in_date") Date check_in_date,
      @RequestParam("phone_number") String phone_number, @RequestParam("nationality") String nationality,
      HttpServletRequest request) {

  HttpSession session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    java.sql.Date currentDate=new java.sql.Date(System.currentTimeMillis());
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());

		/*
		 * checkInApplication checkInObj = new checkInApplication(); ArrayList
		 * <checkInApplication> checkInList = new ArrayList<checkInApplication>();
		 * checkInObj.setUserId(userId);
		 * checkInObj.setCheckInApplicationDate(currentDate);
		 * checkInObj.setUserCheckInDate(check_in_date);
		 * checkInObj.setCheckInApplicationStatus("Waiting Approval");
		 *
		 * checkInList.add(checkInObj); session.setAttribute("checkInList",
		 * checkInList);
		 */

    // try {
    // Class.forName("com.mysql.cj.jdbc.Driver");
    // Connection conn = DbConnect.openConnection();
    // System.out.println("Connection successfully opened : " + conn.getMetaData());

		// String updateUser = "Update user Set userPassportNo=?, userPhoneNo=?,
		// userNationality=? Where userId=?";
		// String insertCheckIn = "INSERT INTO checkinapplication
		// (userId,checkInApplicationDate, userCheckInDate, checkInApplicationStatus)
		// VALUES(?,?,?,?)";
		// PreparedStatement pstmt1 = conn.prepareStatement(updateUser);
		// PreparedStatement pstmt2 = conn.prepareStatement(insertCheckIn);

    // pstmt1.setString(1, passport);
    // pstmt1.setString(2, phone_number);
    // pstmt1.setString(3, nationality);
    // pstmt1.setInt(4, userId);
    // HttpSession session = request.getSession();
    // Integer userId = (Integer) session.getAttribute("userId");
    // java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());

    // checkInApplication checkInObj = new checkInApplication();
    // ArrayList<checkInApplication> checkInList = new
    // ArrayList<checkInApplication>();
    // checkInObj.setUserId(userId);
    // checkInObj.setCheckInApplicationDate(currentDate);
    // checkInObj.setUserCheckInDate(check_in_date);
    // checkInObj.setCheckInApplicationStatus("Waiting Approval");

    // checkInList.add(checkInObj);
    // session.setAttribute("checkInList", checkInList);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DbConnect.openConnection();
			System.out.println("Connection successfully opened : " + conn.getMetaData());

			String updateUser = "Update user Set userPassportNo=?, userPhoneNo=?,userNationality=? Where userId=?";
			String insertCheckIn = "INSERT INTO checkinapplication (userId,checkInApplicationDate, userCheckInDate, checkInApplicationStatus) VALUES(?,?,?,?)";
			PreparedStatement pstmt1 = conn.prepareStatement(updateUser);
			PreparedStatement pstmt2 = conn.prepareStatement(insertCheckIn);

			pstmt1.setString(1, passport);
			pstmt1.setString(2, phone_number);
			pstmt1.setString(3, nationality);
			pstmt1.setInt(4, userId);

			pstmt2.setInt(1, userId);
			pstmt2.setDate(2, currentDate);
			pstmt2.setDate(3, check_in_date);
			pstmt2.setString(4, "Waiting Approval");

			pstmt1.executeUpdate();
			pstmt2.executeUpdate();

			session.setAttribute("passport", passport);

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		return "student_home";
	}

  @RequestMapping("/managerCheckInApplications")
  public ModelAndView managerCheckInApplications() {

    Connection conn = DbConnect.openConnection();
    ModelAndView model = new ModelAndView("managerCheckInApplications");

    String sql = "SELECT * from checkinapplication";
    String userSql = "SELECT * from user where userId = ?";
    ResultSet resultSet, userResultSet;
    ArrayList<checkInApplication> checkInApplications = new ArrayList<checkInApplication>();
    ArrayList<user> applicants = new ArrayList<user>();
    int applicationsHistory = 0;

    try {

      PreparedStatement preparedStatement = conn.prepareStatement(sql);
      resultSet = preparedStatement.executeQuery();
      PreparedStatement userPreparedStatement = conn.prepareStatement(userSql);

      while (resultSet.next()) {

        checkInApplication checkInApplicationInstance = new checkInApplication();
        user applicant = new user();

        int checkInApplicationId = resultSet.getInt("checkInApplicationId");
        int userId = resultSet.getInt("userId");
        Date userCheckInDate = resultSet.getDate("userCheckInDate");
        Date checkInApplicationDate = resultSet.getDate("checkInApplicationDate");
        String checkInApplicationStatus = resultSet.getString("checkInApplicationStatus");
        String approveRejectRemark = resultSet.getString("approveRejectRemark");

        checkInApplicationInstance.setCheckInApplicationId(checkInApplicationId);
        checkInApplicationInstance.setUserId(userId);
        checkInApplicationInstance.setUserCheckInDate(userCheckInDate);
        checkInApplicationInstance.setCheckInApplicationDate(checkInApplicationDate);
        checkInApplicationInstance.setCheckInApplicationStatus(checkInApplicationStatus);
        checkInApplicationInstance.setApproveRejectRemark(approveRejectRemark);

        checkInApplications.add(checkInApplicationInstance);

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

        applicationsHistory += checkInApplicationStatus.equalsIgnoreCase("approved") ? 1 : 0;

      }

    } catch (SQLException e) {
      e.printStackTrace();
    }

    model.addObject("checkInApplications", checkInApplications);
    model.addObject("applicants", applicants);
    model.addObject("applicationsHistory", applicationsHistory);

    return model;
  }

	@RequestMapping("/approveCheckIn")
	public ModelAndView approveCheckIn(@RequestParam("checkInApplicationId") int checkInApplicationId,
			@RequestParam("userId") int userId) {

		System.out.println("\n###############################################");
		System.out.println("this is a checkInApplication controller in approve check in mapping");
		Connection conn = DbConnect.openConnection();
		ModelAndView model = new ModelAndView("manager_home");

		int roomId = -1;

		String roomSql = "SELECT * from room";
		String roomUpdateSql = "UPDATE room SET userId=?, roomStatus=? WHERE roomId=?";
		String userUpdateSql = "UPDATE user SET userRoomId=? WHERE userId=?";
		String approveCheckInSql = "UPDATE checkinapplication SET checkInApplicationStatus=? WHERE checkInApplicationId=?";

		ResultSet roomResultSet;

		try {

			PreparedStatement roomPreparedStatement = conn.prepareStatement(roomSql);
			roomResultSet = roomPreparedStatement.executeQuery();

			PreparedStatement updateRoomPreparedStatement = conn.prepareStatement(roomUpdateSql);
			PreparedStatement updateUserPreparedStatement = conn.prepareStatement(userUpdateSql);
			PreparedStatement updateCheckIPreparedStatement = conn.prepareStatement(approveCheckInSql);

			while (roomResultSet.next()) {
				if (roomResultSet.getString("roomStatus").equalsIgnoreCase("empty")) {
					roomId = roomResultSet.getInt("roomId");
					System.out.println("this is iteration inside while loop with roomId: " + roomId);
					break;
				}
			}

			updateRoomPreparedStatement.setInt(1, userId);
			updateRoomPreparedStatement.setString(2, "full");
			updateRoomPreparedStatement.setInt(3, roomId);
			updateRoomPreparedStatement.executeUpdate();

			updateUserPreparedStatement.setInt(1, roomId);
			updateUserPreparedStatement.setInt(2, userId);
			updateUserPreparedStatement.executeUpdate();

			updateCheckIPreparedStatement.setString(1, "Approved");
			updateCheckIPreparedStatement.setInt(2, checkInApplicationId);
			updateCheckIPreparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping("/rejectCheckIn")
	public ModelAndView rejectCheckIn(@RequestParam("checkInApplicationId") int checkInApplicationId) {
		Connection conn = DbConnect.openConnection();
		ModelAndView model = new ModelAndView("manager_home");

		String rejectCheckInSql = "UPDATE checkinapplication SET checkInApplicationStatus=? WHERE checkInApplicationId=?";

		try {

			PreparedStatement rejectPreparedStatement = conn.prepareStatement(rejectCheckInSql);
			rejectPreparedStatement.setString(1, "Rejected");
			rejectPreparedStatement.setInt(2, checkInApplicationId);
			rejectPreparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return model;
	}

}