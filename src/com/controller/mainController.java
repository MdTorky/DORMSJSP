package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping("/applied")
	public ModelAndView applied() {
		ModelAndView model = new ModelAndView("Applied");
		return model;
	}

	@RequestMapping("/myParcel")
	public ModelAndView myParcel() {
		ModelAndView model = new ModelAndView("myParcel");
		return model;
	}

	@RequestMapping("/studentProfile")
	public ModelAndView studentProfile() {
		ModelAndView model = new ModelAndView("studentProfile");
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
	@RequestMapping("/managerCheckInApplications")
	public ModelAndView managerCheckInApplications() {
		ModelAndView model = new ModelAndView("managerCheckInApplications");
		return model;
	}

	@RequestMapping("/managerCheckOutApplications")
	public ModelAndView managerCheckOutApplications() {
		ModelAndView model = new ModelAndView("managerCheckOutApplications");
		return model;
	}

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

	@RequestMapping("/accommodationReport")
	public ModelAndView accommodationReport() {
		ModelAndView model = new ModelAndView("accommodationReport");
		return model;
	}

	@RequestMapping("/managerProfile")
	public ModelAndView managerProfile() {
		ModelAndView model = new ModelAndView("managerProfile");
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
	public String transaction(@RequestParam("payment_for") String payment_for) {
		int rowAffected = 0;
		
		if(payment_for.equals("Rent")) {
			try {
				Connection conn = DbConnect.openConnection();
				
				String sql = "Update checkinapplication Set checkInApplicationStatus = ? Where id= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, "Paid");
				ps.setInt(2, 2);
				
				rowAffected = ps.executeUpdate();
				
			}catch (SQLException ex) {
				ex.printStackTrace();
			}
			
			return "studentSuccessfullPage";
		}
		
		else if(payment_for.equals("Parcels")) {
			try {
				Connection conn = DbConnect.openConnection();
				
				String sql = "Update parcel Set parcelHoldingFees = ? Where id= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, 0);
				ps.setInt(2, 2);
				
				rowAffected = ps.executeUpdate();
				
			}catch (SQLException ex) {
				ex.printStackTrace();
			}
			
			return "studentSuccessfullPage";
			
		}
		
		else if(payment_for.equals("Personal Storage")) {
			try {
				Connection conn = DbConnect.openConnection();
				
				String sql = "Update storage Set storageStatus = ? Where storageId= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "Paid");
				ps.setInt(2, 2);
				
				rowAffected = ps.executeUpdate();
				
			}catch (SQLException ex) {
				ex.printStackTrace();
			}
			
			return "studentSuccessfullPage";
			
		}
		else if(payment_for.equals("Facilities")) {
			try {
				Connection conn = DbConnect.openConnection();
				
				String sql = "Update facilityapplication Set facilityApplicationStatus = ? Where id= ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "Paid");
				ps.setInt(2, 2);
				
				rowAffected = ps.executeUpdate();
				
			}catch (SQLException ex) {
				ex.printStackTrace();
			}
			
			return "studentSuccessfullPage";
			
		}
		
		return "Row Affected: " + rowAffected;
	}

}
