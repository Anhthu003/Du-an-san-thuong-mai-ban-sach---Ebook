package com.foti_java.controller.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.foti_java.service.SessionService;

import jakarta.servlet.ServletContext;

import com.foti_java.repository.AccountRepositoty;
import com.foti_java.model.Account;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("user")
public class UpdateProfileController {

    @Autowired
    AccountRepositoty accountRepository;
    
    @Autowired
    ServletContext context;
    
    @Autowired
    SessionService sessionService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @GetMapping("/updateProfile")
    public String getProfile(Model model) {
        Account account = sessionService.getAttribute("account"); // Lấy đối tượng Account từ session
        if (account == null) {
            // Xử lý trường hợp không tìm thấy account trong session, có thể là điều hướng tới trang đăng nhập
            return "redirect:/login";
        }
        int accountId = account.getId(); // Lấy id từ đối tượng Account
        Account account1 = accountRepository.findById(accountId).orElse(null);
        if (account1 == null) {
            // Xử lý trường hợp không tìm thấy tài khoản, có thể là điều hướng tới trang lỗi
            model.addAttribute("error", "Không tìm thấy tài khoản");
            return "client/error";
        }
        model.addAttribute("account", account1);
        return "client/updateProfile";
    }



    @PostMapping("/updateProfile")
    public String updateProfile(
            @RequestParam("shopName") String shopName,
            @RequestParam("username") String username,
            @RequestParam("fullname") String fullname,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("birthday") Date birthday,
            @RequestParam("avatar") MultipartFile avatar,
            @RequestParam("background") MultipartFile background,
            @RequestParam("id") Integer id,
            Model model) {
        // Kiểm tra email hợp lệ
        if (!checkEmail(email)) {
            model.addAttribute("errorMail", "Email không đúng định dạng");
            return "client/updateProfile";
        }
        // Kiểm tra số điện thoại hợp lệ
        if (!checkNumberPhone(phone)) {
            model.addAttribute("errorPhone", "Số điện thoại không đúng định dạng");
            return "client/updateProfile";
        }
        Account account1 = accountRepository.findById(id).orElse(null);
        if (account1 == null) {
            model.addAttribute("error", "Tài khoản không tồn tại");
            return "client/updateProfile";
        }
        sessionService.setAttribute("account", account1);
        Account account = sessionService.getAttribute("account");
        // Cập nhật thông tin tài khoản
        account.setShopName(shopName);
        account.setUsername(username);
        account.setFullname(fullname);
        account.setEmail(email);
        account.setBirthday(birthday);
        account.setPhone(phone);
        // Xử lý file avatar
        if (!avatar.isEmpty()) {
            String fileName = avatar.getOriginalFilename();
            String pathString = context.getRealPath("/assets/img/account/" + fileName);
            Path path = Path.of(pathString);
            try {
                if (!Files.exists(path.getParent())) {
                    Files.createDirectories(path.getParent());
                }
                Files.copy(avatar.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                account.setAvatar(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // Xử lý file background
        if (!background.isEmpty()) {
            String fileNameBR = background.getOriginalFilename();
            String pathString = context.getRealPath("/assets/img/background/" + fileNameBR);
            Path path = Path.of(pathString);
            try {
                if (!Files.exists(path.getParent())) {
                    Files.createDirectories(path.getParent());
                }
                Files.copy(background.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                account.setBackground(fileNameBR);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        accountRepository.saveAndFlush(account);
        model.addAttribute("account", account);
        return "client/updateProfile";  // Tên của view phải đúng
    }
    // Giả định bạn có phương thức kiểm tra email và số điện thoại
    private boolean checkEmail(String email) {
        // Kiểm tra email hợp lệ
        return email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }
    private boolean checkNumberPhone(String phone) {
        // Kiểm tra số điện thoại hợp lệ
        return phone.matches("^\\d{10,15}$");
    }
}
