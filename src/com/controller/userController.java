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

import com.model.room;
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
		String roomSql = "SELECT * from room where roomId = ?";

		ResultSet resultSet, roomResultSet;

		user currentUser = new user();
		room userRoom = new room();
		int currentUserRoomId = -1;

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
				int userRoomId = resultSet.getInt("userRoomId");

				currentUser.setUserId(applicantUserId);
				currentUser.setUserFullName(userFullName);
				currentUser.setUserNationality(userNationality);
				currentUser.setUserEmail(userEmail);
				currentUser.setUserPhoneNo(userPhoneNo);
				currentUser.setUserProfileImage(userProfileImage);
				currentUser.setUserRoomId(userRoomId);
				currentUserRoomId = currentUser.getUserRoomId();
			}

			PreparedStatement roomPreparedStatement = conn.prepareStatement(roomSql);
			roomPreparedStatement.setInt(1, currentUserRoomId);
			roomResultSet = roomPreparedStatement.executeQuery();
			roomResultSet.next();

			userRoom.setRoomId(roomResultSet.getInt("roomId"));
			userRoom.setRoomBlockName(roomResultSet.getString("roomBlockName"));
			userRoom.setRoomLevel(roomResultSet.getInt("roomLevel"));
			userRoom.setRoomNo(roomResultSet.getInt("roomNo"));
			userRoom.setUserId(roomResultSet.getInt("userId"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addObject("currentUser", currentUser);
		model.addObject("userRoomName",
				userRoom.getRoomBlockName() + "-" + userRoom.getRoomLevel() + "-" + userRoom.getRoomNo());

		return model;
	}

	@RequestMapping("/editStudentProfile")
	public ModelAndView editStudentProfile(@RequestParam("userId") int userId,
			@RequestParam("userFullName") String userFullName, @RequestParam("userNationality") String userNationality,
			@RequestParam("userPhoneNo") String userPhoneNo) {
		ModelAndView model = new ModelAndView("editStudentProfile");
		model.addObject("userId", userId);
		model.addObject("userFullName", userFullName);
		model.addObject("userNationality", userNationality);
		model.addObject("userPhoneNo", userPhoneNo);

		return model;
	}

	@RequestMapping("/editStudentProfilePage")
	public ModelAndView editStudentProfilePage(@RequestParam("userId") int userId,
			@RequestParam("userFullName") String userFullName, @RequestParam("userNationality") String userNationality,
			@RequestParam("userPhoneNo") String userPhoneNo) {

		ModelAndView model = new ModelAndView("student_home");
		Connection conn = DbConnect.openConnection();

		String updateUserSql = "UPDATE user SET userFullName=? , userNationality=?, userPhoneNo=? WHERE userId=?";

		try {
			PreparedStatement preparedStatement = conn.prepareStatement(updateUserSql);
			preparedStatement.setString(1, userFullName);
			preparedStatement.setString(2, userNationality);
			preparedStatement.setString(3, userPhoneNo);
			preparedStatement.setInt(4, userId);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping("/editManagerProfile")
	public ModelAndView editManagerProfile(@RequestParam("userId") int userId,
			@RequestParam("userFullName") String userFullName, @RequestParam("userNationality") String userNationality,
			@RequestParam("userPhoneNo") String userPhoneNo) {
		ModelAndView model = new ModelAndView("editManagerProfile");
		model.addObject("userId", userId);
		model.addObject("userFullName", userFullName);
		model.addObject("userNationality", userNationality);
		model.addObject("userPhoneNo", userPhoneNo);
		System.out.println("this is edit manager controller");
		return model;
	}

	@RequestMapping("/editManagerProfilePage")
	public ModelAndView editManagerProfilePage(@RequestParam("userId") int userId,
			@RequestParam("userFullName") String userFullName, @RequestParam("userNationality") String userNationality,
			@RequestParam("userPhoneNo") String userPhoneNo) {

		ModelAndView model = new ModelAndView("manager_home");
		Connection conn = DbConnect.openConnection();

		String updateUserSql = "UPDATE user SET userFullName=? , userNationality=?, userPhoneNo=? WHERE userId=?";

		try {
			PreparedStatement preparedStatement = conn.prepareStatement(updateUserSql);
			preparedStatement.setString(1, userFullName);
			preparedStatement.setString(2, userNationality);
			preparedStatement.setString(3, userPhoneNo);
			preparedStatement.setInt(4, userId);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("this is Update manager controller");
		return model;
	}

}