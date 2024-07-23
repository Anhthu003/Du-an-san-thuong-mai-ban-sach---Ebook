//package com.foti_java.controller.account;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.foti_java.model.Account;
//import com.foti_java.model.MailSender;
//import com.foti_java.repository.AccountRepositoty;
//import com.foti_java.service.SendMailService;
//import com.foti_java.utils.MD5Encoder;
//import com.foti_java.utils.RanDom;
//
//@Controller
//public class ForgotPassWordController {
//	@Autowired
//	AccountRepositoty accountRepositoty;
//	@Autowired
//	SendMailService sendMailService;
//	String maOTP = "";
//	String maOTPOld = "";
//	Account account = null;
//	String email = "";
//
//	@PostMapping("/forgotpassword")
//	public String postMail(Model model, @RequestParam("email") String e) {
//		Account acc = accountRepositoty.findByEmail(e);
//		account = acc;
//		maOTP = RanDom.generateRandomCode(6);
//		maOTPOld = maOTP;
//		email = e;
//		if (acc != null) {
//			SendOTP(email);
//			System.out.println("Mã OTP" + maOTP);
//			System.out.println("Mã OTP Old" + maOTPOld);
//			changeOTP();
//			return "client/updatePassword";
//		} else {
//			model.addAttribute("errorF", "Email không tồn tại");
//			model.addAttribute("page", "ft");
//			return "client/login";
//		}
//
//	}
//
//	@PostMapping("/forgotpassword/changepassword")
//	public String changePassWord(@RequestParam("maOTP") String ma, @RequestParam("password") String passWord,
//			@RequestParam("confirm") String confirm, Model model) {
//		if (!maOTP.equals(maOTPOld) || !maOTPOld.equals(ma)) {
//			model.addAttribute("errorF", "Sai OTP hoặc OTP đã hết hạn");
//			return "client/updatePassword";
//		} else if (!passWord.equals(confirm)) {
//			model.addAttribute("errorF", "Xác nhận mật khẩu không đúng");
//			return "client/updatePassword";
//		} else {
//			account.setPassword(MD5Encoder.encode(passWord));
//			accountRepositoty.save(account);
//			return "redirect:/login";
//		}
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
//				+ "        <p style=\"color: #666666;\">Xin chào, " + account.getFullname() + "</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Bạn đã yêu cầu đặt lại mật khẩu cho tài khoản của mình. Dưới đây là mã OTP để xác nhận quá trình này:</p>\r\n"
//				+ "        <p style=\"background-color: #f2f2f2; padding: 10px; font-size: 15px; font-weight: bold; color: #333333;\">Mã OTP của bạn là : ["
//				+ maOTP + "]</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Vui lòng giữ email này riêng tư và không chia sẻ với bất kỳ ai khác. Đây là thông tin quan trọng và được bảo vệ theo chính sách bảo mật của chúng tôi.</p>\r\n"
//				+ "        <p style=\"color: #666666;\">Trân trọng,</p>\r\n"
//				+ "        <p style=\"color: #666666;\">[Cty TNHH Ebook-Library]</p>\r\n" + "    </div>\r\n"
//				+ "</body>\r\n" + "</html>\r\n" + "";
//
//		MailSender mailSender = new MailSender(email, subject, content);
//		sendMailService.push(mailSender);
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
//}
