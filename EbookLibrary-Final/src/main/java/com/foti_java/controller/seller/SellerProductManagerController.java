package com.foti_java.controller.seller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.foti_java.model.Account;
import com.foti_java.model.Category;
import com.foti_java.model.ImageProduct;
import com.foti_java.model.Product;
import com.foti_java.repository.CategoryRepository;
import com.foti_java.repository.ImageProductRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("seller")
public class SellerProductManagerController {
	@Autowired
	SessionService sessionService;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ServletContext context;
	@Autowired
	ImageProductRepository imageProductRepository;
	@Autowired
	HttpServletRequest req;
	Integer id;
	String imageName;
	Product product;
	Category categoryNew;
	List<String> image;
	Integer idCategory;
	boolean showModal = false;
	boolean showBtnCreate = true;
	boolean showBtnUpdate = false;
	boolean checkSale = true;
	String errorName = null;
	String errorSale = null;
	String errorNameCategory = null;
	Account account ;
	@GetMapping("/productmanager")
	public String productManafer(Model model) {
		account = sessionService.getAttribute("account");
		Sort sort = Sort.by(Direction.DESC,"id");
		List<Product> listProducts = productRepository.findByStatus(account.getId());
		List<Category> listCategories = categoryRepository.findAll(sort);
		//
		checkSale = false;
		model.addAttribute("listProduct", listProducts);
		req.setAttribute("listCategories", listCategories);
		model.addAttribute("errorName", errorName);
		model.addAttribute("product", product);
		model.addAttribute("errorSale", errorSale);
		model.addAttribute("showModal", showModal);
		model.addAttribute("showBtnUpdate", showBtnUpdate);
		model.addAttribute("showBtnCreate", showBtnCreate);
		model.addAttribute("errorNameCategory", errorNameCategory);
		model.addAttribute("checkSale", checkSale);
		model.addAttribute("categoryNew", categoryNew);
		model.addAttribute("images", image);
		showModal = false;
		errorName = null;
		errorSale = null;
		product = null;
		image = new ArrayList<>();
		return "/seller/pages/productmanager";
	}

	@PostMapping("/productmanager/create")
	public String create(Model model, @RequestParam("name") String name, @RequestParam("category") Category category,
			@RequestParam("writerName") String writerName, @RequestParam("publishingCompany") String publishingCompany,
			@RequestPart("images") List<MultipartFile> images, @RequestParam("quantity") Integer quantity,
			@RequestParam("price") double price, @RequestParam("discount") double discount,
			@RequestParam("introduce") String introduce,
			@RequestParam("weight") double weight) {
		Product products = new Product();
		products.setName(name);
		products.setAccount(account);
		products.setPrice(price);
		products.setDiscountType(true);
	
			products.setDiscount(discount);
		
		products.setCategory(category);
		products.setQuantity(quantity);
		products.setPublishingCompany(publishingCompany);
		products.setWriterName(writerName);
		products.setDate(new Date());
		products.setActive(false);
		products.setStatus(true);
		products.setIntroduce(introduce);
		products.setImage(getImage(images));
		products.setWeight(weight);
//		System.out.println("Img File: "+ images.get(0));
//		image = getListImage(images);	
		if (checkNameProduct(name) && checkSale(true, discount, price)) {
			productRepository.saveAndFlush(products);
			for (MultipartFile multipartFile : images) {
				if (!images.isEmpty() && !multipartFile.getOriginalFilename().equals(getImage(images))) {
					ImageProduct imageProduct = new ImageProduct();
					imageProduct.setName(multipartFile.getOriginalFilename());
					imageProduct.setProduct(products);
					imageProductRepository.saveAndFlush(imageProduct);
				}
				String realPath = context.getRealPath("/assets/img/" + multipartFile.getOriginalFilename());
				Path path = Path.of(realPath);
				if (!Files.exists(path)) {
					try {
						Files.createDirectories(path);
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
				File file = new File(context.getRealPath("/assets/img/" + multipartFile.getOriginalFilename()));
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
		} else {
			products.setDiscount(discount);
			product = products;
			return "redirect:/seller/productmanager";
		}
		return "redirect:/seller/productmanager/reset";
	}

	@GetMapping("/productmanager/edit")
	public String edit(Model model, @RequestParam("id") Integer idProduct) {
		image = new ArrayList<>();
		List<Product> listProducts = productRepository.findByStatus(account.getId());
		List<Category> listCategories = categoryRepository.findAll();
		model.addAttribute("listProduct", listProducts);
		model.addAttribute("listCategories", listCategories);
		id = idProduct;
		List<Product> listProduct = productRepository.findAll();
		for (Product products : listProduct) {
			if (products.getId() == id) {
				
				image.add(products.getImage());
				checkSale = products.isDiscountType();
				product = products;
			}
		}
		
		List<ImageProduct> listImage = imageProductRepository.findAll();
		for (ImageProduct images : listImage) {
			if (images.getProduct().getId() == id) {
				image.add(images.getName());
			}
		}
		model.addAttribute("images", image);
		model.addAttribute("product", product);
		model.addAttribute("errorName", errorName);
		model.addAttribute("checkSale", checkSale);
		model.addAttribute("errorSale", errorSale);
		return "/seller/pages/productmanager";
	}

	@PostMapping("/productmanager/update")
	public String update(Model model, @RequestParam("name") String name, @RequestParam("category") Category category,
			@RequestParam("writerName") String writerName, @RequestParam("publishingCompany") String publishingCompany,
			@RequestPart("images") List<MultipartFile> images, @RequestParam("quantity") Integer quantity,
			@RequestParam("price") double price, @RequestParam("discount") double discount,
			@RequestParam("introduce") String introduce,
			@RequestParam("weight") double weight) {
		account = sessionService.getAttribute("account");
		if (checkNameProductUpdate(name, id) && checkSale(true, discount, price)) {
			System.out.println("Updateid: " + id);
			product.setId(id);
			product.setName(name);
			product.setAccount(account);
			product.setDiscountType(true);
			product.setDiscount(discount);
			product.setPrice(price);
			product.setCategory(category);
			product.setQuantity(quantity);
			product.setPublishingCompany(publishingCompany);
			product.setWriterName(writerName);
			product.setIntroduce(introduce);
			product.setImage(getImage(images));
			product.setWeight(weight);
			productRepository.saveAndFlush(product);
			List<ImageProduct> imageProducts = imageProductRepository.findAll();
			for (ImageProduct imageProduct : imageProducts) {
				if (imageProduct.getProduct().getId() == id) {
					imageProductRepository.delete(imageProduct);
				}
			}
			for (MultipartFile multipartFile : images) {
				if (!images.isEmpty() && !multipartFile.getOriginalFilename().equals(getImage(images))) {
					ImageProduct imageProduct = new ImageProduct();
					imageProduct.setName(multipartFile.getOriginalFilename());
					imageProduct.setProduct(product);
					imageProductRepository.saveAndFlush(imageProduct);
			}
				String realPath = context.getRealPath("/assets/img/" + multipartFile.getOriginalFilename());
				Path path = Path.of(realPath);
				if (!Files.exists(path)) {
					try {
						Files.createDirectories(path);
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
				File file = new File(context.getRealPath("/assets/img/" + multipartFile.getOriginalFilename()));
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		} else {

			return "redirect:/seller/productmanager/edit?id=" + id;
		}
		errorName = null;
		return "redirect:/seller/productmanager/reset";
	}

	@GetMapping("/productmanager/delete")
	public String getMethodName(@RequestParam("id") Integer id) {
		List<Product> list = productRepository.findAll();
		for(Product product : list) {
			if(product.getId() ==  id) {
				product.setId(id);
				product.setStatus(false);
				productRepository.saveAndFlush(product);
				break;
			}
		}
		return "redirect:/seller/productmanager/reset";
	}

	public boolean checkNameProduct(String nameProduct) {
		boolean checkValue = true;
		for (Product product : productRepository.findByStatus(account.getId())) {
			if (product.isStatus() == false) {
				continue;
			}

			if (nameProduct.equals(product.getName())) {
				errorName = "Tên sản phẩm đã tồn tại";
				break;
			} else {
				errorName = null;
			}
		}
		return checkValue;
	}

	public boolean checkNameProductUpdate(String nameProduct, int productId) {
		boolean checkValue = true;
		for (Product product : productRepository.findByStatus(account.getId())) {
			if (product.getId() == productId || product.isStatus() == false) {
				continue;
			}

			if (nameProduct.equals(product.getName())) {
				errorName = "Tên sản phẩm đã tồn tại";
				checkValue = false;
				break;
			} else {
				errorName = null;
			}
		}
		return checkValue;
	}

	@PostMapping("/productmanager/category/create")
	public String createCategory(Model model, @RequestParam("nameCategory") String nameCategory) {
		if (checkNameCategory(nameCategory)) {
			Category category = new Category();
			category.setName(nameCategory);
			categoryRepository.saveAndFlush(category);

			categoryNew = null;
			errorNameCategory = null;
			showBtnCreate = true;
			showBtnUpdate = false;
		}
		showModal = true;
		return "redirect:/seller/productmanager";
	}

	@PostMapping("/productmanager/category/update")
	public String updateCategory(Model model, @RequestParam("nameCategory") String nameCategory) {
		if (checkNameCategoryUpdate(nameCategory, idCategory)) {
			Category category = new Category();
			category.setId(idCategory);
			category.setName(nameCategory);
			categoryRepository.saveAndFlush(category);

			categoryNew = null;
			errorNameCategory = null;
			showBtnCreate = true;
			showBtnUpdate = false;
		}
		showModal = true;
		return "redirect:/seller/productmanager";
	}

	@GetMapping("/productmanager/category/edit")
	public String editCategory(Model model, @RequestParam("id") Integer id) {
		idCategory = id;
		List<Category> list = categoryRepository.findAll();
		for (Category category : list) {
			if (category.getId() == id) {
				categoryNew = category;
				showModal = true;
				showBtnCreate = false;
				showBtnUpdate = true;
			}
		}

		return "redirect:/seller/productmanager";
	}
	@GetMapping("/productmanager/category/delete")
	public String deleteCategory(Model model, @RequestParam("id") Integer id) {
		idCategory = id;
		List<Category> list = categoryRepository.findAll();
		for (Category category : list) {
			if (category.getId() == id) {
				categoryRepository.delete(category);
			}
		}
		
		return "redirect:/seller/productmanager/category/reset";
	}

	@GetMapping("/productmanager/category/reset")
	public String resetCategory(Model model) {
		categoryNew = null;
		showModal = true;
		showBtnCreate = true;
		showBtnUpdate = false;
		errorNameCategory = null;
		return "redirect:/seller/productmanager";
	}

	@GetMapping("/productmanager/reset")
	public String resetProduct() {
		product = null;
		errorName = null;
		image = new ArrayList<>();
		return "redirect:/seller/productmanager";
	}

	public boolean checkNameCategory(String nameCategory) {
		boolean checkValue = true;
		for (Category category : categoryRepository.findAll()) {
			if (nameCategory.equalsIgnoreCase(category.getName())) {
				errorNameCategory = "Tên thể loại đã tồn tại";
				checkValue = false;
				break;
			} else {
				errorNameCategory = null;
			}
		}
		return checkValue;
	}

	public boolean checkNameCategoryUpdate(String nameCategory, int categoryId) {
		boolean checkValue = true;
		for (Category category : categoryRepository.findAll()) {
			if (category.getId() == categoryId) {
				continue;
			}

			if (nameCategory.equalsIgnoreCase(category.getName())) {
				errorNameCategory = "Tên thể loại đã tồn tại";
				checkValue = false;
				break;
			} else {
				errorNameCategory = null;
			}
		}
		return checkValue;
	}

	public boolean checkSale(boolean type, double sale , double price) {
		boolean checkValues = true;

			if (sale < 1000) {
				errorSale =  "Giá trị phải lớn hơn hoặc bằng 1000";
				checkValues = false;
			}else {
				errorSale = null;
			}
			if(sale >= price) {
				errorSale = "Giá trị giảm giá không được lớn hơn hoặc bằng giá trị sản phẩm";
				checkValues = false;
			}
		System.out.println("--------------------SaleValue-------------------" + sale);
		return checkValues;
	}
	
	public String getImage(List<MultipartFile> Listimages) {
		return Listimages.get(0).getOriginalFilename();
	}
	public List<String> getListImage(List<MultipartFile> Listimages) {
		 image = new ArrayList<String>();
		for(MultipartFile file : Listimages) {
			image.add(file.getOriginalFilename());
		}
		return image;
	}
}
