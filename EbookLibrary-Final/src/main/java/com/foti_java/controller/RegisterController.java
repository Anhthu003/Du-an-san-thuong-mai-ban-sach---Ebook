//package com.foti_java.controller;
//
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.foti_java.model.Account;
//import com.foti_java.model.MailSender;
//import com.foti_java.model.Role;
//import com.foti_java.model.RoleDetail;
//import com.foti_java.repository.AccountRepositoty;
//import com.foti_java.repository.CartDetailRepository;
//import com.foti_java.repository.RoleDetailRepository;
//import com.foti_java.repository.RoleRepository;
//import com.foti_java.service.SendMailService;
//import com.foti_java.service.SessionService;
//import com.foti_java.utils.MD5Encoder;
//import com.foti_java.utils.RanDom;
//@Controller
////@RequestMapping("user")
//public class RegisterController {
//
//	@Autowired
//	AccountRepositoty accountRepository;
//	@Autowired
//	SessionService sessionService;
//	@Autowired
//	RoleDetailRepository roleDetailRepository;
//	@Autowired
//	RoleRepository roleRepository;
//	@Autowired
//	SendMailService sendMailService;
//	@Autowired
//	CartDetailRepository cartDetailRepository;
//	public String error = "";
//	public String errorR = "";
//	public String errorE = "";
//	String maOTP = "";
//	String maOTPOld = "";
//	Account account = null;
//	String email = "";
//	@PostMapping("register")
//	public String register(Model model, @RequestParam("gmail") String mail, @RequestParam("fullName") String fullname,
//			@RequestParam("userName") String user, @RequestParam("password") String password) {
//		List<Account> accountList = accountRepository.findAll();
//		for (Account account : accountList) {
//			if (account.getEmail().equals(mail)) {
//				errorR = "Email này đã được sử dụng";
//				model.addAttribute("errorR", errorR);
//				model.addAttribute("page", "rg");
//				return "client/login";
//			}
//			if (account.getUsername().equals(user)) {
//				errorR = "Tài khoản này đã được sử dụng";
//				model.addAttribute("errorR", errorR);
//				model.addAttribute("page", "rg");
//				return "client/login";
//			}
//		}
//		maOTP = RanDom.generateRandomCode(6);
//		maOTPOld = maOTP;
//		email = mail;
//		errorR = "";
//		SendOTP(email);
//		System.out.println("Mã OTP" + maOTP);
//		System.out.println("Mã OTP Old" + maOTPOld);
//		changeOTP();
//		model.addAttribute("gmail",mail);
//	    account = new Account();
//		account.setUsername(user);
//		account.setFullname(fullname);
//		account.setPassword(MD5Encoder.encode(password));
//		account.setEmail(mail);
//		account.setStatus(true);
////		accountRepository.saveAndFlush(account);
////		System.out.println(account.getFullname());
////		List<Role> role = roleRepository.findAll();
////		RoleDetail roleDetail = new RoleDetail();
////		roleDetail.setAccount(account);
////		roleDetail.setRegistrationDate(null);
////		roleDetail.setRole(role.get(3));
////		roleDetailRepository.saveAndFlush(roleDetail);
//		model.addAttribute("errorR", "Đăng ký thành công! Vui lòng đăng nhập.");
//		return "client/SendMailDo";
//	}
//    public String errorM=""; 
//	@GetMapping("/resendOtp/{gmail}")
//	public String resendOtp(Model model,@PathVariable(name = "gmail") String mail) {
//		maOTP = RanDom.generateRandomCode(6);
//		maOTPOld = maOTP;
//		SendOTP(mail);
//		changeOTP();
//		errorM = "Đã gửi lại vui lòng kiểm tra mail! ";
//		model.addAttribute("error",errorM);
//		return "client/SendMailDo";
//	}
//	
//	@PostMapping("/xacnhan")
//	public String xacNhan(Model model,@RequestParam("otp") String optl ) {
//		if (optl.equals(maOTP)) {		
//			accountRepository.saveAndFlush(account);
//			List<Role> role = roleRepository.findAll();
//			RoleDetail roleDetail = new RoleDetail();
//			roleDetail.setAccount(account);
//			roleDetail.setRegistrationDate(null);
//			roleDetail.setRole(role.get(2));
//			roleDetailRepository.saveAndFlush(roleDetail);
//			errorM = "đăng ký thành công!";
//			model.addAttribute("error",errorM);
//		
//			return "client/login";
//		}
//		errorM = "Xác nhận thất bại!";
//		model.addAttribute("error",errorM);
//		model.addAttribute("gmail",email);
//		return "client/SendMailDo";
//	}
//	
//	public void changeOTP() {
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				int second = 60;
//				boolean shouldContinue = true;
//				while (shouldContinue) {
//					try {
//						Thread.sleep(1000);
//						second--;
//						if (second == 0) {
//
//							maOTP = RanDom.generateRandomCode(6);
//							while (shouldContinue) {
//								if (maOTP.equals(maOTPOld)) {
//									shouldContinue = false;
//									System.out.println("OTP đã hết hạn");
//								} else {
//									maOTP = RanDom.generateRandomCode(6);
//								}
//							}
//						}
//					} catch (InterruptedException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		}).start();
//	}	
//	
//	public void SendOTP(String email) {
//		String subject = "Xác nhận yêu cầu quên mật khẩu - Mã OTP";
//		String content = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n"
//				+ "    <meta charset=\"UTF-8\">\r\n"
//				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
//				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
//				+ "    <title>Xác nhận yêu cầu quên mật khẩu</title>\r\n" + "</head>\r\n" + "<body>\r\n"
//				+ "    <div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;\">\r\n"
//				+ "        <h2 style=\"color: #333333;\">Xác nhận yêu cầu quên mật khẩu</h2>\r\n"
//				+ "        <p style=\"color: #666666;\">Xin chào, </p>\r\n"
//				+ "        <p style=\"color: #666666;\">Bạn đã yêu cầu đặt lại mật khẩu cho tài khoản của mình. Dưới đây là mã OTP để xác nhận quá trình này:</p>\r\n"
//				+ "        <p style=\"background-color: #f2f2f2; padding: 10px; font-size: 15px; font-weight: bold; color: #333333;\">Mã OTP của bạn là : ["
//				+ maOTP + "]</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Xin vui lòng nhập mã này vào trang đặt lại mật khẩu để tiếp tục quá trình đặt lại mật khẩu.</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Lưu ý rằng mã OTP sẽ hết hạn sau 1 phút kể từ lúc nhận được mail.</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Vui lòng giữ email này riêng tư và không chia sẻ với bất kỳ ai khác. Đây là thông tin quan trọng và được bảo vệ theo chính sách bảo mật của chúng tôi.</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Trân trọng,</p>\r\n"
//				+ "        <p style=\"color: #666666;\">[Cty TNHH Ebook-Library]</p>\r\n" + "    </div>\r\n"
//				+ "</body>\r\n" + "</html>\r\n" + "";
//
//		MailSender mailSender = new MailSender(email, subject, content);
//		sendMailService.push(mailSender);
//	}
//	
//}
