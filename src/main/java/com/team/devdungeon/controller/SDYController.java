package com.team.devdungeon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.service.SDYService;


@Controller
public class SDYController {

	@Autowired
	private SDYService SDYService;
	
	@GetMapping("/sim")
	public ModelAndView Recipe() {
		ModelAndView mv = new ModelAndView("sim");
		
		
		
		return mv;
	}
	
}
