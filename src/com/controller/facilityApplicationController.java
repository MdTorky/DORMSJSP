package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.facilityApplication;
import com.model.storage;
import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class facilityApplicationController {

    @RequestMapping("/addFacility")
    public String add(@RequestParam("booking") String booking, @RequestParam("date") Date date,
            @RequestParam("time_slot") String time_slot, @RequestParam("name") String name,
            @RequestParam("room_no") String room_no, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("######### Facility Application CONTROLLER #############");

        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "INSERT INTO facilityapplication (userId, facilityApplicationDate, facilityRequestDate, facilityRequestTime, userRoomNo, facilityType, facilityApplicationStatus) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, userId);
            pstmt.setDate(2, currentDate);
            pstmt.setDate(3, date);
            pstmt.setString(4, time_slot);
            pstmt.setString(5, room_no);
            pstmt.setString(6, booking);
            pstmt.setString(7, "Booked");

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return "payment";
    }

    @RequestMapping("/getFacilities")
    public String getFacilities(Model model) throws SQLException {

        ArrayList<facilityApplication> iList = new ArrayList<>();
        ArrayList<user> uList = new ArrayList<>();

        Connection conn = DbConnect.openConnection();
        System.out.println("Connection successfully opened : " + conn.getMetaData());

        String sql = "Select * From facilityapplication";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            facilityApplication fA = new facilityApplication();
            fA.setFacilityApplicationId(rs.getInt("facilityApplicationId"));
            fA.setUserId(rs.getInt("userId"));
            fA.setFacilityApplicationDate(rs.getDate("facilityApplicationDate"));
            fA.setFacilityRequestDate(rs.getDate("facilityRequestDate"));
            fA.setFacilityRequestTime(rs.getString("facilityRequestTime"));
            fA.setUserRoomNo(rs.getString("userRoomNo"));
            fA.setFacilityType(rs.getString("facilityType"));
            fA.setFacilityApproveRejectRemark(rs.getString("facilityApproveRejectRemark"));
            fA.setFacilityApplicationStatus(rs.getString("facilityApplicationStatus"));
            iList.add(fA);
        }

        model.addAttribute("facilityList", iList);

        String sql2 = "Select * From user";
        PreparedStatement userPs = conn.prepareStatement(sql2);
        ResultSet userRs = userPs.executeQuery();

        while (userRs.next()) {
            user ur = new user();
            ur.setUserId(userRs.getInt("userId"));
            ur.setUserFullName(userRs.getString("userFullName"));
            ur.setUserEmail(userRs.getString("userEmail"));
            ur.setUserType(userRs.getString("userType"));
            ur.setUserNationality(userRs.getString("userNationality"));
            ur.setUserPhoneNo(userRs.getString("userPhoneNo"));
            ur.setUserRoomNo(userRs.getString("userRoomNo"));
            uList.add(ur);

            System.out.println(userRs.getInt("userId"));
        }

        model.addAttribute("userList", uList);

        return "facilityapplications";

    }
    
    
    
    
    
    
    
    @RequestMapping("/approveFacility")
    public void approve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userId = Integer.parseInt(request.getParameter("userId"));
    	int rw = 0;
    	
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());
            System.out.println(userId);

            String sql = "Update facilityapplication Set facilityApplicationStatus = ?, facilityApproveRejectRemark = ? Where userId= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "Approved");
            ps.setString(2, null);
			ps.setInt(3, userId);

            rw = ps.executeUpdate();

            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("getFacilities");
        rd.forward(request, response);
    }
    
    
    
    
    
    @RequestMapping("/denyFacility")
    public ModelAndView deny(@RequestParam ("userId") int userId, Model m) {
    	ModelAndView model = new ModelAndView("facilityRemark");
    	
    	facilityApplication fA = new facilityApplication();
    	fA.setUserId(userId);
    	
    	m.addAttribute("fA", fA);
    	
    	return model;
    }
    
    
    
    
    @RequestMapping("/denyFacilityRemark")
    public void denyRemark(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userId = Integer.parseInt(request.getParameter("userId"));
    	String facilityRemark = request.getParameter("remark");
    	int rw = 0;
    	
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());
            System.out.println(userId);

            String sql = "Update facilityapplication Set facilityApplicationStatus = ?, facilityApproveRejectRemark = ? Where userId= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "Denied");
            ps.setString(2, facilityRemark);
			ps.setInt(3, userId);

            rw = ps.executeUpdate();

            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("getFacilities");
        rd.forward(request, response);
    }

}