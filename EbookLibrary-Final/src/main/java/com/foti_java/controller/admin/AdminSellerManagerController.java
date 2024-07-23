//package com.foti_java.controller.admin;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.foti_java.model.Account;
//import com.foti_java.model.Bill;
//import com.foti_java.model.BillDetail;
//import com.foti_java.model.Role;
//import com.foti_java.model.RoleDetail;
//import com.foti_java.model.SellerStatistics;
//import com.foti_java.model.Voucher;
//import com.foti_java.repository.AccountRepositoty;
//import com.foti_java.repository.BillDetailRepository;
//import com.foti_java.repository.BillRepositoty;
//import com.foti_java.repository.RoleDetailRepository;
//import com.foti_java.repository.RoleRepository;
//import com.foti_java.repository.VoucherRepository;
//import com.foti_java.service.SendMailService;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//
//@Controller
//@RequestMapping("admin")
//public class AdminSellerManagerController {
//	@Autowired
//	BillDetailRepository billDetailRepository;
//	@Autowired
//	AccountRepositoty accountRepository;
//	@Autowired
//	BillRepositoty billRepository;
//	@Autowired
//	RoleDetailRepository roleDTRepository;
//	@Autowired
//	RoleRepository roleRepository;
//	@Autowired
//	VoucherRepository voucherRepository;
//	@Autowired
//	SendMailService mailService;
//	@Autowired
//	HttpServletRequest req;
//	List<Voucher> listVoucher = new ArrayList<>();
//	List<Bill> listBill = new ArrayList<>();
//	List<BillDetail> listBillDetails = new ArrayList<>();
//
//	@RequestMapping("sellermanager")
//	public String requestMethodName(Model model) {
//		List<Object[]> list = billRepository.TK_SELLER_IN_ACCOUNT();
//		List<SellerStatistics> statisticsList = new ArrayList<>();
//
//		for (Object[] objects : list) {
//			SellerStatistics stats = new SellerStatistics();
//			stats.setId(Integer.parseInt(objects[0].toString()));
//			stats.setUsername(objects[1].toString());
//			stats.setFullname(objects[2].toString());
//			stats.setCountTD(Integer.parseInt(objects[3].toString()));
//			stats.setCountDanhGia(Integer.parseInt(objects[4].toString()));
//			stats.setCountDaBan(Integer.parseInt(objects[5].toString()));
//			stats.setLoiNhuan(Float.parseFloat(objects[6].toString()));
//			stats.setDoanhThu(Float.parseFloat(objects[7].toString()));
//			stats.setAvgDanhGia(Float.parseFloat(objects[8].toString()));
//			stats.setStatus(Boolean.parseBoolean(objects[9].toString()));
//			statisticsList.add(stats);
//		}
//		List<Account> listCheckSeller = accountRepository.findAllCheckSeller();
//
//		model.addAttribute("statisticsList", statisticsList);
//		model.addAttribute("listCheckSeller", listCheckSeller);
//
//		return "admin/pages/sellermanager";
//	}
//
//	@GetMapping("/sellermanager/id/{id}")
//	public String getMethodName1(@PathVariable("id") Integer id,
//			@RequestParam(value = "liDo1", defaultValue = "") String data) {
//		System.out.println("lí do: " + data);
//		Optional<Account> entity = accountRepository.findById(id);
//		entity.get().setId(id);
//		String emailSuprot = "khaduong28052004@gmail.com";
//		String subject = "Thông báo khóa tài khoản";
//		String content;
//		if (entity.get().isStatus()) {
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
//		entity.get().setStatus(!entity.get().isStatus());
//		accountRepository.saveAndFlush(entity.get());
//		return "redirect:/admin/sellermanager";
//	}
//
//	@GetMapping("/sellermanager/checkSeller/{id}")
//	public String getMethodName(@PathVariable("id") Integer id) {
//		String emailSuprot = "khaduong28052004@gmail.com";
//		String subject = "Thông báo khóa tài khoản";
//		String content;
//		boolean status = Boolean.parseBoolean(req.getParameter("status"));
//		String data = req.getParameter("liDo2");
//		if (status) {
//			Optional<Account> entity = accountRepository.findById(id);
//			if (entity.isPresent()) {
//				Account account = entity.get();
//				Optional<Role> roleOpt = roleRepository.findById(2);
//				if (roleOpt.isPresent()) {
//					RoleDetail roleDetails = new RoleDetail();
//					roleDetails.setRegistrationDate(new Date());
//					roleDetails.setRole(roleOpt.get());
//					roleDetails.setAccount(account);
//					roleDTRepository.saveAndFlush(roleDetails);
//				}
//				content = "<!DOCTYPE html>" + "<html lang='vi'>" + "<head>" + "<meta charset='UTF-8'>"
//						+ "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" + "<style>"
//						+ "body { font-family: Arial, sans-serif; background-color: #f7f7f7; margin: 0; padding: 0; }"
//						+ ".container { max-width: 600px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); }"
//						+ ".header { border-bottom: 1px solid #e0e0e0; padding-bottom: 20px; margin-bottom: 20px; }"
//						+ "h1 { color: #333; font-size: 24px; }"
//						+ "p { color: #555; font-size: 16px; line-height: 1.5; }"
//						+ ".footer { margin-top: 40px; font-size: 14px; color: #999; text-align: center; }"
//						+ ".button { display: inline-block; padding: 10px 20px; margin-top: 20px; font-size: 16px; color: #fff; background-color: #007BFF; border-radius: 5px; text-decoration: none; }"
//						+ ".button:hover { background-color: #0056b3; }" + "</style>" +
//
//						"</head>" + "<body>" + "<div class='container'>" + "<div class='header'>" + "<h1>Xin chào, "
//						+ entity.get().getFullname() + "</h1>" + "</div>" + "<h3>Tài khoản đã được duyệt.</h3>"
//						+ "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>"
//						+ "<p>Đội ngũ hỗ trợ khách hàng</p>" + "<a href='mailto:" + emailSuprot
//						+ "' class='button'>Liên hệ hỗ trợ</a>" + "<div class='footer'>"
//						+ "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" + "</div>" + "</div>"
//						+ "</body>" + "</html>";
//				mailService.push(entity.get().getEmail(), subject, content);
//			}
//		} else {
//			Optional<Account> account = accountRepository.findById(id);
//			account.get().setId(id);
//			account.get().setNumberCitizenIdentification(null);
//			accountRepository.saveAndFlush(account.get());
//
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
//					+ account.get().getFullname() + "</h1>" + "</div>"
//					+ "<h3>Chúng tôi rất tiếc phải thông báo rằng tài khoản của bạn không được cấp quyền hoạt động.</h3>"
//					+ "<p><strong>Lý do:</strong> " + data + "</p>"
//					+ "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>"
//					+ "<p>Đội ngũ hỗ trợ khách hàng</p>" + "<a href='mailto:" + emailSuprot
//					+ "' class='button'>Liên hệ hỗ trợ</a>" + "<div class='footer'>"
//					+ "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" + "</div>" + "</div>" + "</body>"
//					+ "</html>";
//			mailService.push(account.get().getEmail(), subject, content);
//		}
//
//		return "redirect:/admin/sellermanager";
//	}
//
//}
