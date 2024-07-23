package com.foti_java.controller.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.foti_java.model.Account;
import com.foti_java.model.Address;
import com.foti_java.model.Bill;
import com.foti_java.model.BillDetail;
import com.foti_java.model.Product;
import com.foti_java.model.Transaction;
import com.foti_java.model.Voucher;
import com.foti_java.model.VoucherDetail;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.AddressRepository;
import com.foti_java.repository.BillDetailRepository;
import com.foti_java.repository.BillRepositoty;
import com.foti_java.repository.CartDetailRepository;
import com.foti_java.repository.OrderStatusRepository;
import com.foti_java.repository.PaymentMethodRepository;
import com.foti_java.repository.ProductRepository;
import com.foti_java.repository.TransactionRepository;
import com.foti_java.repository.VoucherDetailRepository;
import com.foti_java.repository.VoucherRepository;
import com.foti_java.service.SessionService;
import com.foti_java.service.VNPayService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("user")
public class PayController {
	@Autowired
	VNPayService vnPayService;
	@Autowired
	BillRepositoty billRepositoty;
	String cart[];
	@Autowired
	SessionService sessionService;
	@Autowired
	PaymentMethodRepository paymentMethodRepository;
	@Autowired
	OrderStatusRepository orderStatusRepository;

	@Autowired
	BillDetailRepository billDetailRepository;
	@Autowired
	AccountRepositoty accountRepositoty;
	@Autowired
	ProductRepository productRepository;

	@Autowired
	CartDetailRepository cartDetailRepository;
	@Autowired
	AddressRepository addressRepository;
	@Autowired
	VoucherRepository voucherRepository;

	@Autowired
	VoucherDetailRepository voucherDetailRepository;
	@Autowired
	TransactionRepository transactionRepository;

	List<Bill> bills = new ArrayList<Bill>();

	// @GetMapping("pay")
	// public String handleTest(HttpServletRequest req, HttpServletResponse resp,
	// @RequestParam("idCartDetails") Integer[] idCartDetails,
	// @RequestParam("idSeller") Integer[] idSellers,
	// @RequestParam(name = "idVoucher", defaultValue = "0") Integer voucherId,
	// @RequestParam("total") String totalParam, @RequestParam("service_fee") String
	// serv_fee,
	// @RequestParam("payMethod") int payMethod) throws ClientProtocolException,
	// IOException {
	// Account account = sessionService.getAttribute("account");
	// bills = new ArrayList<Bill>();
	// for (Integer idSeller : idSellers) {
	// Address addrFrom = new Address();
	// Address addrTo = new Address();
	// double weight = 0;
	// double totalPrice = 0;
	// int totalQuantity = 0;
	// Bill bill = new Bill();
	// String fullNameAddress = "";
	// for (Address addess :
	// addressRepository.findAllByAccount(accountRepositoty.findById(idSeller).get()))
	// {
	// if (addess.isStatus()) {
	// addrFrom = addess;
	// break;
	// }
	// }

	// for (Address addess : addressRepository.findAllByAccount(account)) {
	// if (addess.isStatus()) {
	// addrTo = addess;
	// fullNameAddress = addess.getFullNameAddress();
	// break;
	// }
	// }

	// for (Integer idCart : idCartDetails) {
	// CartDetail cartDetail = cartDetailRepository.findById(idCart).get();
	// weight += cartDetail.getQuantity() * cartDetail.getProduct().getWeight();
	// totalPrice += cartDetail.getQuantity()
	// * (cartDetail.getProduct().getPrice() -
	// cartDetail.getProduct().getDiscount());
	// totalQuantity += cartDetail.getQuantity();

	// }
	// bill.setAccount(account);
	// bill.setStatus(true);
	// bill.setTotalPrice(totalPrice);
	// bill.setQuantity(totalQuantity);
	// bill.setPaymentMethod(paymentMethodRepository.findById(1).get());
	// bill.setDateBuy(new Date());
	// if (voucherId > 0) {
	// Voucher voucher = voucherRepository.findById(voucherId).get();
	// VoucherDetail voucherDetail = new VoucherDetail();
	// voucherDetail.setAccount(account);
	// voucherDetail.setVoucher(voucher);
	// voucherDetail.setBill(bill);
	// voucherDetail.setStatus(true);
	// voucher.setQuantity(voucher.getQuantity() + 1);
	// voucher = voucherRepository.save(voucher);
	// voucherDetailRepository.save(voucherDetail);
	// if (voucherRepository.findById(voucherId).get().getSale() > 100) {
	// bill.setDiscount(voucherRepository.findById(voucherId).get().getSale());
	// bill.setVoucherDetail(voucherDetailRepository.findByAccountAndVoucher(account,
	// voucherRepository.findById(voucherId).get()));
	// voucherId = 0;
	// } else {
	// bill.setDiscount((voucherRepository.findById(voucherId).get().getSale() /
	// 100) * totalPrice);
	// bill.setVoucherDetail(voucherDetailRepository.findByAccountAndVoucher(account,
	// voucherRepository.findById(voucherId).get()));
	// voucherId = 0;

	// }
	// }
	// bill = billRepositoty.save(bill);
	// bills.add(bill);
	// for (Integer cartId : idCartDetails) {
	// BillDetail billDetail = new BillDetail();
	// billDetail.setBill(bill);
	// billDetail.setProduct(cartDetailRepository.findById(cartId).get().getProduct());
	// billDetail.setQuantity(cartDetailRepository.findById(cartId).get().getQuantity());
	// billDetail = billDetailRepository.save(billDetail);
	// Product product = productRepository
	// .findById(cartDetailRepository.findById(cartId).get().getProduct().getId()).get();
	// product.setQuantitySell(
	// product.getQuantitySell() +
	// cartDetailRepository.findById(cartId).get().getQuantity());
	// product.setQuantity(product.getQuantity() -
	// cartDetailRepository.findById(cartId).get().getQuantity());
	// productRepository.save(product);
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
	// HttpPost post = new HttpPost(
	// "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee");
	// post.setEntity(entity);
	// post.setHeader("Token", "87b48598-2325-11ef-a951-76299e96dead");
	// post.setHeader("Content-type", "application/json");
	// ObjectMapper objectMapper = new ObjectMapper();
	// CloseableHttpClient client = HttpClients.createDefault();
	// CloseableHttpResponse response = client.execute(post);
	// JsonNode jsonNode =
	// objectMapper.readTree(EntityUtils.toString(response.getEntity()));
	// JsonNode data = jsonNode.get("data");
	// bill.setPriceShipping(Double.parseDouble(data.get("service_fee").toString()));
	// billRepositoty.save(bill);
	// } catch (UnsupportedEncodingException e) {
	// e.printStackTrace();
	// }
	// for (Integer idCart : idCartDetails) {
	// cartDetailRepository.deleteById(idCart);
	// }
	// }
	// if (payMethod == 0) {
	// return "redirect:/user/home";
	// } else {

	// String chuoiToTal = totalParam.replace(".", "");
	// String chuoiSericeFee = serv_fee.replace(".", "");
	// BigInteger total = new BigInteger(chuoiToTal);
	// BigInteger service_fee = new BigInteger(chuoiSericeFee);
	// String baseUrl = req.getScheme() + "://" + req.getServerName() + ":" +
	// req.getServerPort();
	// String vnpayUrl = vnPayService.createOrder(total.add(service_fee), "Thanh
	// toan hoa don mua hang", baseUrl);
	// return "redirect:" + vnpayUrl;
	// }

	// }
	Bill bill = new Bill();

	@GetMapping("pay")
	public String getPay(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(name = "idCartDetails", defaultValue = "") Integer[] idCartDetails,
			@RequestParam("voucherSeller") Integer[] idVoucherSeller, @RequestParam("idProduct") Integer[] idProduct,
			@RequestParam("quantityProduct") Integer[] quantityProduct,
			@RequestParam(name = "idVoucher", defaultValue = "0") Integer voucherId,
			@RequestParam("total") String totalParam, @RequestParam("service_fee") String serv_fee,
			@RequestParam("payMethod") int payMethod) throws ClientProtocolException, IOException {
		Integer quantity = 0;
		double discount = 0;
		Account account = sessionService.getAttribute("account");
		Address addTo = new Address();
		for (Address add : account.getAddresses()) {
			if (add.isStatus()) {
				addTo = add;
			}
		}

		for (Integer quant : quantityProduct) {
			quantity += quant;
		}

		bill.setStatus(true);
		bill.setPriceShipping(Double.parseDouble(serv_fee.replace(".", "")));
		String chuoiTo = totalParam.replace(".0", "");
		String chuoiSerice = serv_fee.replace(".", "");
		BigInteger tot = new BigInteger(chuoiTo);
		BigInteger service = new BigInteger(chuoiSerice);
		bill.setTotalPrice(Double.parseDouble(tot.add(service).toString().replace(".", "")));
		bill.setAccount(account);
		bill.setDateBuy(new Date());
		bill.setAddRessTo(addTo.getFullNameAddress());
		bill.setPaymentMethod(paymentMethodRepository.findById(1).get());
		VoucherDetail voucherDetail = new VoucherDetail();
		Voucher voucher = new Voucher();
		if (voucherId > 0) {
			bill.setDiscount(voucherRepository.findById(voucherId).get().getSale());
			voucher = voucherRepository.findById(voucherId).get();
			voucher.setQuantity(voucher.getQuantity() + 1);
			voucher = voucherRepository.save(voucher);
			voucherDetail.setVoucher(voucher);
			voucherDetail.setStatus(true);
			voucherDetail = voucherDetailRepository.save(voucherDetail);
			voucherDetail.setAccount(account);
			discount = voucherRepository.findById(voucherId).get().getSale();
			bill.setVoucherDetail(voucherDetail);
		} else {
			bill.setDiscount(0);
		}
		bill = billRepositoty.save(bill);
		for (int i = 0; i < idProduct.length; i++) {
			if (idProduct[i] != null) {
				Product product = productRepository.findById(idProduct[i]).get();
				BillDetail billDetail = new BillDetail();
				if (idVoucherSeller != null && idVoucherSeller.length > 0) {
					for (Integer inter : idVoucherSeller) {
						if (inter != null
								&& voucherRepository.findById(inter).get().getAccount() == product.getAccount()) {
							Voucher vouc = voucherRepository.findById(inter).get();
							VoucherDetail voucherSeller = new VoucherDetail();
							voucherSeller.setAccount(account);
							voucherSeller.setVoucher(vouc);
							voucherSeller.setStatus(true);
							vouc.setQuantity(vouc.getQuantity() + 1);
							vouc = voucherRepository.save(vouc);
							voucherSeller = voucherDetailRepository.save(voucherSeller);
							billDetail.setVoucherDetail(voucherSeller);
							billDetail.setDiscount(vouc.getSale());
							break;
						}
					}
				}
				billDetail.setProduct(product);
				product.setQuantity(product.getQuantity() - quantityProduct[i]);
				product.setQuantitySell(product.getQuantitySell() + quantityProduct[i]);
				billDetail.setStatus(false);
				billDetail.setActive(false);
				billDetail.setDateBuy(new Date());
				billDetail.setBill(bill);
				billDetail.setPrice(product.getPrice() - product.getDiscount());
				Address addFrom = new Address();
				for (Address addFr : productRepository.findById(idProduct[i]).get().getAccount().getAddresses()) {
					if (addFr.isStatus()) {
						addFrom = addFr;
						break;
					}

				}
				billDetail.setAddressFrom(addFrom.getFullNameAddress());
				JSONObject jsonOrder = new JSONObject();
				jsonOrder.put("from_district_id", Integer.parseInt(addFrom.getDistrict().getDistrictId()));
				jsonOrder.put("from_ward_code", addFrom.getCommune().getCommuneId().toString());
				jsonOrder.put("service_id", 53320);
				jsonOrder.put("to_district_id", Integer.parseInt(addTo.getDistrict().getDistrictId()));
				jsonOrder.put("to_ward_code", addTo.getCommune().getCommuneId().toString());
				jsonOrder.put("weight",
						quantityProduct[i] * productRepository.findById(idProduct[i]).get().getWeight());

				try {
					StringEntity entity = new StringEntity(jsonOrder.toString(), ContentType.APPLICATION_JSON);
					HttpPost post = new HttpPost(
							"https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee");
					post.setEntity(entity);
					post.setHeader("Token", "87b48598-2325-11ef-a951-76299e96dead");
					post.setHeader("Content-type", "application/json");
					ObjectMapper objectMapper = new ObjectMapper();
					CloseableHttpClient client = HttpClients.createDefault();
					CloseableHttpResponse response = client.execute(post);
					JsonNode jsonNode = objectMapper.readTree(EntityUtils.toString(response.getEntity()));
					JsonNode data = jsonNode.get("data");
					billDetail.setPriceShipping(Double.parseDouble(data.get("service_fee").toString()));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				billDetail.setQuantity(quantityProduct[i]);
				billDetailRepository.save(billDetail);
			}
		}
		for (Integer inter : idCartDetails) {
			cartDetailRepository.deleteById(inter);
		}

		if (payMethod == 0) {
			return "redirect:/user/home";
		} else {
			bill.setPaymentMethod(paymentMethodRepository.findById(2).get());
			billRepositoty.save(bill);
			String chuoiToTal = totalParam.replace(".", "");
			String chuoiSericeFee = serv_fee.replace(".", "");
			BigInteger total = new BigInteger(chuoiToTal);
			BigInteger service_fee = new BigInteger(chuoiSericeFee);
			String baseUrl = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort();
			String vnpayUrl = vnPayService.createOrder(total.add(service_fee), "Thanh toan hoa don mua hang", baseUrl);
			return "redirect:" + vnpayUrl;
		}
	}

	@GetMapping("vnpay-payment")
	public String GetMapping(HttpServletRequest request, Model model) {
		Account account = sessionService.getAttribute("account");
		Transaction transaction = new Transaction();
		transaction.setAccount(account);
		int paymentStatus = vnPayService.orderReturn(request);
		String orderInfo = request.getParameter("vnp_OrderInfo");
		String paymentTime = request.getParameter("vnp_PayDate");
		String transactionId = request.getParameter("vnp_TransactionNo");
		String totalPrice = request.getParameter("vnp_Amount");
		double Total = Double.parseDouble(totalPrice) / 100;
		transaction.setPrice(Total);
		transaction.setBanksNumber(transactionId);
		transaction.setBill(bill);
		transactionRepository.save(transaction);
		model.addAttribute("orderId", orderInfo);
		model.addAttribute("totalPrice", Total);
		model.addAttribute("paymentTime", paymentTime);
		model.addAttribute("transactionId", transactionId);
		return "client/paySuccess";
	}
}
