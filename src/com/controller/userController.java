package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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


public class userController {


  @RequestMapping("/userRegister")
  public String add(@RequestParam("first_name") String first_name, @RequestParam("last_name") String last_name, @RequestParam("email") String email, @RequestParam("password") String password, HttpServletRequest request) {

    HttpSession session = request.getSession();    
    int rowAffected = 0;
    // user _user = new user();
    // _user.setUserEmail(email);
    // session.setAttribute("user", _user);
        
    
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DbConnect.openConnection();
      System.out.println("Connection successfully opened : " + conn.getMetaData());

      String userFullName = first_name + " " + last_name;
      
      String sql = "INSERT INTO user (userFullName, userEmail, userPassword, userType) VALUES (?,?,?,?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, userFullName);
      pstmt.setString(2, email);
      pstmt.setString(3, password);
      pstmt.setString(4, "Student");
      
      rowAffected = pstmt.executeUpdate();
      
      
  }
    catch (SQLException ex) {
      ex.printStackTrace();
    }
    catch (ClassNotFoundException ex) {
      ex.printStackTrace();
    }
    return "check_in_application";
  }

    
}