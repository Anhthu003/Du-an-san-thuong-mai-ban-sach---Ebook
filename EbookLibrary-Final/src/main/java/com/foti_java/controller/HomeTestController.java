package com.foti_java.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foti_java.model.Account;
import com.foti_java.model.Like;
import com.foti_java.model.Product;
import com.foti_java.model.RoleDetail;
import com.foti_java.repository.LikeRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.repository.RoleDetailRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomeTestController {
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductRepository productRepository;

	@Autowired
	RoleDetailRepository roleDetailRepository;
	@Autowired
	LikeRepository likeRepository;
	@Autowired
	HttpServletRequest req;

	@RequestMapping("/user/home")
	public String home(Model model) {
//		req.getServletContext().getContextPath();
		Account account = sessionService.getAttribute("account");
		List<Like> listLike = likeRepository.findAllByAccountAndStatusTrue(account);

		Sort sort = Sort.by(Sort.Direction.DESC, "quantitySell");
		Pageable pageableHot = PageRequest.of(0, 12, sort);

		List<RoleDetail> roleDetailOptional = roleDetailRepository.findByAccount(account.getId());
		model.addAttribute("roleDetailOptional", roleDetailOptional);
		System.out.println("home nè");
		model.addAttribute("account", account);
		Page<Product> pageProductHot = productRepository.findAllByAccountNotAndStatusTrue(account, pageableHot);
		List<Integer> listId = new ArrayList<>();
		for (int i = 0; i < pageProductHot.getContent().size(); i++) {
			listId.add(pageProductHot.getContent().get(i).getId());
		}
		Page<Product> pageProductNew = productRepository.findAllByIdNotInAndAccountNotAndStatusTrue(listId, account,
				PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "date")));
		model.addAttribute("listLike", listLike);
		model.addAttribute("listProductHot", pageProductHot.getContent());
		model.addAttribute("listProductNew", pageProductNew.getContent());
		return "client/buyBooksHome";
	}

}
