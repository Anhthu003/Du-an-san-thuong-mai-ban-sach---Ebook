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
import com.foti_java.model.Evalue;
import com.foti_java.model.Follower;
import com.foti_java.model.Product;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.EvalueRepository;
import com.foti_java.repository.FollowerRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

@Controller
@RequestMapping("user")

public class StoreHomeController {
    @Autowired
    AccountRepositoty accountRepositoty;
    @Autowired
    FollowerRepository followerRepository;
    @Autowired
    EvalueRepository evalueRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    SessionService sessionService;
    Integer id = 0;

    @RequestMapping("storehome/{idAccount}")
    public String get(@PathVariable("idAccount") Integer idAccount, Model model) {
        id = idAccount;
        Account client = sessionService.getAttribute("account");
        model.addAttribute("client", client);
        Account account = accountRepositoty.findById(idAccount).get();
        List<Follower> followers = followerRepository.findAllByFollower_id(idAccount);
        List<Evalue> evalues = evalueRepository.findAllByProductIn(account.getProducts());
        model.addAttribute("listFollower", followers);
        model.addAttribute("listEvalue", evalues);
        model.addAttribute("account", account);
        Follower follower = followerRepository.findByFolloweAndAccount(id, client);
        if (follower != null) {
            if (follower.isStatus()) {
                model.addAttribute("checkFollower", true);
            } else {

                model.addAttribute("checkFollower", false);
            }

        } else {
            model.addAttribute("checkFollower", false);
        }
        Sort sort = Sort.by(Sort.Direction.DESC, "quantitySell");
        Pageable pageableHot = PageRequest.of(0, 4, sort);
        Page<Product> pageProductHot = productRepository.findAllByAccountAndStatusTrue(account, pageableHot);
        List<Integer> listId = new ArrayList<>();
        for (int i = 0; i < pageProductHot.getContent().size(); i++) {
            listId.add(pageProductHot.getContent().get(i).getId());
        }
        Page<Product> pageProductNew = productRepository.findAllByAccountAndIdNotInAndStatusTrue(account, listId,
                PageRequest.of(0, 2, Sort.by(Sort.Direction.DESC, "date")));
        model.addAttribute("listProductHot", pageProductHot.getContent());
        model.addAttribute("listProductNew", pageProductNew.getContent());

        return "client/storeHome";
    }

    @GetMapping("storehome/follower")
    public String follower() {
        Account account = sessionService.getAttribute("account");
        Follower foll = followerRepository.findByFolloweAndAccount(id, account);
        if (foll == null) {
            Follower follower = new Follower();
            follower.setStatus(true);
            follower.setFollower_id(id);
            follower.setAccount(account);
            followerRepository.save(follower);
            System.out.println("chua co");
        } else {
            if (foll.isStatus()) {
                foll.setStatus(false);
                followerRepository.save(foll);
                System.out.println("false");
            } else {
                foll.setStatus(true);
                followerRepository.save(foll);
                System.out.println("true");
            }
        }

        return "redirect:/user/storehome/" + id;
    }
}
