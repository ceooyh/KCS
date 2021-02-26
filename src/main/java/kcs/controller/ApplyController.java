package kcs.controller;

import org.springframework.stereotype.Controller;

import kcs.service.ApplyService;

@Controller
public class ApplyController {
	private ApplyService service;

	public ApplyController(ApplyService service) {
		super();
		this.service = service;
	}
	
	// 여기부터 RequestMapping 처리
}
