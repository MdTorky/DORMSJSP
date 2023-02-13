package com.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.checkInApplication;
import com.model.checkOutApplication;
import com.model.complaint;
import com.model.facilityApplication;
import com.model.parcel;
import com.model.storage;
import com.model.user;

import databaseConnection.DbConnect;

@Controller

public class mainController {

	// MAIN HOME
	@RequestMapping("/home")
	public ModelAndView getHome() {
		ModelAndView model = new ModelAndView("home");
		return model;
	}

	// REGISTERATION
	@RequestMapping("/register")
	public ModelAndView SignUp() {
		ModelAndView model = new ModelAndView("registration");
		return model;
	}

	@RequestMapping("/login")
	public ModelAndView SigIn() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}

	// Student Pages
	@RequestMapping("/checkIn")
	public ModelAndView checkIN() {
		ModelAndView model = new ModelAndView("check_in_application");
		return model;
	}

	@RequestMapping("/checkOut")
	public ModelAndView checkOut() {
		ModelAndView model = new ModelAndView("check_out_application");
		return model;
	}

	@RequestMapping("/facBooking")
	public ModelAndView facBooking() {
		ModelAndView model = new ModelAndView("facbooking");
		return model;
	}

	@RequestMapping("/requestPersonalStorage")
	public ModelAndView requestPersonalStorage() {
		ModelAndView model = new ModelAndView("requestPersonalStorage");
		return model;
	}

	@RequestMapping("/complaintForm")
	public ModelAndView complaintForm() {
		ModelAndView model = new ModelAndView("complaintform");
		return model;
	}

	@RequestMapping("/myParcel")
	public ModelAndView myParcel() {
		ModelAndView model = new ModelAndView("myParcel");
		return model;
	}

	

	@RequestMapping("/studentHome")
	public ModelAndView studentHome() {
		ModelAndView model = new ModelAndView("student_home");
		return model;
	}

	@RequestMapping("/studentSuccessfullPage")
	public ModelAndView studentSuccessfullPage() {
		ModelAndView model = new ModelAndView("studentSuccessfullPage");
		return model;
	}

	// Manager Pages

	@RequestMapping("/facilityApplications")
	public ModelAndView facilityApplications() {
		ModelAndView model = new ModelAndView("facilityapplications");
		return model;
	}

	@RequestMapping("/addParcel")
	public ModelAndView addParcel() {
		ModelAndView model = new ModelAndView("addParcel");
		return model;
	}

	@RequestMapping("/roomInspect")
	public ModelAndView roomInspect(@RequestParam("checkOutApplicationId") int checkOutApplicationId) {

		ModelAndView model = new ModelAndView("inspectRoom");
		model.addObject("checkOutApplicationId", checkOutApplicationId);
		return model;
	}

	@RequestMapping("/manageStorage")
	public ModelAndView manageStorage() {
		ModelAndView model = new ModelAndView("manageStorage");
		return model;
	}

	@RequestMapping("/complaintsApplications")
	public ModelAndView complaintsApplications() {
		ModelAndView model = new ModelAndView("complaintsapplications");
		return model;
	}

	@RequestMapping("/managerHome")
	public ModelAndView managerHome() {
		ModelAndView model = new ModelAndView("manager_home");
		return model;
	}

	@RequestMapping("/payment")
	public ModelAndView payment() {
		ModelAndView model = new ModelAndView("payment");
		return model;
	}

	@RequestMapping("transaction")
	public String transaction(@RequestParam("payment_for") String payment_for, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		if (payment_for.equals("Rent")) {
			try {
				Connection conn = DbConnect.openConnection();

				String sql = "Update checkinapplication Set checkInApplicationStatus = ? Where userId= ?";
				PreparedStatement ps = conn.prepareStatement(sql);

				ps.setString(1, "Paid");
				ps.setInt(2, userId);

				ps.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			return "studentSuccessfullPage";
		}

		else if (payment_for.equals("Parcels")) {
			try {
				Connection conn = DbConnect.openConnection();

				String sql = "Update parcel Set parcelHoldingFees = ? Where userId= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, 0);
				ps.setInt(2, userId);

				ps.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			return "studentSuccessfullPage";

		}

		else if (payment_for.equals("Personal Storage")) {
			try {
				Connection conn = DbConnect.openConnection();

				String sql = "Update storage Set storageStatus = ? Where userId= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "Paid");
				ps.setInt(2, userId);

				ps.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			return "studentSuccessfullPage";

		} else if (payment_for.equals("Facilities")) {
			try {
				Connection conn = DbConnect.openConnection();

				String sql = "Update facilityapplication Set facilityApplicationStatus = ? Where userId= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "Paid");
				ps.setInt(2, userId);

				ps.executeUpdate();

			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			return "studentSuccessfullPage";

		}

		return "null";
	}
	
	
	
	@RequestMapping("/applied")
	public String getAll(Model model, HttpServletRequest request) throws SQLException {
        
    	ArrayList<storage> iList = new ArrayList<>();
    	ArrayList<user> uList = new ArrayList<>();
    	ArrayList<facilityApplication> fList = new ArrayList<>();
    	ArrayList<complaint> cList = new ArrayList<>();
    	ArrayList<checkInApplication> caList = new ArrayList<>();
    	ArrayList<checkOutApplication> coList = new ArrayList<>();
    	
    	 HttpSession session = request.getSession();
         Integer userId = (Integer) session.getAttribute("userId");

            Connection conn = DbConnect.openConnection();
            System.out.println("Connection successfully opened : " + conn.getMetaData());

            String sql = "Select * From user Where userId=?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
         
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            
            while (rs.next()) {
                user ur = new user();
                ur.setUserId(rs.getInt("userId"));
                ur.setUserFullName(rs.getString("userFullName"));
                ur.setUserEmail(rs.getString("userEmail"));
                ur.setUserType(rs.getString("userType"));
                ur.setUserNationality(rs.getString("userNationality"));
                ur.setUserPhoneNo(rs.getString("userPhoneNo"));
                ur.setUserRoomNo(rs.getString("userRoomNo"));
                uList.add(ur);
                
         
            }

            
			 model.addAttribute("userList", uList);
			 
			 
			 
			 String sqlStorage = "Select * From storage Where userId = ?";
			
	            PreparedStatement psStorage = conn.prepareStatement(sqlStorage);
	            psStorage.setInt(1, userId);
	            ResultSet rsStorage = psStorage.executeQuery();
            
            while (rsStorage.next()) {
                storage st = new storage();
                st.setStorageId(rsStorage.getInt("storageId"));
                st.setUserId(rsStorage.getInt("userId"));
                st.setStorageStartDate(rsStorage.getString("storageStartDate"));
                st.setStorageStartEnd(rsStorage.getString("storageEndDate"));
                st.setStorageBoxesNo(rsStorage.getInt("storageBoxesNo"));
                st.setStorageStatus(rsStorage.getString("storageStatus"));
                iList.add(st);
                
            

            }
            
            model.addAttribute("storageList", iList);
            
            
            
            
            
            
            String sqlFacility= "Select * From facilityapplication Where userId = ?";
			
	            PreparedStatement psFacility = conn.prepareStatement(sqlFacility);
	            psFacility.setInt(1, userId);
	            ResultSet rsFacility = psFacility.executeQuery();
           
           while (rsFacility.next()) {
        	   facilityApplication fA = new facilityApplication();
               fA.setFacilityApplicationId(rsFacility.getInt("facilityApplicationId"));
               fA.setUserId(rsFacility.getInt("userId"));
               fA.setFacilityApplicationDate(rsFacility.getDate("facilityApplicationDate"));
               fA.setFacilityRequestDate(rsFacility.getDate("facilityRequestDate"));
               fA.setFacilityRequestTime(rsFacility.getString("facilityRequestTime"));
               fA.setUserRoomNo(rsFacility.getString("userRoomNo"));
               fA.setFacilityType(rsFacility.getString("facilityType"));
               fA.setFacilityApproveRejectRemark(rsFacility.getString("facilityApproveRejectRemark"));
               fA.setFacilityApplicationStatus(rsFacility.getString("facilityApplicationStatus"));
               fList.add(fA);
               
           

           }
           
           model.addAttribute("facilityList", fList);
           
           
           
           
           
           String sqlComplaint= "Select * From complaint Where userId = ?";
			 
	            PreparedStatement psComplaint = conn.prepareStatement(sqlComplaint);
	            psComplaint.setInt(1, userId);
	            ResultSet rsComplaint = psComplaint.executeQuery();
           
           while (rsComplaint.next()) {
               complaint ct = new complaint();
               ct.setComplaintDate(rsComplaint.getDate("complaintDate"));
               ct.setUserId(rsComplaint.getInt("userId"));
               ct.setComplainerRoomNo(rsComplaint.getString("complainerRoomNo"));
               ct.setComplaintDescription(rsComplaint.getString("complaintDescription"));
               ct.setComplaintStatus(rsComplaint.getString("complaintStatus"));
               cList.add(ct);
               
            

           }
           
           model.addAttribute("complaintList", cList);
           
           
           
           
           
           
           
           
           
           
           String sqlCheckIn= "Select * From checkinapplication Where userId = ?";
			 
           PreparedStatement psCheckIn = conn.prepareStatement(sqlCheckIn);
           psCheckIn.setInt(1, userId);
           ResultSet rsCheckIn = psCheckIn.executeQuery();
      
      while (rsCheckIn.next()) {
          checkInApplication ca = new checkInApplication();
          ca.setUserCheckInDate(rsCheckIn.getDate("userCheckInDate"));
          ca.setCheckInApplicationDate(rsCheckIn.getDate("checkInApplicationDate"));
          ca.setCheckInApplicationStatus(rsCheckIn.getString("checkInApplicationStatus"));
          ca.setApproveRejectRemark(rsCheckIn.getString("approveRejectRemark"));
          caList.add(ca);
          
       

      }
      
      model.addAttribute("checkInList", caList);
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      String sqlCheckOut= "Select * From checkoutapplication Where userId = ?";
		 
      PreparedStatement psCheckOut = conn.prepareStatement(sqlCheckOut);
      psCheckOut.setInt(1, userId);
      ResultSet rsCheckOut = psCheckOut.executeQuery();
 
 while (rsCheckOut.next()) {
     checkOutApplication co = new checkOutApplication();
     co.setUserCheckOutDate(rsCheckOut.getDate("userCheckOutDate"));
     co.setCheckOutApplicationDate(rsCheckOut.getDate("checkOutApplicationDate"));
     co.setUserCheckOutTime(rsCheckOut.getString("userCheckOutTime"));
     co.setCheckOutApplicationStatus(rsCheckOut.getString("checkOutApplicationStatus"));
     coList.add(co);
     
  

 }
 
 model.addAttribute("checkOutList", coList);
           
            
           
           return "Applied";
	}
	


}
