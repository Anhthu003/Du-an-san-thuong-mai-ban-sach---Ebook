package com.foti_java.controller.admin;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Bill;
import com.foti_java.model.Voucher;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.BillDetailRepository;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.RoleDetailRepository;
import com.foti_java.repository.RoleRepository;

import com.foti_java.repository.AccountRepositoty;

@Controller
@RequestMapping("admin")
public class AdminHomeController {
	@Autowired
	AccountRepositoty accountRepository;
  

//	@RequestMapping("home")
//	public String home(Model model) {
	@Autowired
	BillRepositoty billRepository;
	List<Bill> bills;
	@Autowired
	BillDetailRepository billDetailRepository;
	@Autowired
	RoleDetailRepository roleDTRepository;
	@Autowired
	RoleRepository roleRepository;

	@RequestMapping("home")
	public String home(Model model) {
		bills = billRepository.findAll();
		int sumQuantity = 0;
		double sumPrice=0;
		for (Bill bill : bills) {
			sumPrice += bill.getTotalPrice();
			sumQuantity += bill.getQuantity();
		}
		int countSellerNotCheck = accountRepository.countSellerNotCheck();
		int countAccount = accountRepository.countAccount();
		int countSeller = accountRepository.countSeller();
		int countUser = accountRepository.countUser();
		int countAdmin = accountRepository.countAdmin();
		double AvgSeller = ((double) countSeller / countAccount) * 100;
		double totalPriceAdmin = accountRepository.totalPriceAdmin();

		model.addAttribute("countSellerNotCheck", countSellerNotCheck);
		model.addAttribute("AvgSeller", Math.round((AvgSeller * 10.0) / 10.0));
		model.addAttribute("countAccount", countAccount);
		model.addAttribute("totalPriceAdmin", totalPriceAdmin);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countSeller", countSeller);
		model.addAttribute("countAdmin", countAdmin);
		model.addAttribute("sumQuantity", sumQuantity);
		model.addAttribute("sumPrice", sumPrice);
		model.addAttribute("listbills", bills);

		return "admin/index";
	}

	boolean status;
	String startDate;
	String endDate;
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

	@GetMapping("/home/bills/filter")
	public String getFillDetailsFilter(Model model,
			@RequestParam(value = "dateStart", defaultValue = "") String dateStart,
			@RequestParam(value = "dateEnd", defaultValue = "") String dateEnd) {
		status = false;
		startDate = dateStart;
		endDate = dateEnd;
		if (check(dateStart, dateEnd, model)) {
			bills = billRepository.findAllByFinishDayBetween(dateStart, dateEnd);
			int sumQuantity = 0;
			double sumPrice=0;
			for (Bill bill : bills) {
				sumPrice += bill.getTotalPrice();
				sumQuantity += bill.getQuantity();
			}
			model.addAttribute("sumQuantity", sumQuantity);
			model.addAttribute("sumPrice", sumPrice);
		}else {
			home(model);
		}
		model.addAttribute("dateStart", dateStart);
		model.addAttribute("dateEnd", dateEnd);
		model.addAttribute("listbills", bills);

		int countSellerNotCheck = accountRepository.countSellerNotCheck();
		int countAccount = accountRepository.countAccount();
		int countSeller = accountRepository.countSeller();
		int countUser = accountRepository.countUser();
		int countAdmin = accountRepository.countAdmin();
		double AvgSeller = ((double) countSeller / countAccount) * 100;
		double totalPriceAdmin = accountRepository.totalPriceAdmin();
		model.addAttribute("countSellerNotCheck", countSellerNotCheck);
		model.addAttribute("AvgSeller", Math.round((AvgSeller * 10.0) / 10.0));
		model.addAttribute("countAccount", countAccount);
		model.addAttribute("totalPriceAdmin", totalPriceAdmin);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countSeller", countSeller);
		model.addAttribute("countAdmin", countAdmin);
		return "admin/index";
	}

}
