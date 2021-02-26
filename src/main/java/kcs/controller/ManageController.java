package kcs.controller;

import org.springframework.stereotype.Controller;

import kcs.service.ManageService;

@Controller
public class ManageController {
	private ManageService service;

	public ManageController(ManageService service) {
		super();
		this.service = service;
	}

	// 여기부터 RequestMapping 처리
}
