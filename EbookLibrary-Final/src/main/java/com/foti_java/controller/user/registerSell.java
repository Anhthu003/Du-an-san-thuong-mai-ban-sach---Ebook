package com.foti_java.controller.user;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.aspectj.apache.bcel.classfile.Module.Provide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.foti_java.model.Account;
import com.foti_java.model.Address;
import com.foti_java.model.Commune;
import com.foti_java.model.District;
import com.foti_java.model.Province;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.CommuneRepository;
import com.foti_java.repository.DistrictRepository;
import com.foti_java.repository.ProvinceRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("Ebook/user/registerSell")
public class registerSell {
	@Autowired
	private SessionService sessionService;
	@Autowired
	private AccountRepositoty accountRepository;
	@Autowired
	ServletContext context;

	@GetMapping("edit/{id}")
	public String showEditProductForm(Model model, @PathVariable("id") Integer id) {
		// Lấy account từ database
		Account account = accountRepository.findById(id).orElse(null);
		// Lưu account vào session
		sessionService.setAttribute("account", account);
		// Thêm account vào Model để hiển thị trên view
		model.addAttribute("account", account);
		// Trả về view để hiển thị form chỉnh sửa sản phẩm
		return "client/registerSell/registerSell01";
	}

	@PostMapping("edit/registerSell01/{id}")
	public String updateProduct(@ModelAttribute("account") Account account, @RequestParam("id") Integer id,
			@RequestParam("taxCode") String taxCode) {
		// Cập nhật thông tin account từ form 1 
		// Lưu account và taxCode vào session
		sessionService.setAttribute("account", account);
		sessionService.setAttribute("taxCode", taxCode);
		accountRepository.saveAndFlush(account);
		// Chuyển hướng đến form 2
		return "redirect:/Ebook/user/registerSell/edit/registerSell02/" + id;
	}
	@GetMapping("edit/registerSell02/{id}")
	public String showRegisterSellStep2Form(Model model, @PathVariable("id") Integer id, HttpServletRequest request) {
		// Lấy account và taxCode từ session
		Account account = (Account) request.getSession().getAttribute("account");
		String taxCode = (String) request.getSession().getAttribute("taxCode");
		// Thêm account và taxCode vào Model để hiển thị trên view
		model.addAttribute("account", account);
		model.addAttribute("taxCode", taxCode);
		// Trả về view để hiển thị form đăng ký bán hàng bước 2
		return "/client/registerSell/registerSell02";
	}

	@PostMapping("edit/registerSell02/{id}")
	public String processRegisterSellStep2(@ModelAttribute("account") Account account, HttpServletRequest request,@RequestParam("id") Integer id,
			@RequestParam("taxCode") String taxCode) {
		// Lưu account và taxCode vào session
		request.getSession().setAttribute("account", account);
		request.getSession().setAttribute("taxCode", taxCode);
		accountRepository.saveAndFlush(account);
		// Chuyển hướng đến phương thức showRegisterSellStep3Form()
		return "redirect:/Ebook/user/registerSell/edit/registerSell03/{id}";
	}

	@GetMapping("edit/registerSell03/{id}")
	public String showRegisterSellStep3Form(Model model, @PathVariable("id") Integer id, HttpServletRequest request) {
		// Lấy account từ session
		Account account = (Account) request.getSession().getAttribute("account");
		// Lấy taxCode từ session
		String taxCode = (String) request.getSession().getAttribute("taxCode");
		// Thêm account và taxCode vào Model để hiển thị trên view
		model.addAttribute("account", account);
		model.addAttribute("account", account);
		model.addAttribute("taxCode", taxCode);
		// Trả về view để hiển thị form đăng ký bán hàng bước 3
		return "/client/registerSell/registerSell03";
	}

//	@PostMapping("/edit/registerSell03/{id}")
//	public String processRegisterSellStep3(@ModelAttribute("account") Account account
//	                                       ) {
//	    // Lưu dữ liệu từ form vào đối tượng Account
//	   // account.setTaxCode(taxCode);
//	    
//	    // Lưu account vào database
//	    accountRepository.save(account);
//
//	    // Chuyển hướng đến form kế tiếp
//	    return "redirect:/Ebook/user/registerSell/edit/registerSell03/" + account.getId();
//	}


	@GetMapping("edit/registerSell04/{id}")
	public String showRegisterSellStep4Form(Model model, @PathVariable("id") Integer id, HttpServletRequest request) {
		// Lấy account từ session
		Account account = (Account) request.getSession().getAttribute("account");
		// Thêm account vào Model để hiển thị trên view
		model.addAttribute("account", account);
		// Trả về view để hiển thị form đăng ký bán hàng bước 4
		return "/client/registerSell/registerSell04";
	}

	@PostMapping("/edit/registerSellStep4/{id}")
	public String processRegisterSellStep4(@ModelAttribute("account") Account account,@RequestParam("id") Integer id,
//	        @RequestParam("beforeCitizenIdentification") MultipartFile beforeCitizenFile,
//	        @RequestParam("afterCitizenIdentification") MultipartFile afterCitizenFile,
	        HttpServletRequest request) throws IOException {
	    Account sessionAccount = sessionService.getAttribute("account");

	    String beforeCitizenImageName = "";
	    String afterCitizenImageName = "";

	    // Xử lý ảnh trước
//	    if (!beforeCitizenFile.isEmpty()) {
//	        String beforeFileName = beforeCitizenFile.getOriginalFilename();
//	        String beforePath = context.getRealPath("/img/" + beforeFileName);
//	        Path path = Path.of(beforePath);
//	        beforeCitizenImageName = beforeFileName;
//
//	        if (!Files.exists(path)) {
//	            try {
//	                Files.createDirectories(path);
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        }
//
//	        try {
//	            Files.copy(beforeCitizenFile.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//	            beforeCitizenImageName = beforePath;
//	            account.setBeforeCitizenIdentification(beforeCitizenImageName);
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//	    }
//
//	    // Xử lý ảnh sau
//	    if (!afterCitizenFile.isEmpty()) {
//	        String afterFileName = afterCitizenFile.getOriginalFilename();
//	        String afterPath = context.getRealPath("/img/" + afterFileName);
//	        Path path = Path.of(afterPath);
//	        afterCitizenImageName = afterFileName;
//
//	        if (!Files.exists(path)) {
//	            try {
//	                Files.createDirectories(path);
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        }
//
//	        try {
//	            Files.copy(afterCitizenFile.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//	            afterCitizenImageName = afterPath;
//	            account.setAfterCitizenIdentification(afterCitizenImageName);
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//	    }
	    // Lưu tên ảnh vào đối tượng Account
	    sessionAccount.setBeforeCitizenIdentification(beforeCitizenImageName);
	    sessionAccount.setAfterCitizenIdentification(afterCitizenImageName);
//	    // Cập nhật các thông tin khác của tài khoản từ form
	    sessionAccount.setNumberCitizenIdentification(account.getNumberCitizenIdentification());
	    sessionAccount.setFullname(account.getFullname());
	    // Lưu Account vào database
	    accountRepository.saveAndFlush(sessionAccount);
	    // Chuyển hướng đến form tiếp theo hoặc trang thành công
	    return "redirect:/Ebook/user/registerSell/edit/registerSell04/" + sessionAccount.getId();
	}

}