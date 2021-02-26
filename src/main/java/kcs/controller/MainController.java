package kcs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("indexView.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/infoView.do")
	public String info() {
		return "main/info";
	}
}
