package com.foti_java.controller.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.foti_java.model.Account;
import com.foti_java.model.Address;
import com.foti_java.model.CartDetail;
import com.foti_java.model.Product;
import com.foti_java.model.RoleDetail;
import com.foti_java.model.Voucher;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.AddressRepository;
import com.foti_java.repository.CartDetailRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.repository.VoucherRepository;
import com.foti_java.service.SessionService;

@Controller
@RequestMapping("user")
public class BuyBookDetailsController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	CartDetailRepository cartDetailRepository;
	@Autowired
	SessionService sessionService;
	@Autowired
	VoucherRepository voucherRepository;
	@Autowired
	AddressRepository addressRepository;

	@RequestMapping("buybookdetails/{idProduct}")
	public String get(@PathVariable("idProduct") Integer idProduct, Model model) {
		Product product = productRepository.findById(idProduct).get();

		Page<Product> pageProduct = productRepository.findAllByAccountAndIdNotAndStatusTrue(product.getAccount(),
				idProduct, PageRequest.of(0, 10));
		model.addAttribute("listProduct", pageProduct.getContent());
		model.addAttribute("product", product);
		return "client/buyBookDetails";
	}

	@GetMapping("shoppingcart/add/{idProduct}")
	public String cartAdd(Model model, @PathVariable("idProduct") Integer idProduct,
			@RequestParam("btnradio") Integer quantity) {
		Account account = (Account) sessionService.getAttribute("account");
		Product product = productRepository.findById(idProduct).get();
		CartDetail cartDetail = cartDetailRepository.findFirstByAccountAndProduct(account, product);
		if (cartDetail == null) {
			CartDetail cart = new CartDetail();
			cart.setProduct(product);
			cart.setAccount(account);
			cart.setQuantity(quantity);
			cartDetailRepository.save(cart);
		} else {
			cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
			cartDetailRepository.save(cartDetail);
		}
		return "redirect:/user/shoppingcart";
	}

	@GetMapping("buybookdetails/pay/{idProduct}")
	public String pay(@PathVariable("idProduct") Integer idProduct, @RequestParam("btnradio") Integer quantity,
			Model model) throws ClientProtocolException, IOException {
		// Account account = sessionService.getAttribute("account");
		// CartDetail cartDetail = new CartDetail();
		// cartDetail.setAccount(account);
		// cartDetail.setProduct(productRepository.getById(idProduct));
		// cartDetail.setQuantity(quantity);
		// cartDetailRepository.save(cartDetail);
		// try {
		// Thread.sleep(1000);
		// } catch (InterruptedException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// CartDetail cartNew =
		// cartDetailRepository.findFirstByAccountAndProduct(account,
		// productRepository.getById(idProduct));
		// List<Account> listAccounts = new ArrayList<>();
		// listAccounts.add(productRepository.findById(idProduct).get().getAccount());
		// for (Account ac : accountRepositoty.findAll()) {
		// boolean check = false;
		// for (RoleDetail roleDetail : ac.getRoledetails()) {
		// if (roleDetail.getRole().getName().equalsIgnoreCase("admin")) {
		// listAccounts.add(ac);
		// check = true;
		// break;
		// }
		// }
		// if (check) {
		// break;
		// }
		// }

		// List<Integer> listCartId = new ArrayList<Integer>();
		// listCartId.add(cartNew.getId());
		// double weight = quantity * cartNew.getProduct().getWeight();
		// List<CartDetail> listCarts = cartDetailRepository.findAllByIdIn(listCartId);
		// Address addrTo = new Address();
		// Address addrFrom = new Address();
		// for (Address address : account.getAddresses()) {
		// if (address.isStatus()) {
		// addrTo = address;
		// break;
		// }
		// }
		// for (Address address : cartNew.getProduct().getAccount().getAddresses()) {
		// if (address.isStatus()) {
		// addrFrom = address;
		// break;
		// }
		// }

		// JSONObject jsonOrder = new JSONObject();
		// jsonOrder.put("from_district_id",
		// Integer.parseInt(addrFrom.getDistrict().getDistrictId()));
		// jsonOrder.put("from_ward_code",
		// addrFrom.getCommune().getCommuneId().toString());
		// jsonOrder.put("service_id", 53320);
		// jsonOrder.put("to_district_id",
		// Integer.parseInt(addrTo.getDistrict().getDistrictId()));
		// jsonOrder.put("to_ward_code", addrTo.getCommune().getCommuneId().toString());
		// jsonOrder.put("weight", weight);
		// try {
		// StringEntity entity = new StringEntity(jsonOrder.toString(),
		// ContentType.APPLICATION_JSON);
		// HttpPost post = new
		// HttpPost("https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee");
		// post.setEntity(entity);
		// post.setHeader("Token", "87b48598-2325-11ef-a951-76299e96dead");
		// post.setHeader("Content-type", "application/json");
		// ObjectMapper objectMapper = new ObjectMapper();
		// CloseableHttpClient client = HttpClients.createDefault();
		// CloseableHttpResponse response = client.execute(post);
		// JsonNode jsonNode =
		// objectMapper.readTree(EntityUtils.toString(response.getEntity()));
		// JsonNode data = jsonNode.get("data");
		// model.addAttribute("service_fee",
		// Double.parseDouble(data.get("service_fee").toString()));
		// } catch (UnsupportedEncodingException e) {
		// e.printStackTrace();
		// }
		// List<Integer> idProducts = new ArrayList<Integer>();
		// idProducts.add(idProduct);

		// List<Product> listProduct =
		// productRepository.findAllByIdInAndStatusTrue(idProducts);
		// List<Integer> idSeller = new ArrayList<Integer>();
		// for (Product in : listProduct) {
		// idSeller.add(in.getAccount().getId());
		// }
		// List<Account> listSeller = accountRepositoty.findAllByIdIn(idSeller);
		// for (Account ac : listSeller) {
		// listAccounts.add(ac);
		// }
		// List<Voucher> listVouchers =
		// voucherRepository.findAllByAccountIn(listAccounts);
		// model.addAttribute("addresses", addressRepository.findAllByAccount(account));
		// model.addAttribute("account", account);
		// model.addAttribute("listVouchers", listVouchers);
		// model.addAttribute("listCarts", listCarts);
		// model.addAttribute("listProduct", listProduct);
		// model.addAttribute("listSeller", listSeller);

		Account account = sessionService.getAttribute("account");
		Address addrTo = new Address();
		Address addFrom = new Address();
		for (Address addr : account.getAddresses()) {
			if (addr.isStatus()) {
				addrTo = addr;
				break;
			}
		}
		for (Address addr : productRepository.findById(idProduct).get().getAccount().getAddresses()) {
			if (addr.isStatus()) {
				addFrom = addr;
				break;
			}
		}

		Account admin = new Account();
		List<Account> sellers = new ArrayList();
		for (Account acc : accountRepositoty.findAll()) {
			for (RoleDetail roledetail : accountRepositoty.findById(acc.getId()).get().getRoledetails()) {
				if (roledetail.getRole().getName().equalsIgnoreCase("admin")) {
					admin = acc;
					break;
				}
			}
		}
		List<Voucher> vouchers = voucherRepository.findAllByAccount(admin);
		List<CartDetail> cartDetails = new ArrayList<CartDetail>();
		sellers.add(productRepository.findById(idProduct).get().getAccount());
		List<Product> products = new ArrayList<>();
		products.add(productRepository.findById(idProduct).get());

		double serviceFee = 0;
		model.addAttribute("addresses", addressRepository.findAllByAccount(account));
		model.addAttribute("account", account);
		model.addAttribute("listVouchers", vouchers);
		model.addAttribute("listCarts", cartDetails);
		model.addAttribute("listProduct", products);
		model.addAttribute("listSeller", sellers);
		model.addAttribute("quantity", quantity);
		JSONObject jsonOrder = new JSONObject();
		jsonOrder.put("from_district_id", Integer.parseInt(addFrom.getDistrict().getDistrictId()));
		jsonOrder.put("from_ward_code", addFrom.getCommune().getCommuneId().toString());
		jsonOrder.put("service_id", 53320);
		jsonOrder.put("to_district_id", Integer.parseInt(addrTo.getDistrict().getDistrictId()));
		jsonOrder.put("to_ward_code", addrTo.getCommune().getCommuneId().toString());
		jsonOrder.put("weight", quantity * productRepository.findById(idProduct).get().getWeight());
		try {
			StringEntity entity = new StringEntity(jsonOrder.toString(), ContentType.APPLICATION_JSON);
			HttpPost post = new HttpPost("https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee");
			post.setEntity(entity);
			post.setHeader("Token", "87b48598-2325-11ef-a951-76299e96dead");
			post.setHeader("Content-type", "application/json");
			ObjectMapper objectMapper = new ObjectMapper();
			CloseableHttpClient client = HttpClients.createDefault();
			CloseableHttpResponse response = client.execute(post);
			JsonNode jsonNode = objectMapper.readTree(EntityUtils.toString(response.getEntity()));
			JsonNode data = jsonNode.get("data");
			model.addAttribute("service_fee", Double.parseDouble(data.get("service_fee").toString()));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "client/pay";
	}
}
