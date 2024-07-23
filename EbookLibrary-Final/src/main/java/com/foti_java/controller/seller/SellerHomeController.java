package com.foti_java.controller.seller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foti_java.model.Account;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.service.SessionService;

@Controller
@RequestMapping("seller")
public class SellerHomeController {
	@Autowired
	SessionService sessionService;
	@Autowired
	BillRepositoty billRepositoty;
	@GetMapping("home")
	public String home(Model model) {
		Account account = sessionService.getAttribute("account");
		int follwer = billRepositoty.getFollwer(account.getId());
		int like = billRepositoty.getLike(account.getId());
		int eValue = billRepositoty.getEvalue(account.getId());
		int billSucces = billRepositoty.getBillSucess(account.getId());
		int billChuaDuyet = billRepositoty.billChuaDuyet(account.getId());
		double avgStar = billRepositoty.getAVGStar(account.getId());
		int tongDoanhThu = billRepositoty.getTongDoanhThu(account.getId());
		int tongLoiNhuan = billRepositoty.getTongLoiNhuan(account.getId());
		List<Object> listTopAccount = billRepositoty.getTopBuyers(account.getId());
		List<Object> listEvalueNew = billRepositoty.getEvalueNew(account.getId());
		List<Object> listTopProduct = billRepositoty.getTopProduct(account.getId());
		List<Object[]> listDoanhThu = billRepositoty.getDoanhThu(account.getId());
		List<Object[]> listLoiNhuan = billRepositoty.getLoiNhuan(account.getId());
		List<String> doanhThu = new ArrayList<>();
		List<String> loiNhuan = new ArrayList<>();
	    for (Object[] objArray : listDoanhThu) {
	        Map<String, Object> jsonMap = new HashMap<>();
	        jsonMap.put("value", objArray[0]);
	        doanhThu.add("'"+jsonMap+"'");
	    }
	    for (Object[] objArray : listLoiNhuan) {
	        Map<String, Object> jsonMap = new HashMap<>();
	        jsonMap.put("value", objArray[0]);
	        loiNhuan.add("'"+jsonMap+"'");
	    }

	    model.addAttribute("tongDoanhThu",tongDoanhThu);
	    model.addAttribute("tongLoiNhuan",tongLoiNhuan);
	    model.addAttribute("avgStar",avgStar);
	    model.addAttribute("billChuaDuyet",billChuaDuyet);
	    model.addAttribute("doanhThu",doanhThu);
	    model.addAttribute("loiNhuan", loiNhuan);
		model.addAttribute("listTopProduct",listTopProduct);
		model.addAttribute("listEvalueNew",listEvalueNew);
		model.addAttribute("listTopAccount",listTopAccount);
		model.addAttribute("billSucces", billSucces);
		model.addAttribute("eValue", eValue);
		model.addAttribute("like", like);
		model.addAttribute("follwer",follwer);
		return "seller/index";
	}
}
