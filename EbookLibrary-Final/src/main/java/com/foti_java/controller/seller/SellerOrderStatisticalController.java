package com.foti_java.controller.seller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.model.Bill;
import com.foti_java.model.BillDetail;
import com.foti_java.model.PaymentMethod;
import com.foti_java.model.Voucher;
import com.foti_java.model.VoucherDetail;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.BillDetailRepository;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.PaymentMethodRepository;
import com.foti_java.repository.VoucherDetailRepository;
import com.foti_java.repository.VoucherRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("seller")
public class SellerOrderStatisticalController {
	@Autowired
	AccountRepositoty accountRepository;
	@Autowired
	BillRepositoty billRepository;
	@Autowired
	BillDetailRepository billDetailRepository;
	@Autowired
	VoucherRepository voucherRepository;
	@Autowired
	PaymentMethodRepository paymentRepository;
	@Autowired
	VoucherDetailRepository voucherDTRepository;
	@Autowired
	HttpServletRequest req;
	@Autowired
	SessionService session;
	List<Bill> listBill = new ArrayList<>();
	List<BillDetail> listBillDetails = new ArrayList<>();
	String startDate;
	String endDate;

	public List<Bill> returnList(List<Object[]> list) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Adjust format as per your date format
		List<Bill> listBillObject = new ArrayList<Bill>();
		for (Object[] objects : list) {
			Bill bill = new Bill();
			bill.setId(Integer.parseInt(objects[0].toString()));
			bill.setAddRessTo(objects[1].toString());

			try {
				Date dateBuy = dateFormat.parse(objects[2].toString());
				bill.setDateBuy(dateBuy);
			} catch (ParseException e) {
				e.printStackTrace(); // Handle exception appropriately
			}

			bill.setDiscount(Double.parseDouble(objects[3].toString()));

			try {
				Date finishDay = dateFormat.parse(objects[4].toString());
				bill.setFinishDay(finishDay);
			} catch (ParseException e) {
				e.printStackTrace(); // Handle exception appropriately
			}
			bill.setPriceShipping(Double.parseDouble(objects[5].toString()));
			bill.setQuantity(Integer.parseInt(objects[6].toString()));
			bill.setStatus(Boolean.parseBoolean(objects[7].toString()));
			bill.setTotalPrice(Double.parseDouble(objects[8].toString()));
			Optional<Account> accountObject = accountRepository.findById(Integer.parseInt(objects[9].toString()));
			bill.setAccount(accountObject.get());
			Optional<PaymentMethod> paymentMethod = paymentRepository
					.findById(Integer.parseInt(objects[10].toString()));
			bill.setPaymentMethod(paymentMethod.get());
			Optional<VoucherDetail> voucherDt = voucherDTRepository.findById(Integer.parseInt(objects[11].toString()));
			if (!voucherDt.isEmpty()) {
				bill.setVoucherDetail(voucherDt.get());
			}
			listBillObject.add(bill);
		}
		return listBillObject;
	}

	String errorDateEnd;
	String errorDateStart;

	public boolean check(String dateStart, String dateEnd, Model model) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		try {
			LocalDate startDate = LocalDate.parse(dateStart, formatter);
			LocalDate endDate = LocalDate.parse(dateEnd, formatter);

			if (endDate.isBefore(startDate)) {
				String errorDateEnd = "Ngày kết thúc phải > ngày bắt đầu";
				model.addAttribute("errorDateEnd", errorDateEnd);
				return false;
			}
		} catch (DateTimeParseException e) {
			String errorDateEnd = "Ngày không hợp lệ";
			model.addAttribute("errorDateEnd", errorDateEnd);
			return false;
		}

		return true;
	}

	@RequestMapping("orderstatistical")
	public String orderStatistical(Model model, @RequestParam(value = "dateStart", defaultValue = "") String dateStart,
			@RequestParam(value = "dateEnd", defaultValue = "") String dateEnd) {
		Account account = session.getAttribute("account");
//		Optional<Account> account2 = accountRepository.findById(2);
//		Account account = account2.get();

		List<Object[]> listTKSeller = billRepository.PROC_TK_NAM_Seller(account.getId());
		List<String> jsonListDT = new ArrayList<String>();
		List<String> jsonListLN = new ArrayList<String>();
		for (Object[] objArray : listTKSeller) {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("value", objArray[1]);
			jsonListDT.add("'" + jsonMap + "'");

			Map<String, Object> jsonMapLN = new HashMap<String, Object>();
			jsonMapLN.put("value", objArray[2]);
			jsonListLN.add("'" + jsonMapLN + "'");

		}
		
		if ((dateStart == null || dateStart.isEmpty()) && (dateEnd == null || dateEnd.isEmpty())) {
			List<Object[]> list = billRepository.FindAllBillByAccount(account.getId());
			listBill = returnList(list);
		} else {
			if (check(dateStart, dateEnd, model)) {
				startDate = dateStart;
				endDate = dateEnd;
				List<Object[]> list2 = billRepository.FindAllBillByAccount(account.getId(), dateStart, dateEnd);
				listBill = returnList(list2);
				model.addAttribute("dateStart", dateStart);
				model.addAttribute("dateEnd", dateEnd);
			}else {
				double SumTotalPrice = 0;
				int SumQuantity = 0;
				for (Bill bill : listBill) {
					SumQuantity += bill.getQuantity();
					SumTotalPrice += bill.getTotalPrice();
				}
				List<Object[]> list = billRepository.FindAllBillByAccount(account.getId());
				listBill = returnList(list);
				
				model.addAttribute("dateStart", dateStart);
				model.addAttribute("dateEnd", dateEnd);
				
				model.addAttribute("SellerSuccessJsonDT", jsonListDT);
				model.addAttribute("SellerSuccessJsonLN", jsonListLN);

				model.addAttribute("listbills", listBill);
				model.addAttribute("listbillDetails", new ArrayList<BillDetail>());
				model.addAttribute("dateStart", dateStart);
				model.addAttribute("dateEnd", dateEnd);
				model.addAttribute("SumQuantity", SumQuantity);
				model.addAttribute("SumTotalPrice", SumTotalPrice);
				model.addAttribute("vouchers", voucherRepository.findAll());
				return "seller/pages/orderstatistical";
			}
		}
		double SumTotalPrice = 0;
		int SumQuantity = 0;
		for (Bill bill : listBill) {
			SumQuantity += bill.getQuantity();
			SumTotalPrice += bill.getTotalPrice();
		}

		model.addAttribute("SellerSuccessJsonDT", jsonListDT);
		model.addAttribute("SellerSuccessJsonLN", jsonListLN);

		model.addAttribute("listbills", listBill);
		model.addAttribute("listbillDetails", new ArrayList<BillDetail>());
		model.addAttribute("dateStart", dateStart);
		model.addAttribute("dateEnd", dateEnd);
		model.addAttribute("SumQuantity", SumQuantity);
		model.addAttribute("SumTotalPrice", SumTotalPrice);
		model.addAttribute("vouchers", voucherRepository.findAll());
		return "seller/pages/orderstatistical";
	}

	@GetMapping("/orderstatistical/details/{id}")
	public String fillDetails(Model model, @PathVariable("id") Integer id) {
//		Account account = session.getAttribute("account");
		Optional<Account> account2 = accountRepository.findById(2);
		Account account = account2.get();
		Bill bill = billRepository.findById(id).get();
		listBillDetails = billDetailRepository.findAllByBill(bill.getId(), account.getId());
		orderStatistical(model, startDate, endDate);
		model.addAttribute("listbillDetails", listBillDetails);
		model.addAttribute("bill", bill);

		return "seller/pages/orderstatistical";
	}
}
