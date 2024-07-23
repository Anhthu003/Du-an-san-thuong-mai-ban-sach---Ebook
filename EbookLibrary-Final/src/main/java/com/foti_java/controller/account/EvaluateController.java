package com.foti_java.controller.account;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.foti_java.model.Account;
import com.foti_java.model.Bill;
import com.foti_java.model.Evalue;
import com.foti_java.model.ImageEvalue;
import com.foti_java.model.Product;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.EvalueRepository;
import com.foti_java.repository.ImageEvalueRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;

@Controller
public class EvaluateController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	BillRepositoty billRepositoty;
	@Autowired
	EvalueRepository evalueRepository;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	ImageEvalueRepository imageEvalueRepository;
	@Autowired
	ServletContext context;
	@Autowired
	SessionService sessionService;

	Account account = new Account();

	@GetMapping("/user/evaluate/{idPro}")
	public String getEvaluates(@PathVariable("idPro") Integer idPro, Model model) {
		account = sessionService.getAttribute("account");

		Evalue evalute = evalueRepository.getByBillId(account.getId(), idPro);
		model.addAttribute("idPro", idPro);
		model.addAttribute("evalute", evalute);
		return "client/evaluate";
	}

	@PostMapping("/user/xemevalute/{idPro}")
	public String xemEvaluates(@PathVariable("idPro") Integer idPro, Model model) {
		Evalue evalue = (Evalue) evalueRepository.findByProductIdAndAccountId(idPro, account.getId());
		model.addAttribute("evalue", evalue);
		model.addAttribute("idPro", idPro);
		return "client/evaluate";
	}

	@PostMapping("/user/evaluate/gui")
	public String saveEvaluate(Model model, @RequestParam("idPro") Integer idPro,
			@RequestParam("content") String content, @RequestParam("quality") String quality,
			@RequestPart("images") MultipartFile[] imageFiles, @RequestParam("starDescription") String starDescription,
			@RequestParam("errorQuality") String errorQuality) {

		Evalue evalute = new Evalue();
		Product product = productRepository.getById(idPro);

		// Thiết lập các thuộc tính cho evalute
		evalute.setAccount(account);
		evalute.setCheckDescription("");
		evalute.setContent(content);
		evalute.setProduct(product);
		evalute.setQuality(quality);

		int ratingValue = Integer.parseInt(starDescription);
		if (ratingValue >= 1 && ratingValue <= 5) {
			evalute.setStar(ratingValue);
		}

		// Lưu evalute trước
		evalueRepository.saveAndFlush(evalute);

		// Sau đó lưu các hình ảnh và thiết lập quan hệ với evalute
		System.out.println("length" + imageFiles.length);
		List<ImageEvalue> imageList = saveImages(imageFiles, evalute);
		evalute.setImageEvalues(imageList);

		if (errorQuality.isBlank()) {
			model.addAttribute("btnGui", "btn-danger");
			evalueRepository.saveAndFlush(evalute);
		} else {
			model.addAttribute("btnGui", "btn-danger");
		}

		model.addAttribute("evalute", evalute);
		return "client/evaluate";
	}

	public List<ImageEvalue> saveImages(MultipartFile[] imageFiles, Evalue evalute) {
		List<ImageEvalue> images = new ArrayList<>();

		System.out.println("Images file: Size " + imageFiles.length);
		for (MultipartFile imageFile : imageFiles) {
			if (!imageFile.isEmpty()) {
				ImageEvalue image = new ImageEvalue();
				image.setName(imageFile.getOriginalFilename());
				image.setEvalue(evalute);
				System.out.println(image.getName());

				// Lưu ImageEvalue vào cơ sở dữ liệu
				imageEvalueRepository.save(image);

				// Lưu file ảnh vào thư mục /images
				String fileName = imageFile.getOriginalFilename();
				String realPath = context.getRealPath("/images/");
				Path path = Paths.get(realPath + fileName);

				try {
					if (!Files.exists(path.getParent())) {
						Files.createDirectories(path.getParent());
					}
					Files.copy(imageFile.getInputStream(), path);
				} catch (IOException e) {
					e.printStackTrace();
				}

				images.add(image);
			}
		}

		return images;
	}

	@PostMapping("/upload")
	@ResponseBody
	public String handleFileUpload(@RequestParam("images") MultipartFile[] files,
			@RequestParam("evalueId") Integer evalueId, RedirectAttributes redirectAttributes) {
		// Lấy thông tin Evalue từ cơ sở dữ liệu

		Evalue evalute = evalueRepository.findById(evalueId).orElse(null);
		if (evalute == null) {
			return "Evalue not found!";
		}

		return "Files uploaded successfully!";
	}

}
