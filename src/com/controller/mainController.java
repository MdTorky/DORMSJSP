package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

}
