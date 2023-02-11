package com.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.checkInApplication;
import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class checkInApplicationController{

  @RequestMapping("/checkInApp")  
  public String add(@RequestParam("passport") String passport, @RequestParam("check_in_date") Date check_in_date, @RequestParam("phone_number") String phone_number, @RequestParam("nationality") String nationality, HttpServletRequest request) {


      HttpSession session = request.getSession();
      Integer userId = (Integer) session.getAttribute("userId");
	  java.sql.Date currentDate=new java.sql.Date(System.currentTimeMillis());	        

      
      checkInApplication checkInObj = new checkInApplication();
      ArrayList <checkInApplication> checkInList = new ArrayList<checkInApplication>();
      checkInObj.setUserId(userId);
      checkInObj.setCheckInApplicationDate(currentDate);
      checkInObj.setUserCheckInDate(check_in_date);
      checkInObj.setCheckInApplicationStatus("Waiting Approval");
      
      checkInList.add(checkInObj);
      session.setAttribute("checkInList", checkInList);
      
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DbConnect.openConnection();
      System.out.println("Connection successfully opened : " + conn.getMetaData());


      
      String updateUser = "Update user Set userPassportNo=?, userPhoneNo=?, userNationality=? Where userId=?";
      String insertCheckIn = "INSERT INTO checkinapplication (userId, checkInApplicationDate, userCheckInDate, checkInApplicationStatus) VALUES (?,?,?,?)";
      PreparedStatement pstmt1 = conn.prepareStatement(updateUser);
      PreparedStatement pstmt2 = conn.prepareStatement(insertCheckIn);

      
      pstmt1.setString(1, passport);
      pstmt1.setString(2, phone_number);
      pstmt1.setString(3, nationality);
      pstmt1.setInt(4, userId);

      pstmt2.setInt(1, userId);
      pstmt2.setDate(2, currentDate);
      pstmt2.setDate(3,check_in_date);
      pstmt2.setString(4, "Waiting Approval");

      
      pstmt1.executeUpdate();
      pstmt2.executeUpdate();
      
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