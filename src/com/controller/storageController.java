package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model.storage;
import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class storageController {

    @RequestMapping("/addStorage")
    public String addStorage(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
            @RequestParam("box") int box, HttpServletRequest request) {
        int rw = 0;
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "INSERT INTO storage (userid, storageStartDate, storageEndDate, storageBoxesNo, storageStatus) VALUES (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.setInt(4, box);
            ps.setString(5, "Booked");

            rw = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "payment";
    }

    @RequestMapping("/getStorage")
    public String getStorage(Model model) throws SQLException {
        
    	ArrayList<storage> iList = new ArrayList<>();
    	ArrayList<user> uList = new ArrayList<>();
    	
        

            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "Select * From storage";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();

            
            
            
            
            while (rs.next()) {
                storage st = new storage();
                st.setStorageId(rs.getInt("storageId"));
                st.setUserId(rs.getInt("userId"));
                st.setStorageStartDate(rs.getString("storageStartDate"));
                st.setStorageStartEnd(rs.getString("storageEndDate"));
                st.setStorageBoxesNo(rs.getInt("storageBoxesNo"));
                st.setStorageStatus(rs.getString("storageStatus"));
                iList.add(st);
                
                System.out.println(rs.getInt("userId"));

            }
            
            model.addAttribute("storageList", iList);
            
            
            
            
            
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
      

        return "manageStorage";
    }
    
    
    @RequestMapping("/approveStorage")
    public void approve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int storageId = Integer.parseInt(request.getParameter("storageId"));
    	int rw = 0;
    	
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());
            System.out.println(storageId);

            String sql = "Update storage Set storageStatus = ?, storageApproveRejectRemark = ? Where storageId= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "Approved");
            ps.setString(2, null);
			ps.setInt(3, storageId);

            rw = ps.executeUpdate();

            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("getStorage");
        rd.forward(request, response);
    }
    
    
    @RequestMapping("/denyStorage")
    public ModelAndView deny(@RequestParam ("storageId") int storageId, Model m) {
    	ModelAndView model = new ModelAndView("storageRemark");
    	
    	storage st = new storage();
    	st.setStorageId(storageId);
    	
    	m.addAttribute("st", st);
    	
    	return model;
    }
    
    
    @RequestMapping("/denyStorageRemark")
    public void denyRemark(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int storageId = Integer.parseInt(request.getParameter("storageId"));
    	String storageRemark = request.getParameter("remark");
    	int rw = 0;
    	
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());
            System.out.println(storageId);

            String sql = "Update storage Set storageStatus = ?, storageApproveRejectRemark = ? Where storageId= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "Denied");
            ps.setString(2, storageRemark);
			ps.setInt(3, storageId);

            rw = ps.executeUpdate();

            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("getStorage");
        rd.forward(request, response);
    }
    
}