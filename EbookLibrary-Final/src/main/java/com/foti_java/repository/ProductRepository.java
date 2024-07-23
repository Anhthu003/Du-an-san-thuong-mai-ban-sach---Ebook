package com.foti_java.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.Account;
import com.foti_java.model.CartDetail;
import com.foti_java.model.Category;
import com.foti_java.model.Like;
import com.foti_java.model.Product;
import com.foti_java.service.SessionService;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	List<Product> findAllByIdInAndStatusTrue(List<Integer> id);

	Page<Product> findAllByAccountNotAndStatusTrue(Account account, Pageable pageable);

	Page<Product> findAllByAccountAndStatusTrue(Account account, Pageable pageable);

	Page<Product> findAllByIdNotInAndAccountNotAndStatusTrue(List<Integer> ids, Account account, Pageable pageable);

	Page<Product> findAllByAccountAndIdNotAndStatusTrue(Account account, Integer productId, Pageable pageable);

	Page<Product> findAllByAccountAndIdNotInAndStatusTrue(Account account, List<Integer> productIds, Pageable pageable);

	@Query("SELECT o FROM Product o WHERE o.id != 1")
	List<Product> findAllNotByIDAndStatusTrue(Integer Id);

	Page<Product> findAllByIdInAndStatusTrue(List<Integer> list, Pageable pageable);

	Page<Product> findAllByIdInAndCategoryInAndAccountNotAndStatusTrue(List<Integer> listIdProduct, List<Category> list,
			Account account, Pageable pageable);

	Page<Product> findAllByIdInAndAccountNotAndPriceBetweenAndStatusTrue(List<Integer> listId, Account account, double min,
			double max, Pageable pageable);

//	Page<Product> findAllByPriceBetween(double min, double max, Pageable pageable);

	Page<Product> findAllByAccountNotAndNameContainingAndStatusTrue(Account account, String name, Pageable pageable);

	@Query("SELECT p FROM Product p WHERE p.status = true and p.account.id =:id")
	public List<Product> findByStatus(@Param("id") Integer id);

	// Tuyen
	List<Product> findAllByActiveAndStatus(boolean active, boolean status);

	@Query("SELECT p FROM Product p WHERE p.status = true")
	public List<Product> findByStatus();

	// Thu
	Page<Product> findAllByIdNotIn(List<Integer> id, Pageable pageable);

	Page<Product> findAllByAccountAndIdNot(Account account, Integer productId, Pageable pageable);

	@Query(value = "SELECT P.* FROM Products P JOIN BillDetails BD ON BD.product_id = P.id WHERE BD.bill_id= :idBill", nativeQuery = true)
	Product getProuct(@Param("idBill") Integer idBill);
	

}
