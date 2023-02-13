package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

import com.model.parcel;
import com.model.user;

import databaseConnection.DbConnect;

@Controller
public class parcelController {

	
	
	
    @RequestMapping("/getParcelUser")
    public String getParceclUser(Model model) {
        ArrayList<user> iList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "Select * From user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user st = new user();
                st.setUserId(rs.getInt("userId"));
                st.setUserFullName(rs.getString("userFullName"));
                st.setUserPhoneNo(rs.getString("userPhoneNo"));
                st.setUserRoomNo(rs.getString("userRoomNo"));
                iList.add(st);

            }

            model.addAttribute("userParcelList", iList);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return "addParcel";
    }
    
    
    @RequestMapping("/addParcelInfo")
    public void addParcelInfo(HttpServletRequest request, HttpServletResponse response, @RequestParam ("arrivalDate") Date arrivalDate, @RequestParam ("userId") int userId, @RequestParam ("holdingFees") int holdingFees) throws ServletException, IOException {
		/*
		 * int userId = Integer.parseInt(request.getParameter("userId")); int
		 * holdingFees = Integer.parseInt(request.getParameter("holdingFees"));
		 */
        int rw = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "INSERT INTO parcel (userId, parcelArrivalDate, parcelHoldingFees) VALUES (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setDate(2, arrivalDate);
            ps.setInt(3, holdingFees);

            rw = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("getParcelUser");
        rd.forward(request, response);
    }
    
    
    
    @RequestMapping("/getParcelStudent")
    public String getParcelStudent(Model model, HttpServletRequest request) {
        ArrayList<parcel> iList = new ArrayList<>();
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "Select * From parcel Where userId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                parcel pl= new parcel();
                pl.setUserId(rs.getInt("userId"));
                pl.setParcelId(rs.getInt("parcelId"));
                pl.setParcelArrivalDate(rs.getDate("parcelArrivalDate"));
                pl.setParcelHoldingFees(rs.getInt("parcelHoldingFees"));
                iList.add(pl);

            }

            System.out.println(iList);
            model.addAttribute("userParcelList", iList);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return "myParcel";
    }
}
