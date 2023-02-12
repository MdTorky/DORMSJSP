package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import databaseConnection.DbConnect;

@Controller
public class InspectController {
	
	@RequestMapping("/inspect")
	public String inspect(@RequestParam ("bed_frame") int bed_frame, @RequestParam ("table") int table, @RequestParam ("chair") int chair, @RequestParam ("wardrobe") int wardrobe, @RequestParam ("door") int door, @RequestParam ("windows") int windows, @RequestParam ("checkOutApplicationId") int checkOutApplicationId, HttpServletRequest request) {
		
	    //HttpSession session = request.getSession();
	    //Integer checkOutUserId = (Integer) session.getAttribute("checkOutUserId");    
	    float totalAmount = bed_frame + table + chair + wardrobe + door + windows;
	    System.out.println("TOTAL AMOUNT TO PAY FOR DAMAGES: " + totalAmount);
	    
	    
	    try {
	      Class.forName("com.mysql.cj.jdbc.Driver");
	      Connection conn = DbConnect.openConnection();
	      System.out.println("Connection successfully opened : " + conn.getMetaData());

	      
	      String sql = "INSERT INTO inspectapplication (checkOutApplicationId, totalDamageAmount) VALUES (?, ?)";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      
	      pstmt.setInt(1, checkOutApplicationId);
		  pstmt.setFloat(2, totalAmount);
	      
	      pstmt.executeUpdate();
	      
	  }
	    catch (SQLException ex) {
	      ex.printStackTrace();
	    }
	    catch (ClassNotFoundException ex) {
	      ex.printStackTrace();
	    }
	    return "manager_home";
		
	}

}
