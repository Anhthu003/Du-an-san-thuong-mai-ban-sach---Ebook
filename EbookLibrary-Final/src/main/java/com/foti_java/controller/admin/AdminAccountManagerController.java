//package com.foti_java.controller.admin;
//
//import java.util.Iterator;
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.foti_java.model.Account;
//import com.foti_java.model.RoleDetail;
//import com.foti_java.repository.AccountRepositoty;
////import com.foti_java.service.SendMailService;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@Controller
//@RequestMapping("admin")
//public class AdminAccountManagerController {
//	@Autowired
//	AccountRepositoty accountRepository;
//	List<Account> listAccount;
//	@Autowired
//	SendMailService mailService;
//	@Autowired
//	HttpServletRequest req;
//
//	@RequestMapping("accountmanager")
//	public String accountManager(Model model) {
//		listAccount = accountRepository.findAllListAccountNotAdmin();
//		model.addAttribute("listAccount", listAccount);
//		return "admin/pages/accountmanager";
//	}
//
//	@GetMapping("accountmanager/status/{id}")
//	public String getMethodName(Model model, @PathVariable("id") Integer id) {
//		Optional<Account> entity = accountRepository.findById(id);
//		entity.get().setId(id);
//		String data = req.getParameter("liDo1");
//		String emailSuprot = "khaduong28052004@gmail.com";
//		String subject = "Thông báo khóa tài khoản";
//		String content;
//		if (entity.get().isStatus()) {
//			entity.get().setStatus(false);
//			content = "<!DOCTYPE html>" + "<html lang='vi'>" + "<head>" + "<meta charset='UTF-8'>"
//					+ "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" + "<style>"
//					+ "body { font-family: Arial, sans-serif; background-color: #f7f7f7; margin: 0; padding: 0; }"
//					+ ".container { max-width: 600px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); }"
//					+ ".header { border-bottom: 1px solid #e0e0e0; padding-bottom: 20px; margin-bottom: 20px; }"
//					+ "h1 { color: #333; font-size: 24px; }" + "p { color: #555; font-size: 16px; line-height: 1.5; }"
//					+ ".footer { margin-top: 40px; font-size: 14px; color: #999; text-align: center; }"
//					+ ".button { display: inline-block; padding: 10px 20px; margin-top: 20px; font-size: 16px; color: #fff; background-color: #007BFF; border-radius: 5px; text-decoration: none; }"
//					+ ".button:hover { background-color: #0056b3; }" + "</style>" +
//
//					"</head>" + "<body>" + "<div class='container'>" + "<div class='header'>" + "<h1>Xin chào, "
//					+ entity.get().getFullname() + "</h1>" + "</div>"
//					+ "<p>Chúng tôi rất tiếc phải thông báo rằng tài khoản của bạn đã bị hủy. Chúng tôi cảm ơn vì sự ủng hộ của bạn trong thời gian qua.</p>"
//					+ "<p><strong>Lý do tài khoản bị khóa:</strong> " + data + "</p>"
//					+ "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>"
//					+ "<p>Cảm ơn bạn đã thông cảm và kiên nhẫn.</p>" + "<p>Trân trọng,</p>"
//					+ "<p>Đội ngũ hỗ trợ khách hàng</p>" + "<a href='mailto:" + emailSuprot
//					+ "' class='button'>Liên hệ hỗ trợ</a>" + "<div class='footer'>"
//					+ "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" + "</div>" + "</div>" + "</body>"
//					+ "</html>";
//		} else {
//			entity.get().setStatus(true);
//			content = "<!DOCTYPE html>" + "<html lang='vi'>" + "<head>" + "<meta charset='UTF-8'>"
//					+ "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" + "<style>"
//					+ "body { font-family: Arial, sans-serif; background-color: #f7f7f7; margin: 0; padding: 0; }"
//					+ ".container { max-width: 600px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); }"
//					+ ".header { border-bottom: 1px solid #e0e0e0; padding-bottom: 20px; margin-bottom: 20px; }"
//					+ "h1 { color: #333; font-size: 24px; }" + "p { color: #555; font-size: 16px; line-height: 1.5; }"
//					+ ".footer { margin-top: 40px; font-size: 14px; color: #999; text-align: center; }"
//					+ ".button { display: inline-block; padding: 10px 20px; margin-top: 20px; font-size: 16px; color: #fff; background-color: #007BFF; border-radius: 5px; text-decoration: none; }"
//					+ ".button:hover { background-color: #0056b3; }" + "</style>" +
//
//					"</head>" + "<body>" + "<div class='container'>" + "<div class='header'>" + "<h1>Xin chào, "
//					+ entity.get().getFullname() + "</h1>" + "</div>" + "<p>Tài khoản đã được mở.</p>"
//					+ "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>"
//					+ "<p>Đội ngũ hỗ trợ khách hàng</p>" + "<a href='mailto:" + emailSuprot
//					+ "' class='button'>Liên hệ hỗ trợ</a>" + "<div class='footer'>"
//					+ "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" + "</div>" + "</div>" + "</body>"
//					+ "</html>";
//		}
//		mailService.push(entity.get().getEmail(), subject, content);
//		accountRepository.saveAndFlush(entity.get());
//		return "redirect:/admin/accountmanager";
//	}
//
//}
