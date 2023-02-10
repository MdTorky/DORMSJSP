package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class mainController {

	@RequestMapping("/register")
	public ModelAndView getHome() {
		ModelAndView model = new ModelAndView("registration");
		return model;
	}

	@RequestMapping("/login")
	public ModelAndView getSigin() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}

}
