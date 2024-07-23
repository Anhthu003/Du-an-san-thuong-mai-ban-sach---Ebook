package com.foti_java.controller.account;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.model.Bill;
import com.foti_java.model.BillDetail;
import com.foti_java.model.CartDetail;
import com.foti_java.model.Evalue;
import com.foti_java.model.OrderStatus;
import com.foti_java.model.Product;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.CartDetailRepository;
import com.foti_java.repository.EvalueRepository;
import com.foti_java.repository.OrderStatusRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BillController {
	@Autowired
	BillRepositoty billRepositoty;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	CartDetailRepository cartDetailRepository;
	@Autowired
	OrderStatusRepository orderStatusRepository;
	@Autowired
	EvalueRepository evalueRepository;

	Account account = new Account();

//	@GetMapping("/user/bill")
//	public String getAllBills(Model model, HttpServletRequest request) {
//		account = sessionService.getAttribute("account");
//		List<Bill> bills = billRepositoty.getAll(account.getId());
//
//		// Tạo một Map để lưu danh sách sản phẩm, theo shop, theo từng Bill
//		Map<Integer, Map<String, List<BillDetail>>> billShopProductsMap = new HashMap<>();
//
//		for (Bill bill : bills) {
//			// danh sách các chi tiết hóa đơn theo tên shop
//			Map<String, List<BillDetail>> shopProductsMap = new HashMap<>();
//
//			for (BillDetail billDetail : bill.getBillDetails()) {
//				String shopName = billRepositoty.getShopNameByProduct(billDetail.getProduct().getId());
//
//				// Kiểm tra xem shopName đã tồn tại trong map chưa
//				if (!shopProductsMap.containsKey(shopName)) {
//					shopProductsMap.put(shopName, new ArrayList<>());
//				}
//
//				// Thêm billDetail vào danh sách sản phẩm của shop
//				shopProductsMap.get(shopName).add(billDetail);
//			}
//
//			// Đưa shopProductsMap vào billShopProductsMap với key là bill.getId()
//			billShopProductsMap.put(bill.getId(), shopProductsMap);
//		}
//		
//		System.err.println("account.getId()"+account.getId());
//
////		ĐÁNH GIÁ
//		List<Integer> evaluatedProductIds = evalueRepository.getEvaluatedProductIdsForCurrentUser(account.getId());
//		model.addAttribute("evaluatedProductIds", evaluatedProductIds);
//
//		model.addAttribute("bills", bills);
//		model.addAttribute("billShopProductsMap", billShopProductsMap);
//
//		model.addAttribute("activeMenu", "TATCA");
//		return "client/bill";
//	}
//
//
//	@GetMapping("/user/bill/{delivery}")
//	public String getBillByDelivery(Model model, HttpServletRequest request,
//			@PathVariable("delivery") String delivery) {
//		List<Bill> bills = new ArrayList<>();
//
//		if ("CHUANBI".equalsIgnoreCase(delivery)) {
//			bills = billRepositoty.getBillsByDelivery("Đang chờ đơn vị vận chuyển", account.getId(), true);
//		} else if ("VANCHUYEN".equalsIgnoreCase(delivery)) {
//			bills = billRepositoty.getBillsByDelivery("Đang vận chuyển", account.getId(), true);
//		} else if ("DANHANHANG".equalsIgnoreCase(delivery)) {
//			bills = billRepositoty.getBillsByDelivery("Đã nhận hàng", account.getId(), true);
//		} else if ("DAHUY".equalsIgnoreCase(delivery)) {
//			bills = billRepositoty.getBillsByDelivery("Đang chờ đơn vị vận chuyển", account.getId(), false);
//		} else if ("HOANTHANH".equalsIgnoreCase(delivery)) {
//			bills = billRepositoty.getBillsByDelivery("Hoàn Thành", account.getId(), true);
//		} else {
//			return "redirect:/user/bill?TATCA";
//		}
//
//		List<Integer> evaluatedProductIds = evalueRepository.getEvaluatedProductIdsForCurrentUser(account.getId());
//
//		model.addAttribute("evaluatedProductIds", evaluatedProductIds);
//		model.addAttribute("bills", bills);
//		model.addAttribute("activeMenu", delivery);
//		return "client/bill";
//	}

	@GetMapping("/user/bill")
	public String getAllBills(Model model, HttpServletRequest request) {
		account = sessionService.getAttribute("account");
		List<Bill> bills = billRepositoty.getAll(account.getId());

		// Tạo một Map để lưu danh sách sản phẩm, theo shop, theo từng Bill
		Map<Integer, Map<String, List<BillDetail>>> billShopProductsMap = generateBillShopProductsMap(bills);

		// Lấy danh sách sản phẩm đã đánh giá của người dùng hiện tại
		List<Integer> evaluatedProductIds = evalueRepository.getEvaluatedProductIdsForCurrentUser(account.getId());

		// Đưa dữ liệu vào model
		model.addAttribute("evaluatedProductIds", evaluatedProductIds);
		model.addAttribute("bills", bills);
		model.addAttribute("billShopProductsMap", billShopProductsMap);
		model.addAttribute("activeMenu", "TATCA");

		return "client/bill";
	}

	// Phương thức để tạo Map danh sách sản phẩm theo shop theo từng Bill
	private Map<Integer, Map<String, List<BillDetail>>> generateBillShopProductsMap(List<Bill> bills) {
		Map<Integer, Map<String, List<BillDetail>>> billShopProductsMap = new HashMap<>();

		for (Bill bill : bills) {
			Map<String, List<BillDetail>> shopProductsMap = new HashMap<>();

			for (BillDetail billDetail : bill.getBillDetails()) {
				String shopName = billRepositoty.getShopNameByProduct(billDetail.getProduct().getId());

				if (!shopProductsMap.containsKey(shopName)) {
					shopProductsMap.put(shopName, new ArrayList<>());
				}

				shopProductsMap.get(shopName).add(billDetail);
			}

			billShopProductsMap.put(bill.getId(), shopProductsMap);
		}

		return billShopProductsMap;
	}

	@GetMapping("/user/bill/{delivery}")
	public String getBillByDelivery(Model model, HttpServletRequest request,
			@PathVariable("delivery") String delivery) {
		List<Bill> bills;

		if ("CHUANBI".equalsIgnoreCase(delivery)) {
			bills = billRepositoty.getBillsByDelivery("Đang chờ đơn vị vận chuyển", account.getId(), true);
		} else if ("VANCHUYEN".equalsIgnoreCase(delivery)) {
			bills = billRepositoty.getBillsByDelivery("Đang vận chuyển", account.getId(), true);
		} else if ("DANHANHANG".equalsIgnoreCase(delivery)) {
			bills = billRepositoty.getBillsByDelivery("Đã nhận hàng", account.getId(), true);
		} else if ("DAHUY".equalsIgnoreCase(delivery)) {
			bills = billRepositoty.getBillsByDelivery("Đang chờ đơn vị vận chuyển", account.getId(), false);
		} else if ("HOANTHANH".equalsIgnoreCase(delivery)) {
			bills = billRepositoty.getBillsByDelivery("Hoàn Thành", account.getId(), false);
		} else {
			return "redirect:/user/bill?TATCA";
		}

		// Tạo một Map để lưu danh sách sản phẩm, theo shop, theo từng Bill
		Map<Integer, Map<String, List<BillDetail>>> billShopProductsMap = generateBillShopProductsMap(bills);

		List<Integer> evaluatedProductIds = evalueRepository.getEvaluatedProductIdsForCurrentUser(account.getId());

		model.addAttribute("bills", bills);
		model.addAttribute("evaluatedProductIds", evaluatedProductIds);
		model.addAttribute("billShopProductsMap", billShopProductsMap);
		model.addAttribute("activeMenu", delivery);

		return "client/bill";
	}

	@PostMapping("/user/huydon/{idBill}")
	public String huyDon(@PathVariable("idBill") Integer idBill, Model model) {
		Optional<Bill> bill = billRepositoty.findById(idBill);
		System.out.println(idBill);
		bill.get().setStatus(false);
		bill.get().setFinishDay(new Date());

		billRepositoty.save(bill.get());
		return "redirect:/user/bill";
	}

//
////	mua lại
	@PostMapping("/user/mualai/{idProduct}")
	public String muaHang(@PathVariable("idProduct") Integer idProduct, Model model) {
		return "forward:/user/buybookdetails/" + idProduct;
	}

//
//
	@PostMapping("/user/xacnhan/{idBill}")
	public String xacNhan(@PathVariable("idBill") Integer idBill, Model model, HttpServletRequest request) {
		Bill bill = billRepositoty.findById(idBill).orElse(null);
		if (bill != null) {
			OrderStatus orderStatus = orderStatusRepository.findByName("Hoàn Thành");

			if (orderStatus != null) {
				bill.setStatus(false);
				bill.setFinishDay(new Date());
				bill.setOrderStatus(orderStatus);
				billRepositoty.save(bill);

				model.addAttribute("message", "Trạng thái đơn hàng đã được cập nhật thành công!");
			} else {
				model.addAttribute("message", "Trạng thái '" + "Vận chuyển" + "' của đơn hàng không tồn tại!");
			}
		} else {
			model.addAttribute("message", "Đơn hàng không tồn tại!");
		}

		return "redirect:/user/bill";
	}

	@GetMapping("/user/xemsanpham/{idPro}")
	public String xemSanPham(@PathVariable("idPro") Integer idPro, Model model) {
		return "forward:/user/buybookdetails/" + idPro;
	}

	@PostMapping("/user/xemdonhang/{idBill}")
	public String xemDonHang(@PathVariable("idBill") Integer idBill, Model model) {
		System.out.println("idBill"+idBill);
		return "redirect:/user/billdetails/" + idBill;
	}

	@PostMapping("/user/danhgia/{idBill}")
	public String danhGia(@PathVariable("idBill") Integer idBill, Model model) {
		return "redirect:/user/evaluate/" + idBill;
	}

	@PostMapping("/user/xemdanhgia/{id}")
	public String xemDanhGia(@PathVariable("id") Integer idPro, Model model) {
		Integer idAccount = account.getId();
		return "forward:/user/xemevalute/" + idPro;
	}

}
