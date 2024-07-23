//package com.foti_java.controller.seller;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import com.foti_java.model.Account;
//import com.foti_java.model.Bill;
//import com.foti_java.model.BillDetail;
//import com.foti_java.model.OrderStatus;
//import com.foti_java.model.Product;
//import com.foti_java.model.Voucher;
//import com.foti_java.model.VoucherDetail;
//import com.foti_java.repository.AccountRepositoty;
//import com.foti_java.repository.BillDetailRepository;
//import com.foti_java.repository.BillRepositoty;
//import com.foti_java.repository.OrderStatusRepository;
//import com.foti_java.repository.ProductRepository;
//import com.foti_java.repository.VoucherDetailRepository;
//import com.foti_java.repository.VoucherRepository;
//import com.foti_java.service.SendMailService;
//import com.foti_java.service.SessionService;
//
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//
//@Controller
//@RequestMapping("seller")
//public class SellerOrderManagerController {
//	@Autowired
//	SessionService sessionService;
//	@Autowired
//	SendMailService mailService;
//	@Autowired
//	BillDetailRepository billDetailRepository;
//	@Autowired
//	HttpServletRequest req;
//	@Autowired
//	AccountRepositoty accountRepositoty;
//	@Autowired
//	BillRepositoty billRepository;
//	@Autowired
//	ProductRepository productRepository;
//	@Autowired
//	VoucherDetailRepository voucherDetailRepository;
//	@Autowired 
//	VoucherRepository voucherRepository;
//	@Autowired
//	OrderStatusRepository orderStatusRepository;
//	Account account = new Account(); 
//	@GetMapping("ordermanager")
//	public String orderManager(Model model) {
//		 account = sessionService.getAttribute("account");
//
//	    List<Bill> listBill = billRepository.findByIdAccount(account.getId());
//	    List<BillDetail> listBillDetails = billDetailRepository.findAllByAccountId(account.getId());
//
//	    model.addAttribute("listBillDetails", listBillDetails);
//		return "seller/pages/ordermanager";
//	}
//	@GetMapping("ordermanager/xacNhan")
//	public String xacNhan(Model model,@RequestParam("id") Integer id) {
//		
//		Optional<BillDetail> billDetails =  billDetailRepository.findById(id);
//		List<OrderStatus> order = orderStatusRepository.findAll();
//		billDetails.get().setStatus(true);
////		billDetails.get().setOrderStatus(order);
//		billDetailRepository.saveAndFlush(billDetails.get());
////		Optional<Bill> bill = billRepository.findById(id);
////		BillDetail billDT = new BillDetail();
////		double totalPrice = 0;
////		boolean status = false;
////		Bill newBill = new Bill();
////		Product product =  new Product();
////		int tongSL = 0;
////		double totalPriceShipping = 0;
////		for(BillDetail billDetail : listBillDetails) {
////			if(billDetail.getProduct().getAccount().getId() == account.getId() && billDetail.getBill()== bill.get()) {
////				billDetail.setStatus(true);
////				totalPrice += billDetail.getPrice() * billDetail.getQuantity();
////				billDT = billDetail;
////				product = billDetail.getProduct();
////				tongSL = product.getQuantity();
////				product.setQuantity(tongSL - billDetail.getQuantity());
////				productRepository.saveAndFlush(product);
////				}
////			if(billDetail.isActive()) {
////				status=true;
////			}
////		}
////		
////		newBill = bill.get();
////		totalPriceShipping = billDT.getPriceShipping();
////		newBill.setTotalPrice(totalPrice);
////		newBill.setStatus(status);
////		newBill.setPriceShipping(totalPriceShipping + newBill.getPriceShipping());
////		if(newBill.isStatus()) {
////			newBill.setPriceShipping(newBill.getPriceShipping() - newBill.getDiscount());
////			newBill.setTotalPrice(newBill.getPriceShipping() + newBill.getTotalPrice());
////		}
////		billRepository.saveAndFlush(newBill);
//		
//	
//
//		String subject = "Chúc mừng gửi đơn hàng thành công";
//		String content = "<!DOCTYPE html>" +
//		        "<html lang='vi'>" +
//		        "<head>" +
//		        "<meta charset='UTF-8'>" +
//		        "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
//		        "<style>" +
//		        "body { font-family: Arial, sans-serif; background-color: #f7f7f7; margin: 0; padding: 0; }" +
//		        ".container { max-width: 600px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); }" +
//		        ".header { border-bottom: 1px solid #e0e0e0; padding-bottom: 20px; margin-bottom: 20px; }" +
//		        "h1 { color: #333; font-size: 24px; }" +
//		        "p { color: #555; font-size: 16px; line-height: 1.5; }" +
//		        ".footer { margin-top: 40px; font-size: 14px; color: #999; text-align: center; }" +
//		        ".button { display: inline-block; padding: 10px 20px; margin-top: 20px; font-size: 16px; color: #fff; background-color: #007BFF; border-radius: 5px; text-decoration: none; }" +
//		        ".button:hover { background-color: #0056b3; }" +
//		        "</style>" +
//		        "</head>" +
//		        "<body>" +
//		        "<div class='container'>" +
//		        "<div class='header'>" +
//		        "<h1>Xin chào, " + billDetails.get().getBill().getAccount().getFullname() + "</h1>" +
//		        "</div>" +
//		        "<p>Chúng tôi rất vui mừng thông báo rằng đơn hàng của bạn đã được gửi thành công! Cảm ơn bạn đã mua sắm với chúng tôi.</p>" +
//		        "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>" +
//		        "<p>Cảm ơn bạn đã tin tưởng và lựa chọn dịch vụ của chúng tôi.</p>" +
//		        "<p>Trân trọng,</p>" +
//		        "<p>Đội ngũ hỗ trợ khách hàng</p>" +
//		        "<a href='mailto:" + account.getEmail() + "' class='button'>Liên hệ hỗ trợ</a>" +
//		        "<div class='footer'>" +
//		        "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" +
//		        "</div>" +
//		        "</div>" +
//		        "</body>" +
//		        "</html>";
//	    mailService.push(billDetails.get().getBill().getAccount().getEmail(),subject,content);
//		
//		return "redirect:/seller/ordermanager";
//	}
//	@PostMapping("ordermanager/huy")
//	public String huy(Model model,@RequestParam("id") Integer id) {
//		List<BillDetail> listBillDetails = billDetailRepository.findAll();
//		Optional<BillDetail> billDetails = billDetailRepository.findById(id);
//		List<Bill> listBill = billRepository.findAll();
//		List<Product> listProducts = productRepository.findAll();
//		
//		boolean statusPriceShipping = false;
//		double tienShip = 0;
//		int soLuongSP = 0;
//		
//		VoucherDetail maVoucherDetail;
//		Voucher maVoucher;
//		billDetails.get().setStatus(true);
//		billDetails.get().setActive(true);
//		soLuongSP = billDetails.get().getQuantity();
//		tienShip = billDetails.get().getPriceShipping();
//		maVoucherDetail = billDetails.get().getVoucherDetail();
//		billDetails.get().setVoucherDetail(null);
//		billDetailRepository.saveAndFlush(billDetails.get());
//		
//		double tongTien = (billDetails.get().getPrice() * billDetails.get().getQuantity()) - billDetails.get().getDiscount() + tienShip;
//		
//		for(Bill bill : listBill) {
//			if(bill == billDetails.get().getBill()) {
//				bill.setPriceShipping(bill.getPriceShipping() - tienShip);
//				bill.setTotalPrice((bill.getTotalPrice() - tongTien));
//				bill.setQuantity(bill.getQuantity() - soLuongSP);
//				billRepository.saveAndFlush(bill);
//			}
//		}
//		for(Product product : listProducts) {
//			if(product == billDetails.get().getProduct()) {
//				product.setQuantity(product.getQuantity() + soLuongSP);
//				productRepository.saveAndFlush(product);
//			}
//		}
//		maVoucher = maVoucherDetail.getVoucher();
//		maVoucher.setQuantity(maVoucher.getQuantity() + 1);
//		voucherRepository.saveAndFlush(maVoucher);
//		voucherDetailRepository.delete(maVoucherDetail);
//		
//		String contentCancel = req.getParameter("contentCancel" + id);
//		String subject = "Thông báo hủy đơn hàng";
//		String content = "<!DOCTYPE html>" +
//			    "<html lang='vi'>" +
//			    "<head>" +
//			    "<meta charset='UTF-8'>" +
//			    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
//			    "<style>" +
//			    "body { font-family: Arial, sans-serif; background-color: #f7f7f7; margin: 0; padding: 0; }" +
//			    ".container { max-width: 600px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); }" +
//			    ".header { border-bottom: 1px solid #e0e0e0; padding-bottom: 20px; margin-bottom: 20px; }" +
//			    "h1 { color: #333; font-size: 24px; }" +
//			    "p { color: #555; font-size: 16px; line-height: 1.5; }" +
//			    ".footer { margin-top: 40px; font-size: 14px; color: #999; text-align: center; }" +
//			    ".button { display: inline-block; padding: 10px 20px; margin-top: 20px; font-size: 16px; color: #fff; background-color: #007BFF; border-radius: 5px; text-decoration: none; }" +
//			    ".button:hover { background-color: #0056b3; }" +
//			    "</style>" +
//			    "</head>" +
//			    "<body>" +
//			    "<div class='container'>" +
//			    "<div class='header'>" +
//			    "<h1>Xin chào, "+billDetails.get().getBill().getAccount().getFullname()+"</h1>" +
//			    "</div>" +
//			    "<p>Chúng tôi rất tiếc phải thông báo rằng đơn hàng của bạn đã bị hủy. Chúng tôi hiểu rằng điều này thật đáng thất vọng và xin chân thành xin lỗi vì sự bất tiện này.</p>" +
//			    "<p><strong>Lý do hủy đơn hàng:</strong> " + contentCancel + "</p>" +
//			    "<p>Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, vui lòng liên hệ với đội ngũ hỗ trợ của chúng tôi. Chúng tôi luôn sẵn sàng giúp đỡ bạn.</p>" +
//			    "<p>Cảm ơn bạn đã thông cảm và kiên nhẫn.</p>" +
//			    "<p>Trân trọng,</p>" +
//			    "<p>Đội ngũ hỗ trợ khách hàng</p>" +
//			    "<a href='mailto:"+billDetails.get().getProduct().getAccount().getEmail()+"' class='button'>Liên hệ hỗ trợ</a>" +
//			    "<div class='footer'>" +
//			    "<p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>" +
//			    "</div>" +
//			    "</div>" +
//			    "</body>" +
//			    "</html>";
//	    mailService.push(billDetails.get().getProduct().getAccount().getEmail(),subject,content);
////		List<Bill> list = billRepository.findAll();
////		for(Bill bill : list) {
////			if(bill.getId() == id) {
////				bill.setId(id);
////				bill.setActive(false);
////				bill.setStatus(false);
////				bill.setFinishDay(new Date());
////				billRepository.saveAndFlush(bill);
////			}
////		}
//		return "redirect:/seller/ordermanager";
//	}
//}
