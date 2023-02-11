package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import databaseConnection.DbConnect;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * checkOutApplication
 */
@Controller
public class checkOutApplicationController {
	
	@RequestMapping("/checkOutApp")
	public String checkOut(@RequestParam ("check_out_date") Date checkOutDate, @RequestParam ("check_out_time") String checkOutTime, HttpServletRequest request) {
		
	    HttpSession session = request.getSession();
	    Integer userId = (Integer) session.getAttribute("userId");
	    
	    java.sql.Date currentDate=new java.sql.Date(System.currentTimeMillis());	        
	    
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
	      
	  }
	    catch (SQLException ex) {
	      ex.printStackTrace();
	    }
	    catch (ClassNotFoundException ex) {
	      ex.printStackTrace();
	    }
	    return "student_home";
		
	}

    
}