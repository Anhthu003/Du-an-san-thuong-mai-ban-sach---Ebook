package com.foti_java.controller.account;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.foti_java.model.Account;
import com.foti_java.model.Address;
import com.foti_java.model.Bill;
import com.foti_java.model.BillDetail;
import com.foti_java.model.Evalue;
import com.foti_java.model.PaymentMethod;
import com.foti_java.model.Product;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.AddressRepository;
import com.foti_java.repository.BillDetailRepository;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.EvalueRepository;
import com.foti_java.repository.OrderStatusRepository;
import com.foti_java.repository.PaymentMethodRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BillDetailsController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	BillRepositoty billRepositoty;
	@Autowired
	BillDetailRepository billDetailRepository;
	@Autowired
	AddressRepository addressRepository;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	EvalueRepository evalueRepository;
	@Autowired
	PaymentMethodRepository paymentMethodRepository;
	@Autowired
	OrderStatusRepository orderStatusRepository;
	@Autowired
    HttpSession session;
	@Autowired
	SessionService sessionService;
	
	Account account =  new Account();

	@GetMapping("/user/billdetails/{idBill}")
	public String getBillDetails(@PathVariable("idBill") Integer idBill, Model model, HttpServletRequest request) {
		account = sessionService.getAttribute("account");

		System.out.println("idBill"+idBill);
		

//		// FIND BILL
		Bill bill = billRepositoty.findBillByIdForDetail(idBill);
//
//		// FIND DETAIL OF BILL (PRODUDCTS)
		List<BillDetail> billDetail = billDetailRepository.findBillById(idBill);
		List<Product> products = new ArrayList<Product>();
		List<Integer> quantities = new ArrayList<Integer>(); // List to store quantities
//
//		// FIND SHOP NAME
//		String shopName = billRepositoty.getShopNameByBillId(idBill);
//
//		// FIND PAYMENT METHOD
		Integer idPaymentMethod = billRepositoty.findPaymentMethodId(idBill);
		String paymentMethod = paymentMethodRepository.findMethodById(idPaymentMethod);
//
//		// FIND ORDER STATUS
		Integer idOrderStatus = billRepositoty.findOrderStatusId(idBill);
		String orderStatus = orderStatusRepository.findStatusById(idOrderStatus);

//		// FIND ADDRESS
		List<String> addressString = new ArrayList<String>();
		String Province = addressRepository.findProvinceByAccount(account.getId());
		String Districts = addressRepository.findDistrictsByAccount(account.getId());
		String Communes = addressRepository.findCommunesByAccount(account.getId());
		addressString.add(Communes);
		addressString.add(Districts);
		addressString.add(Province);
		String addressFinal = formatPlaceNames(addressString);
		String plusAddress = addressRepository.findFullAddressByAccount(account.getId());
//
//		// FIND PHONE
		String phone = addressRepository.findAddressByAccount(account.getId()).getPhone();
//
//		// FIND FULLNAME
		String fullname = accountRepositoty.getFullname(account.getId());
//
		for (int detail = 0; detail < billDetail.size(); detail++) {
			if (billDetail.get(detail) != null) {
				products.add(billDetail.get(detail).getProduct());
				int quantity = billDetail.get(detail).getQuantity();
				quantities.add(quantity);
			}
		}

		model.addAttribute("idBill",idBill);
		model.addAttribute("bill", bill);
		model.addAttribute("products", products);
		model.addAttribute("quantities", quantities);
		model.addAttribute("paymentMethod", paymentMethod);
//		model.addAttribute("shopName", shopName);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("address", addressFinal);
		model.addAttribute("plusAddress", plusAddress);
		model.addAttribute("phone", phone);
		model.addAttribute("fullname", fullname);

		return "client/billDetails";
	}

	public static String formatPlaceNames(List<String> places) {
		if (places == null || places.size() < 3) {
			throw new IllegalArgumentException("Địa chỉ cần 3 thành phần: xã, huyện, tỉnh");
		}
		String xa = places.get(0);
		String huyen = places.get(1);
		String tinh = places.get(2);

		return String.format("xã %s, huyện %s, tỉnh %s", xa, huyen, tinh);
	}

	@GetMapping("/user/trolaibills")
	public String postMethodName() {
		return "redirect:/user/bill";
	}

}
