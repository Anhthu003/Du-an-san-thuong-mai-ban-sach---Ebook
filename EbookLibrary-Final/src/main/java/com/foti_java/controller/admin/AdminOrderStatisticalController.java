package com.foti_java.controller.admin;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foti_java.model.Account;
import com.foti_java.model.Address;
import com.foti_java.model.Role;
import com.foti_java.model.RoleDetail;
import com.foti_java.model.Selerstatistical;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.AddressRepository;
import com.foti_java.repository.BillDetailRepository;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.RoleDetailRepository;
import com.foti_java.repository.RoleRepository;


@Controller
@RequestMapping("admin")
public class AdminOrderStatisticalController {
	@Autowired
	AccountRepositoty accountRepository;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	BillRepositoty billRepository;
	@Autowired
	AddressRepository addressRepository;

		
	@RequestMapping("orderstatistical")
	public String orderstatistical(Model model) {
		
//		seller --- order
		 List<Object[]> list = billRepository.Selerstatistical();
		 List<Selerstatistical> Selerstatisticallist = new ArrayList<>();
		 List<Selerstatistical> Selerstatisticallist2 = new ArrayList<>();
		 for (Object[] selerstatistical : list) {
			 
		 }
		 for (Object[] selerstatistical : list) {
			 Selerstatistical s = new Selerstatistical();
			 s.setFullName(selerstatistical[0].toString());
			 s.setPhone(selerstatistical[1].toString());
			 s.setAddress(selerstatistical[2].toString());
			 s.setEmail(selerstatistical[3].toString());
			 s.setTotalRevenue(Float.parseFloat(selerstatistical[4].toString()) );
			 s.setDiscount(Float.parseFloat(selerstatistical[5].toString()));
			 s.setProfit(Float.parseFloat(selerstatistical[6].toString()));
			 s.setStatus(Boolean.parseBoolean(selerstatistical[7].toString()));
			 Selerstatisticallist.add(s);
		}			 
		 model.addAttribute("Selerstatisticallist",Selerstatisticallist);
		return "admin/pages/orderstatistical";
	}	
}
