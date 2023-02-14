package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class loginController {

	@RequestMapping("/loginController")
	public String add(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		ResultSet rs = null;
		int userId = 0;
		String userType = "";
		String userFullName = "";
		String userPassportNo = "";
		RequestDispatcher dispatcher = null;
		String userNationality = "";
		String userPhoneNo = "";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DbConnect.openConnection();
			System.out.println("Connection successfully opened : " + conn.getMetaData());

			String sql = "SELECT * FROM user WHERE userEmail = ? and userPassword = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				userId = rs.getInt("userId");
				userType = rs.getString("userType");
				userFullName = rs.getString("userFullName");
				userPassportNo = rs.getString("userPassportNo");
				session.setAttribute("email", email);
				userNationality = rs.getString("userNationality");
				userPhoneNo = rs.getString("userPhoneNo");
			} else {
				System.out.println("User not found");
			}

			session.setAttribute("userId", userId);
			session.setAttribute("userType", userType);

			user userObj = new user();

			userObj.setUserEmail(email);
			userObj.setUserFullName(userFullName);
			userObj.setUserPassportNo(userPassportNo);
			userObj.setUserNationality(userNationality);
			userObj.setUserPhoneNo(userPhoneNo);
			session.setAttribute("userObj", userObj);

			System.out.println("User ID: " + userId);
			System.out.println("User Type: " + userType);

			if (userType.equals("Manager")) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("managerHome");
			} else if (userType.equals("Student")) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("studentHome");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login");
			}
			dispatcher.forward(request, response);

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}

		return "login";

	}

}
