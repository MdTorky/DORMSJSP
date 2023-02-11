package com.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.storage;

import databaseConnection.DbConnect;

@Controller
public class storageController {

    @RequestMapping("/addStorage")
    public String addStorage(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
            @RequestParam("box") int box) {
        int rw = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "INSERT INTO storage (storageStartDate, storageEndDate, storageBoxesNo, storageStatus) VALUES (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ps.setInt(3, box);
            ps.setString(4, "Booked");

            rw = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "payment";
    }

     @RequestMapping("/getStorage")
     public String getStorage(Model model) {
    	 ArrayList<storage> iList= new ArrayList<>();
     
    	 try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection conn = DbConnect.openConnection();
             System.out.println("Connection successfully opened : " + conn.getMetaData());
             
             String sql = "Select * From storage";
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();
             
             
             
             
             while(rs.next()) {
            	 storage st = new storage();
            	 st.setStorageStartDate(rs.getString("storageStartDate"));
            	 st.setStorageStartEnd(rs.getString("storageEndDate"));
            	 st.setStorageBoxesNo(rs.getInt("storageBoxesNo"));
            	 st.setStorageStatus(rs.getString("storageStatus"));
            	 iList.add(st);
            	
             }
             
             model.addAttribute("storageList", iList);
     } catch (SQLException e) {
         e.printStackTrace();
     } catch (ClassNotFoundException e) {
         e.printStackTrace();
     }
     
    	 return "manageStorage";
     }
}