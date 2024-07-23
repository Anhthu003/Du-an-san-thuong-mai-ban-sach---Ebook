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
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.model.Category;
import com.foti_java.model.Evalue;
import com.foti_java.model.Product;
import com.foti_java.repository.CategoryRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

@Controller
@RequestMapping("user")
public class SearchBuyBookController {
    @Autowired
    ProductRepository productRepository;
    List<Product> list = new ArrayList<>();
    List<Category> listCategory = new ArrayList<>();
    Page<Product> page;
    Pageable pageable;
    int index = 0;
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    SessionService sessionService;
    List<Integer> listIdProduct;

    @RequestMapping("searchbuybook")
    public String productHome(Model model, @RequestParam("searchName") String name) {
        Account account = sessionService.getAttribute("account");
        listIdProduct = new ArrayList<Integer>();
        pageable = PageRequest.of(index, 3);
        page = productRepository.findAllByAccountNotAndNameContainingAndStatusTrue(account, name, pageable);
        list = page.getContent();
        for (int i = 0; i < page.getTotalPages(); i++) {
            Pageable pageableNew = PageRequest.of(i, 6);

            List<Product> listTotal = productRepository
                    .findAllByAccountNotAndNameContainingAndStatusTrue(account, name, pageableNew).getContent();
            for (Product product : listTotal) {
                listIdProduct.add(product.getId());
            }

        }
        model.addAttribute("listProducts", list);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("listCategories", categoryRepository.findAll());
        model.addAttribute("indexPage", index);
        return "client/SearchBuyBook";

    }

    @GetMapping("category")
    public String filterCategory(@RequestParam(name = "category", defaultValue = "") String[] category, Model model) {
        listCategory = new ArrayList<Category>();
        Account account = sessionService.getAttribute("account");
        for (String string : category) {
            listCategory.add(categoryRepository.findById(Integer.parseInt(string)).get());
        }
        if (productRepository.findAllByIdInAndCategoryInAndAccountNotAndStatusTrue(listIdProduct, listCategory,
                account, PageRequest.of(index, 3)).getTotalPages() >= index) {
            pageable = PageRequest.of(index, 3);
            page = productRepository.findAllByIdInAndCategoryInAndAccountNotAndStatusTrue(listIdProduct, listCategory,
                    account, pageable);
        } else {
            pageable = PageRequest.of(0, 3);
            page = productRepository.findAllByIdInAndCategoryInAndAccountNotAndStatusTrue(listIdProduct, listCategory,
                    account, pageable);
        }

        list = page.getContent();
        List<Integer> listProductNew = new ArrayList<>();
        for (int i = 0; i < page.getTotalPages(); i++) {
            Pageable pageableOld = PageRequest.of(i, 3, Sort.by(Sort.Direction.ASC, "price"));
            Page<Product> pageOld = productRepository.findAllByIdInAndStatusTrue(listIdProduct, pageableOld);
            for (Product pr : pageOld.getContent()) {
                listProductNew.add(pr.getId());
            }
        }
        if (list.size() > 0) {
            listIdProduct = listProductNew;
        }
        model.addAttribute("listProducts", list);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("listCategories", categoryRepository.findAll());
        return "client/SearchBuyBook";

    }

    @GetMapping("filtePrice")
    public String filterPrice(@RequestParam("priceMin") double priceMin, @RequestParam("priceMax") double priceMax,
            Model model) {
        Account account = sessionService.getAttribute("account");
        if (productRepository.findAllByIdInAndAccountNotAndPriceBetweenAndStatusTrue(listIdProduct, account,
                priceMin,
                priceMax, PageRequest.of(index, 3)).getTotalPages() > index) {
            pageable = PageRequest.of(index, 3);
            page = productRepository.findAllByIdInAndAccountNotAndPriceBetweenAndStatusTrue(listIdProduct, account,
                    priceMin,
                    priceMax, pageable);
        } else {
            pageable = PageRequest.of(0, 3);
            page = productRepository.findAllByIdInAndAccountNotAndPriceBetweenAndStatusTrue(listIdProduct, account,
                    priceMin,
                    priceMax, pageable);
            index = page.getTotalPages() - 1;
        }

        list = page.getContent();
        List<Integer> listProductNew = new ArrayList<>();
        for (int i = 0; i < page.getTotalPages(); i++) {
            Pageable pageableOld = PageRequest.of(i, 3, Sort.by(Sort.Direction.ASC, "price"));
            Page<Product> pageOld = productRepository.findAllByIdInAndStatusTrue(listIdProduct, pageableOld);
            for (Product pr : pageOld.getContent()) {
                listProductNew.add(pr.getId());
            }
        }
        if (list.size() > 0) {
            listIdProduct = listProductNew;
        }
        model.addAttribute("listProducts", list);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("listCategories", categoryRepository.findAll());
        model.addAttribute("indexPage", index);
        return "client/SearchBuyBook";
    }

    @GetMapping("page/{id}")
    public String indexPage(@PathVariable("id") Integer id, Model model) {
        index = id;

        pageable = PageRequest.of(index, 3);
        page = productRepository.findAllByIdInAndStatusTrue(listIdProduct, pageable);
        list = page.getContent();
        model.addAttribute("listProducts", list);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("listCategories", categoryRepository.findAll());
        model.addAttribute("indexPage", index);
        return "client/SearchBuyBook";
    }

    @GetMapping("evaluate")
    public String filterEvaluate(Model model, @RequestParam("starRadio") String star) {
        List<Integer> listIdProductNew = new ArrayList<Integer>();
        for (Integer id : listIdProduct) {
            double totalStart = 0;
            for (Evalue eva : productRepository.findById(id).get().getEvalues()) {
                totalStart = totalStart + eva.getStar();
            }
            if (totalStart / productRepository.findById(id).get().getEvalues().size() >= Integer.parseInt(star)) {
                listIdProductNew.add(id);
            }
        }
        pageable = PageRequest.of(index, 3);
        page = productRepository.findAllByIdInAndStatusTrue(listIdProductNew, pageable);
        list = page.getContent();
        if (list.size() > 0) {
            listIdProduct = listIdProductNew;
        }
        model.addAttribute("listProducts", list);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("listCategories", categoryRepository.findAll());
        model.addAttribute("indexPage", index);
        return "client/SearchBuyBook";

    }

    @RequestMapping("arrangeprice")
    public String arrangePrice(Model model) {

        Pageable pageable = PageRequest.of(index, 3, Sort.by(Sort.Direction.ASC, "price"));
        page = productRepository.findAllByIdInAndStatusTrue(listIdProduct, pageable);
        list = page.getContent();
        List<Integer> listProductNew = new ArrayList<>();
        for (int i = 0; i < page.getTotalPages(); i++) {
            Pageable pageableOld = PageRequest.of(i, 3, Sort.by(Sort.Direction.ASC, "price"));
            Page<Product> pageOld = productRepository.findAllByIdInAndStatusTrue(listIdProduct, pageableOld);
            for (Product pr : pageOld.getContent()) {
                listProductNew.add(pr.getId());
            }
        }
        if (list.size() > 0) {
            listIdProduct = listProductNew;
        }
        model.addAttribute("listProducts", list);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("listCategories", categoryRepository.findAll());
        model.addAttribute("indexPage", index);
        return "client/SearchBuyBook";
    }
}
