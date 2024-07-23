package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.Account;
import com.foti_java.model.BillDetail;

public interface BillDetailRepository extends JpaRepository<BillDetail, Integer> {
	@Query("SELECT BD FROM Bill B "
			+ "JOIN B.billDetails BD "
			+ "WHERE B.id = ?1 ORDER BY B.dateBuy DESC")
	List<BillDetail> findAllByBill(Integer id);


	//Thu
//	@Query(value = "SELECT BillDetails.* FROM  Products JOIN BillDetails ON Products.id = BillDetails.product_id  JOIN Bills ON BillDetails.bill_id = Bills.id "
//			+ " WHERE Bills.id = (SELECT id  FROM Bills WHERE id = :idBill)", nativeQuery = true)
//	List<BillDetail> findBillById(@Param("idBill") Integer idBill);

	@Query(value = "SELECT BD.* FROM BillDetails BD JOIN Products P ON P.id = BD.product_id WHERE BD.bill_id = ?1 AND P.account_id=?2 ORDER BY BD.finishDay DESC",nativeQuery = true)
	List<BillDetail> findAllByBill(Integer bill_id, Integer account_id);
	//Thu
	@Query(value = "SELECT BillDetails.* FROM  Products JOIN BillDetails ON Products.id = BillDetails.product_id  JOIN Bills ON BillDetails.bill_id = Bills.id "
			+ " WHERE Bills.id = (SELECT id  FROM Bills WHERE id = :idBill)", nativeQuery = true)
	List<BillDetail> findBillById(@Param("idBill") Integer idBill);

  	@Query("SELECT BD FROM BillDetail BD "
			+ "Where BD.product.account.id = :id")
	List<BillDetail> findAllByAccountId(@Param("id") Integer id);

}
