package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.user;
import com.mysql.cj.Session;

import databaseConnection.DbConnect;

@Controller
public class userController {

  @RequestMapping("/userRegister")
  public String add(@RequestParam("first_name") String first_name, @RequestParam("last_name") String last_name,
      @RequestParam("email") String email, @RequestParam("password") String password,
      HttpServletRequest request) {

    HttpSession session = request.getSession();
    String userFullName = first_name + " " + last_name;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DbConnect.openConnection();
      System.out.println("Connection successfully opened : " + conn.getMetaData());

      String sql = "INSERT INTO user (userFullName, userEmail, userPassword, userType) VALUES (?,?,?,?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, userFullName);
      pstmt.setString(2, email);
      pstmt.setString(3, password);
      pstmt.setString(4, "Student");

      pstmt.executeUpdate();

    } catch (SQLException ex) {
      ex.printStackTrace();
    } catch (ClassNotFoundException ex) {
      ex.printStackTrace();
    }
    return "login";
  }

  @RequestMapping("/managerProfile")
  public ModelAndView managerProfile(HttpServletRequest request) {

    ModelAndView model = new ModelAndView("managerProfile");

    Connection conn = DbConnect.openConnection();
    HttpSession session = request.getSession();
    int userId = (Integer) session.getAttribute("userId");

    String userSql = "SELECT * from user where userId = ?";
    ResultSet resultSet;
    user currentUser = new user();

    try {
      PreparedStatement preparedStatement = conn.prepareStatement(userSql);
      preparedStatement.setInt(1, userId);
      resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {

        int applicantUserId = resultSet.getInt("userId");
        String userFullName = resultSet.getString("userFullName");
        String userNationality = resultSet.getString("userNationality");
        String userEmail = resultSet.getString("userEmail");
        String userPhoneNo = resultSet.getString("userPhoneNo");
        String userProfileImage = resultSet.getString("userProfileImage");

        currentUser.setUserId(applicantUserId);
        currentUser.setUserFullName(userFullName);
        currentUser.setUserNationality(userNationality);
        currentUser.setUserEmail(userEmail);
        currentUser.setUserPhoneNo(userPhoneNo);
        currentUser.setUserProfileImage(userProfileImage);

      }

    } catch (Exception e) {
      e.printStackTrace();
    }

    model.addObject("currentUser", currentUser);

    System.out.println(currentUser.getUserFullName());
    System.out.println(currentUser.getUserNationality());
    System.out.println(currentUser.getUserEmail());
    System.out.println(currentUser.getUserPhoneNo());
    System.out.println(currentUser.getUserProfileImage());

    return model;
  }

  @RequestMapping("/studentProfile")
  public ModelAndView studentProfile(HttpServletRequest request) {
   
    ModelAndView model = new ModelAndView("studentProfile");

    Connection conn = DbConnect.openConnection();
    HttpSession session = request.getSession();
    int userId = (Integer) session.getAttribute("userId");

    String userSql = "SELECT * from user where userId = ?";
    ResultSet resultSet;
    user currentUser = new user();

try {
      PreparedStatement preparedStatement = conn.prepareStatement(userSql);
      preparedStatement.setInt(1, userId);
      resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {

        int applicantUserId = resultSet.getInt("userId");
        String userFullName = resultSet.getString("userFullName");
        String userNationality = resultSet.getString("userNationality");
        String userEmail = resultSet.getString("userEmail");
        String userPhoneNo = resultSet.getString("userPhoneNo");
        String userProfileImage = resultSet.getString("userProfileImage");

        currentUser.setUserId(applicantUserId);
        currentUser.setUserFullName(userFullName);
        currentUser.setUserNationality(userNationality);
        currentUser.setUserEmail(userEmail);
        currentUser.setUserPhoneNo(userPhoneNo);
        currentUser.setUserProfileImage(userProfileImage);

      }

    } catch (Exception e) {
      e.printStackTrace();
    }

    model.addObject("currentUser", currentUser);

    System.out.println(currentUser.getUserFullName());
    System.out.println(currentUser.getUserNationality());
    System.out.println(currentUser.getUserEmail());
    System.out.println(currentUser.getUserPhoneNo());
    System.out.println(currentUser.getUserProfileImage());


    return model;
  }

}