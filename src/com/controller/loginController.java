package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import databaseConnection.DbConnect;

@Controller
public class loginController {

	@RequestMapping("/loginController")
	public String add(@RequestParam("email") String email, HttpServletRequest request) {

		HttpSession session = request.getSession();
		ResultSet rs = null;
		int userId = 0;
		String userType = "";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DbConnect.openConnection();
			System.out.println("Connection successfully opened : " + conn.getMetaData());

			String sql = "SELECT userId, userType FROM user WHERE userEmail = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				userId = rs.getInt("userId");
				userType = rs.getString("userType");
			} else {
				System.out.println("User not found");
			}

			session.setAttribute("userId", userId);
			session.setAttribute("userType", userType);

			System.out.println("User ID: " + userId);
			System.out.println("User Type: " + userType);

			if (userType.equals("Manager")) {
				return "manager_home";
			} else if (userType.equals("") || userType == null) {
				return "login";
			} else {
				return "student_home";
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}

		return "login";

	}

}
