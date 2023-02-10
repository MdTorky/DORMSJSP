package com.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class checkInApplicationController{

  @RequestMapping("/checkInApp")  
  public String add(@RequestParam("passport") String passport, @RequestParam("check_in_date") Date check_in_date, @RequestParam("phone_number") String phone_number, @RequestParam("nationality") String nationality, HttpServletRequest request) {

      int rowAffected = 0;
      HttpSession session = request.getSession();
      // user _user = (user)session.getAttribute("user");
      // String email = _user.getUserEmail();

      // System.out.println("##########" + email + "#################");

      
    
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DbConnect.openConnection();
      System.out.println("Connection successfully opened : " + conn.getMetaData());


      
      String sql = "Update user Set passport=?, check_in_date=?, phone_number=?, nationality=? Where userEmail=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, passport);
      pstmt.setDate(2, check_in_date);
      pstmt.setString(3, phone_number);
      pstmt.setString(4, nationality);
      //pstmt.setString(5, );
      
      rowAffected = pstmt.executeUpdate();
      
  }
    catch (SQLException ex) {
      ex.printStackTrace();
    }
    catch (ClassNotFoundException ex) {
      ex.printStackTrace();
    }
    return "studentHome";
  }

}