//package com.foti_java.controller.admin;
//
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.foti_java.model.Product;
//import com.foti_java.repository.AccountRepositoty;
//import com.foti_java.repository.ProductRepository;
//import com.foti_java.service.SendMailService;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//@Controller
//@RequestMapping("admin")
//public class AdminProductManagerController {
//	@Autowired
//	ProductRepository productRepository;
//	List<Product> listProducts;
//	@Autowired
//	HttpServletRequest req;
//	@Autowired
//	SendMailService mailService;
//	@Autowired
//	AccountRepositoty accountRepository;
//
//	@RequestMapping("productmanager")
//	public String productManager(Model model) {
//		listProducts = productRepository.findAllByActiveAndStatus(false, true);
//		model.addAttribute("products", listProducts);
//		return "admin/pages/productmanager";
//	}
//
//	@GetMapping({ "productmanager/false/{id}", "productmanager/true/{id}" })
//	public String getCheck(@PathVariable("id") Integer id) {
//		Optional<Product> entity = productRepository.findById(id);
//		entity.get().setId(id);
//		String emailSuprot = "khaduong28052004@gmail.com";
//		String subject = "Thông báo khóa tài khoản";
//		String content;
//		String data = req.getParameter("liDo1");
//		if (req.getRequestURI().contains("false")) {
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
//					+ entity.get().getAccount().getFullname() + "</h1>" + "</div>"
//					+ "<h3>Chúng tôi rất tiếc phải thông báo rằng sản phẩm của bạn không được cấp quyền hoạt động.</h3>"
//					+ "<p><strong>Lý do:</strong> " + data + "</p>"
//					+ "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>"
//					+ "<p>Đội ngũ hỗ trợ khách hàng</p>" + "<a href='mailto:" + emailSuprot
//					+ "' class='button'>Liên hệ hỗ trợ</a>" + "<div class='footer'>"
//					+ "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" + "</div>" + "</div>" + "</body>"
//					+ "</html>";
//			mailService.push(entity.get().getAccount().getEmail(), subject, content);
//		}
//		if (req.getRequestURI().contains("true")) {
//			entity.get().setActive(true);
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
//					+ entity.get().getAccount().getFullname() + "</h1>" + "</div>" + "<h3>Sản phẩm đã được duyệt.</h3>"
//					+ "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>"
//					+ "<p>Đội ngũ hỗ trợ khách hàng</p>" + "<a href='mailto:" + emailSuprot
//					+ "' class='button'>Liên hệ hỗ trợ</a>" + "<div class='footer'>"
//					+ "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" + "</div>" + "</div>" + "</body>"
//					+ "</html>";
//			mailService.push(entity.get().getAccount().getEmail(), subject, content);
//		}
//		productRepository.saveAndFlush(entity.get());
//		return "redirect:/admin/productmanager";
//	}
//}
