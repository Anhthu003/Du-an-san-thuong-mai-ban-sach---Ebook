package com.foti_java.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foti_java.model.Account;
import com.foti_java.model.Like;
import com.foti_java.model.Product;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.LikeRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user")
public class FavoriteController {
	@Autowired
	SessionService sessionService;
	@Autowired
	LikeRepository likeRepository;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	HttpServletRequest req;

	@RequestMapping("favorite/{idProduct}")
	public String getFavorite(@PathVariable("idProduct") Integer id, @RequestParam("url") String url) {
		Product product = productRepository.findById(id).get();
		Account account = sessionService.getAttribute("account");
		if (likeRepository.findFirstByAccountAndProduct(account, product) != null) {
			Like like = likeRepository.findFirstByAccountAndProduct(account, product);
			if (like.isStatus()) {
				like.setStatus(false);
			} else {
				like.setStatus(true);
			}
			likeRepository.save(like);
		} else {
			Like likeNew = new Like();
			likeNew.setAccount(account);
			likeNew.setProduct(product);
			likeNew.setStatus(true);
			likeRepository.save(likeNew);
		}
		return "redirect"+url;
	}
}
