package kcs.controller;

import org.springframework.stereotype.Controller;

import kcs.service.KeepService;

@Controller
public class KeepController {
	private KeepService service;

	public KeepController(KeepService service) {
		super();
		this.service = service;
	}

	// 여기부터 RequestMapping 처리
}
