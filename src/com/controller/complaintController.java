package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.complaint;
import com.model.storage;
import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class complaintController {

    @RequestMapping("/addComplaint")
    public String add(@RequestParam("roomNo") String roomNo,
            @RequestParam("complaint") String complaint,
            HttpServletRequest request) {
        System.out.println("######### Complaint CONTROLLER #############");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "INSERT INTO complaint (userId, complainerRoomNo, complaintDate, complaintDescription, complaintStatus) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, userId);
            pstmt.setString(2, roomNo);
            pstmt.setDate(3, currentDate);
            pstmt.setString(4, complaint);
            pstmt.setString(5, "Waiting");

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return "student_home";
    }

    
    @RequestMapping("/getComplaints")
    public String getStorage(Model model) throws SQLException {
        
    	ArrayList<complaint> iList = new ArrayList<>();
    	ArrayList<user> uList = new ArrayList<>();
    	
        

            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "Select * From complaint";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();

            
            
            
            
            while (rs.next()) {
                complaint ct = new complaint();
                ct.setComplaintDate(rs.getDate("complaintDate"));
                ct.setUserId(rs.getInt("userId"));
                ct.setComplainerRoomNo(rs.getString("complainerRoomNo"));
                ct.setComplaintDescription(rs.getString("complaintDescription"));
                ct.setComplaintStatus(rs.getString("complaintStatus"));
                iList.add(ct);
                
                System.out.println(rs.getInt("userId"));

            }
            
            model.addAttribute("complaintList", iList);
            
            
            
            
            
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
      

        return "complaintsapplications";
    }
    
    
    
    @RequestMapping("/solveComplaint")
    public void approve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userId = Integer.parseInt(request.getParameter("userId"));
    	int rw = 0;
    	
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());
            System.out.println(userId);

            String sql = "Update complaint Set complaintStatus = ? Where userId= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "Solved");
			ps.setInt(2, userId);

            rw = ps.executeUpdate();

            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("getComplaints");
        rd.forward(request, response);
    }
    
}