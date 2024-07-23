package com.foti_java.controller.admin;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.model.TypeVoucher;
import com.foti_java.model.Voucher;
import com.foti_java.model.VoucherDetail;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.TypeVoucherRepository;
import com.foti_java.repository.VoucherDetailRepository;
import com.foti_java.repository.VoucherRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("admin")
public class AdminVoucherManagerController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	VoucherRepository voucherRepository;
	@Autowired
	TypeVoucherRepository typeVoucherRepository;
	@Autowired
	VoucherDetailRepository voucherDetailsRepository;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	SessionService session;
	String errorName = "";
	String errorDKPrice = "";
	String errorDateStart = "";
	String errorDateEnd = "";
	String errorSL = "";
	String errorPriceSale = "";
	List<Voucher> listVoucher;
	List<TypeVoucher> listTypeVoucher;
	String statusonl = "";
	Integer idTypeonl;

	@RequestMapping("vouchermanager")
	public String voucherManager(Model model, @RequestParam(name = "typeVoucher", defaultValue = "") Integer idType) {
		Account account = session.getAttribute("account");
		listVoucher = voucherRepository.findAllByAccount(account);
		listTypeVoucher = typeVoucherRepository.findAll();
		model.addAttribute("typeVouchers", listTypeVoucher);
		model.addAttribute("vouchers", listVoucher);
		return "admin/pages/vouchermanager";
	}

	@GetMapping("vouchermanager/details")
	public String voucherDetailsManager(Model model, @RequestParam("voucherId") Integer voucherId) {
		Optional<Voucher> voucher = voucherRepository.findById(voucherId);
		List<VoucherDetail> list = voucherDetailsRepository.findAllByVoucher(voucher.get());
		model.addAttribute("voucherDetails", list);
		model.addAttribute("voucher", voucher.get());
		return "admin/pages/voucherDetailsManager";
	}

	public boolean check(Model model, String name, Integer voucher, double DKPrice, LocalDate dateStart,
			LocalDate dateEnd, int OriginalNumber, double priceSale, int quantity, boolean loaiSale) {
		if (DKPrice < 0) {
			errorPriceSale = "Vui lòng nhập giá sale";
			model.addAttribute("errorPriceSale", errorPriceSale);
			return false;
		}
		if (dateEnd.isBefore(LocalDate.now())) {
			errorDateEnd = "Ngày kết thúc phải > ngày hiện tại";
			model.addAttribute("errorDateEnd", errorDateEnd);
			return false;
		}
		if (dateEnd.isBefore(dateStart)) {
			errorDateEnd = "Ngày kết thúc phải > ngày bắt đầu";
			model.addAttribute("errorDateEnd", errorDateEnd);
			return false;
		}
		if (OriginalNumber < 0) {
			errorSL = "Số lượng phải lớn hơn 0";
			model.addAttribute("errorSL", errorSL);
			return false;
		}
		if (OriginalNumber < quantity) {
			errorSL = "Số lượng voucher phải lớn hơn số lượng đã dùng";
			model.addAttribute("errorSL", errorSL);
			return false;
		}
		if (loaiSale) {
			if (priceSale < 1 || priceSale > 100) {
				errorPriceSale = "sale từ 1 - 100%";
				model.addAttribute("errorPriceSale", errorPriceSale);
				return false;
			}
		} else {
			if (priceSale < 1000) {
				errorPriceSale = "sale phải lớn hơn 1000";
				model.addAttribute("errorPriceSale", errorPriceSale);
				return false;
			}
		}

		return true;
	}

	@GetMapping("vouchermanager/insert")
	public String getInsert(Model model) {
		listTypeVoucher = typeVoucherRepository.findAll();
		model.addAttribute("typeVouchers", listTypeVoucher);
		if (req.getRequestURI().contains("insert")) {
			model.addAttribute("voucher", new Voucher());
		}

		return "admin/pages/vouchermanager";
	}

	@GetMapping("vouchermanager/update/{id}")
	public String getUpdate(Model model, @PathVariable(name = "id") Integer id,
			@RequestParam(name = "typeVoucher", defaultValue = "") Integer idType) {
		Account account = session.getAttribute("account");
		listVoucher = voucherRepository.findAllByAccount(account);
		Optional<Voucher> entity = null;
		listTypeVoucher = typeVoucherRepository.findAll();
		model.addAttribute("typeVouchers", listTypeVoucher);
		if (req.getRequestURI().contains("update") && id != null) {
			entity = voucherRepository.findById(id);
			model.addAttribute("voucher", entity.get());
			model.addAttribute("currentPath", "update");
			model.addAttribute("dateStart", entity.get().getDateStart().toString());
			model.addAttribute("dateEnd", entity.get().getDateEnd().toString());
			model.addAttribute("vouchers", listVoucher);
		}
		return "admin/pages/vouchermanager";
	}

	@GetMapping("vouchermanager/delete/{id}")
	public String getDelete(Model model, @PathVariable(name = "id") Integer id) {
		listTypeVoucher = typeVoucherRepository.findAll();
		model.addAttribute("typeVouchers", listTypeVoucher);
		if (req.getRequestURI().contains("delete")) {
			Optional<Voucher> entity = voucherRepository.findById(id);
			entity.get().setId(id);
			entity.get().setStatus(false);
			voucherRepository.saveAndFlush(entity.get());
			return "redirect:/admin/vouchermanager";
		}
		return "admin/pages/vouchermanager";
	}

	@PostMapping("vouchermanager")
	public String postInsert(Model model, @RequestParam("name") String name,
			@RequestParam("voucher") Integer typeVoucher, @RequestParam("loaiGG") boolean loaiGG,
			@RequestParam("PriceDK") double DKPrice,
			@RequestParam("dateStart") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateStart,
			@RequestParam("dateEnd") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateEnd,
			@RequestParam("quantity") int quantity, @RequestParam("priceSale") double priceSale,
			@RequestParam("note") String note) {

		Voucher entity = new Voucher();
		Account account = session.getAttribute("account");
		Optional<TypeVoucher> type = typeVoucherRepository.findById(typeVoucher);
		entity.setName(name);
		entity.setTypeVoucher(type.get());
		entity.setPriceMin(DKPrice);
		// Chuyển đổi LocalDate sang Date
		Date startDate = Date.from(dateStart.atStartOfDay(ZoneId.systemDefault()).toInstant());
		Date endDate = Date.from(dateEnd.atStartOfDay(ZoneId.systemDefault()).toInstant());

		entity.setDateStart(startDate);
		entity.setDateEnd(endDate);
		entity.setOriginalNumber(quantity);
		entity.setStatus(true);
		entity.setSale(priceSale);
		entity.setNote(note);
		entity.setAccount(account);

		// Bảo toàn các giá trị ban đầu
		String originalDateStart = dateStart.toString();
		String originalDateEnd = dateEnd.toString();

		if (check(model, name, typeVoucher, DKPrice, dateStart, dateEnd, quantity, priceSale, 0, loaiGG)) {
			voucherRepository.saveAndFlush(entity);
			return "redirect:/admin/vouchermanager";
		} else {

			List<TypeVoucher> list = typeVoucherRepository.findAll();
			model.addAttribute("typeVouchers", list);
			model.addAttribute("voucher", entity);
			model.addAttribute("vouchers", voucherRepository.findAllByAccount(account));
			model.addAttribute("dateStart", originalDateStart);
			model.addAttribute("dateEnd", originalDateEnd);
			return "admin/pages/vouchermanager";
		}
	}

	@PostMapping("vouchermanager/update/{id}")
	public String postUpdate(Model model, @PathVariable(name = "id") Integer voucherID,
			@RequestParam("name") String name, @RequestParam("voucher") Integer typeVoucher,
			@RequestParam("loaiGG") boolean loaiGG, @RequestParam("PriceDK") double DKPrice,
			@RequestParam("dateStart") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateStart,
			@RequestParam("dateEnd") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateEnd,
			@RequestParam("quantity") int quantity, @RequestParam("priceSale") double priceSale,
			@RequestParam("note") String note) {
		Account account = session.getAttribute("account");
		Voucher entity = new Voucher();
		Optional<Voucher> entityOld = voucherRepository.findById(voucherID);
		Optional<TypeVoucher> type = typeVoucherRepository.findById(typeVoucher);
		entity.setId(voucherID);
		entity.setName(name);
		entity.setTypeVoucher(type.get());
		entity.setPriceMin(DKPrice);
		// Chuyển đổi LocalDate sang Date
		Date startDate = Date.from(dateStart.atStartOfDay(ZoneId.systemDefault()).toInstant());
		Date endDate = Date.from(dateEnd.atStartOfDay(ZoneId.systemDefault()).toInstant());

		entity.setDateStart(startDate);
		entity.setDateEnd(endDate);
		entity.setOriginalNumber(quantity);
		entity.setStatus(true);
		entity.setSale(priceSale);
		entity.setNote(note);
		entity.setAccount(account);

		if (check(model, name, typeVoucher, DKPrice, dateStart, dateEnd, quantity, priceSale,
				entityOld.get().getQuantity(), loaiGG)) {
			entity.setQuantity(entityOld.get().getQuantity());
			voucherRepository.saveAndFlush(entity);
			return "redirect:/admin/vouchermanager";
		} else {
			List<Voucher> listVoucher = voucherRepository.findAllByAccount(account);
			List<TypeVoucher> listTypeVoucher = typeVoucherRepository.findAll();

			model.addAttribute("currentPath", "update");
			model.addAttribute("typeVouchers", listTypeVoucher);
			model.addAttribute("vouchers", listVoucher);
			model.addAttribute("voucher", entity);

			// Add dateStart and dateEnd attributes back to the model
			model.addAttribute("dateStart", dateStart);
			model.addAttribute("dateEnd", dateEnd);
			return "admin/pages/vouchermanager";
		}
	}

}
