package com.foti_java.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BankController {
	@GetMapping("/user/bank")
	public String getBank() {
		return "client/banks";
	}
}
