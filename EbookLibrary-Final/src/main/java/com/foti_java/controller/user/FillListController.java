package com.foti_java.controller.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.foti_java.model.Account;
import com.foti_java.model.Product;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;
@Controller
@RequestMapping("user")
public class FillListController {
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductRepository productRepository;
	int index = 0;
	Sort sort;
	List<Integer> list = new ArrayList<>();

	@RequestMapping("fillist/new")
	public String getHot(Model model) {

		Account account = sessionService.getAttribute("account");
		sort = Sort.by(Sort.Direction.DESC, "date");
		Pageable pageable = PageRequest.of(index, 12, sort);
		Page<Product> pages = productRepository.findAllByAccountNotAndStatusTrue(account, pageable);
		list = new ArrayList<>();
		for (Product product : pages.getContent()) {
			list.add(product.getId());
		}
		model.addAttribute("listProduct", pages.getContent());
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("indexPage", index);
		return "client/fillList";
	}

	@RequestMapping("fillist/hot")
	public String getNew(Model model) {
		Account account = sessionService.getAttribute("account");
		sort = Sort.by(Sort.Direction.DESC, "quantitySell");
		Pageable pageable = PageRequest.of(index, 12, sort);
		Page<Product> pages = productRepository.findAllByAccountNotAndStatusTrue(account, pageable);
		list = new ArrayList<>();
		for (Product product : pages.getContent()) {
			list.add(product.getId());
		}
		model.addAttribute("listProduct", pages.getContent());
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("indexPage", index);
		return "client/fillList";
	}
	
	@GetMapping("fillist/page/{indexpage}")
	public String pageHot(@PathVariable("indexpage") Integer indexPage, Model model) {
		Account account = sessionService.getAttribute("account");
		index = indexPage;
		Pageable pageable = PageRequest.of(index, 12, sort);
		Page<Product> pages = productRepository.findAllByAccountNotAndStatusTrue(account, pageable);
		model.addAttribute("listProduct", pages.getContent());
		model.addAttribute("totalPages", pages.getTotalPages());
		model.addAttribute("indexPage", index);
		return "client/fillList";
	}
}

