package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.Account;
import com.foti_java.model.AccountProduct;
import com.foti_java.model.CartDetail;
import com.foti_java.model.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Integer> {
	List<CartDetail> findAllCartDetailsByAccount(Account account);

	CartDetail findFirstByAccountAndProduct(Account account, Product product);

	List<CartDetail> findAllByIdIn(List<Integer> list);
//
//	@Query("SELECT a.avatar, a.shopName, SUM(c.quantity), p FROM CartDetail c JOIN c.product p JOIN p.account a WHERE c IN :listCartDetails GROUP BY a.avatar, a.shopName, p")
//	List<AccountProduct> listAccountByCartDetails(@Param("listCartDetails") List<CartDetail> listCartDetails);
	
	@Query("SELECT a.avatar, a.shopName, SUM(c.quantity), p FROM CartDetail c JOIN c.product p JOIN p.account a WHERE c IN :listCartDetails GROUP BY a.avatar, a.shopName,p")
	List<AccountProduct> listAccountByCartDetails(@Param("listCartDetails") List<CartDetail> listCartDetails);

	
	
}
