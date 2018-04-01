package com.anup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {


	@RequestMapping(value = "/")
	public String error() {
		return "redirect:/View/UnSecured/login.jsf";
	}

}
