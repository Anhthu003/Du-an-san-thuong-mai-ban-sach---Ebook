package com.foti_java.controller.account;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.service.SessionService;
import com.foti_java.utils.MD5Encoder;

@Controller
@RequestMapping("user")
public class ChangePassController {
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("changepass")
	public String getChangePass() {
		return "client/changPass";
	}
	
	@PostMapping("changepass")
	public String changePassword(Model model, @RequestParam("password") String password,@RequestParam("repassword") String rePassword1,
			@RequestParam("repassword1") String rePassword) {
		String pass= MD5Encoder.encode(password);
		if (!rePassword.equals(rePassword1)) {
			model.addAttribute("error", "Mật khẩu không đúng.");
			return "client/changPass";
		}
		Account account = sessionService.getAttribute("account");
		if (!account.getPassword().equals(pass)) {
			model.addAttribute("error", "Mật khẩu không khớp.");
			return "client/changPass";
		}
		
		account.setPassword(MD5Encoder.encode(rePassword));
		accountRepositoty.saveAndFlush(account);
		model.addAttribute("error", " Đổi mật khẩu thành công.");
		sessionService.setAttribute("account", account);
		return "client/changPass";
	}

}

