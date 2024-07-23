package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.Evalue;
import com.foti_java.model.Product;

public interface EvalueRepository extends JpaRepository<Evalue, Integer> {
	List<Evalue> findAllByProductIn(List<Product> listProduct);

//Thu
	@Query(value = "  SELECT *  FROM  Evalues \r\n"
			+ " WHERE account_id = :idAccount AND  product_id = :idProduct", nativeQuery = true)
	Evalue getByBillId(@Param("idAccount") Integer idAccount, @Param("idProduct") Integer idProduct);

	@Query(value = "SELECT AVG(star)  FROM Evalues JOIN Products ON Products.id = Evalues.product_id WHERE Products.id = :idBill", nativeQuery = true)
	Integer getStar(@Param("idBill") Integer idBill);

	@Query(value = "SELECT AVG(star)  FROM Evalues JOIN Products ON Products.id = Evalues.product_id WHERE Products.id = :idBill", nativeQuery = true)
	Evalue getEvalute(@Param("idBill")  Integer id);

	@Query(value = "    SELECT DISTINCT ev.product_id\r\n"
			+ "    FROM dbo.Evalues ev\r\n"
			+ "    INNER JOIN dbo.Products p ON ev.product_id = p.id\r\n"
			+ "    WHERE ev.account_id =  :idAccount", nativeQuery = true)
	List<Integer> getEvaluatedProductIdsForCurrentUser(@Param("idAccount") Integer idAccount);
	
	  @Query(value ="SELECT * FROM Evalues e WHERE product_id = :productId AND account_id = :accountId", nativeQuery = true)
	  Evalue findByProductIdAndAccountId(@Param("productId") Integer productId, @Param("accountId") Integer accountId);



	
}
