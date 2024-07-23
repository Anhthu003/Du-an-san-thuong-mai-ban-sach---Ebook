package com.foti_java.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.model.Bill;
import com.foti_java.model.BillDetail;
import com.foti_java.model.Product;

public interface BillRepositoty extends JpaRepository<Bill, Integer> {
	Bill findFirstByAccountAndBillDetails(Account account, List<BillDetail> bill);

//EXEC dbo.sp_product_revenue_profit_discount 2023,4,2024,6,0.1,1;
//	@Query(value = "EXEC dbo.sp_product_revenue_profit_discount ?1,?2,?3,?4,?5,?6", nativeQuery = true)
//	List<Object[]> seller(Integer key1, Integer key2, Integer key3, Integer key4, Double key5, Integer key6 );
	// kien
	@Query(value = "EXEC GetCustomerStatistics1", nativeQuery = true)
	List<Object[]> Selerstatistical();

//Phuc
	@Query(value = "EXEC CalculateMonthlyBills ?1", nativeQuery = true)
	List<Object[]> calculateMonthlyBills(Integer id);

	@Query(value = "EXEC CalculateMonthlyBillsFalse ?1", nativeQuery = true)
	List<Object[]> calculateMonthlyBillsFalse(Integer id);

	@Query(value = "EXEC GetFollowerCountByShopId ?1", nativeQuery = true)
	Integer getFollwer(Integer id);

	@Query(value = "EXEC GetLikeCountByShopId ?1", nativeQuery = true)
	Integer getLike(Integer id);

	@Query(value = "EXEC GetEvlaueCountByShopId ?1", nativeQuery = true)
	Integer getEvalue(Integer id);

	@Query(value = "EXEC GetBillSuccessCountByShopId ?1", nativeQuery = true)
	Integer getBillSucess(Integer id);

	@Query(value = "EXEC GetTopBuyersByShopId ?1", nativeQuery = true)
	List<Object> getTopBuyers(Integer id);

	@Query(value = "EXEC GetEvalueNewByShopId ?1", nativeQuery = true)
	List<Object> getEvalueNew(Integer id);

	@Query(value = "EXEC GetTopProductByShopId ?1", nativeQuery = true)
	List<Object> getTopProduct(Integer id);

	@Query(value = "EXEC doanhThu ?1", nativeQuery = true)
	List<Object[]> getDoanhThu(Integer id);

	@Query(value = "EXEC loiNhuan ?1", nativeQuery = true)
	List<Object[]> getLoiNhuan(Integer id);

	@Query(value = "EXEC GetAvgEvalue ?1", nativeQuery = true)
	Double getAVGStar(Integer id);

	@Query(value = "EXEC tongDoanhThu ?1", nativeQuery = true)
	Integer getTongDoanhThu(Integer id);

	@Query(value = "EXEC tongLoiNhuan ?1", nativeQuery = true)
	Integer getTongLoiNhuan(Integer id);
	//Update repostiroy trang chu seller - phuckem
    @Query("Select count(bd) FROM BillDetail bd Where bd.status = false And bd.finishDay is null And bd.product.account.id = :id")
    Integer billChuaDuyet(@Param("id") Integer id);
    @Query("Select b FROM Bill b INNER JOIN b.billDetails bd Where bd.product.account.id = :id")
    List<Bill> findByIdAccount(@Param("id") Integer id);

	// Tuyen
	@Query("SELECT B FROM Bill B " + "JOIN B.billDetails BD " + "JOIN BD.product P "
			+ "WHERE P.account.id = ?1 ORDER BY B.finishDay DESC")
	List<Bill> findAllBySeller(Integer id);

	@Query(value = "exec PROC_TK_NAM_Seller ?1", nativeQuery = true)
	List<Object[]> PROC_TK_NAM_Seller(Integer id);

	@Query(value = "exec TK_SELLER_IN_ACCOUNT", nativeQuery = true)
	List<Object[]> TK_SELLER_IN_ACCOUNT();

	@Query(value = "SELECT B.* FROM Bills B JOIN BillDetails BD ON B.id = BD.bill_id JOIN Products P ON P.id = BD.product_id\r\n"
			+ "WHERE P.account_id = ?1 AND B.status=1 AND B.finishDay IS NOT NULL AND B.finishDay BETWEEN ?2 AND ?3\r\n"
			+ "ORDER BY B.finishDay DESC", nativeQuery = true)
	List<Bill> findAllBySellerBeweenAnd(int id, String startDate, String endDate);

//Thu

	@Query(value = "SELECT Bills.*,  Products.price*Products.quantity AS Total FROM Bills JOIN Accounts ON Accounts.id = Bills.account_id "
			+ "JOIN BillDetails ON BillDetails.bill_id = Bills.id "
			+ "JOIN Products ON Products.id = BillDetails.product_id "
			+ "WHERE Bills.account_id IN (SELECT Accounts.id FROM Accounts WHERE Accounts.username LIKE %:username%)", nativeQuery = true)
	List<Bill> getBillsByUsername(@Param("username") String username);

	@Query(value = " SELECT Bills.totalPrice FROM Bills JOIN Accounts ON Accounts.id = Bills.account_id "
			+ "			JOIN BillDetails ON BillDetails.bill_id = Bills.id \r\n"
			+ "			JOIN Products ON Products.id = BillDetails.product_id WHERE Accounts.username= :username AND Bills.id = :id", nativeQuery = true)
	Double getTotal(@Param("username") String username, @Param("id") Integer id);

	@Query(value = " SELECT Bills.* FROM Bills JOIN OrderStatuses ON Bills.orderstatus_id = OrderStatuses.id\r\n"
			+ "JOIN Accounts ON Accounts.id = Bills.account_id "
			+ "	WHERE Bills.orderstatus_id  IN (SELECT id FROM OrderStatuses WHERE OrderStatuses.name LIKE %:delivery%) AND Accounts.id LIKE :id AND Bills.status = :status", nativeQuery = true)
	List<Bill> getBillsByDelivery(@Param("delivery") String delivery, @Param("id") Integer id,
			@Param("status") boolean status);

//	@Query(value = "SELECT Bills.* FROM Bills JOIN BillDetails ON BillDetails.bill_id = Bills.id WHERE BillDetails.bill_id = :id", nativeQuery = true)
//	List<Bill> findBillById(@Param("id") Integer id);
//	@Query(value = "SELECT Bills.* FROM Bills JOIN BillDetails ON BillDetails.bill_id = Bills.id WHERE BillDetails.bill_id = :id", nativeQuery = true)
//	Bill findBillById(@Param("id") Integer id);

	@Query(value = "SELECT Bills.* FROM Bills JOIN Accounts ON Accounts.id = Bills.account_id WHERE Accounts.id = :id", nativeQuery = true)
	List<Bill> getAll(@Param("id") Integer id);

	
	@Query(value = "SELECT DISTINCT Bills.* FROM Bills JOIN Accounts ON Accounts.id = Bills.account_id WHERE Accounts.username = :username", nativeQuery = true)
	List<Bill> getAllDISTINC(@Param("username") String username);

	@Query(value ="SELECT DISTINCT   A.shopName FROM Accounts A JOIN Products P ON P.account_id = A.id JOIN BillDetails BD ON BD.product_id = P.id WHERE BD.bill_id= :billId", nativeQuery = true)
	String getShopNameByBillId(@Param("billId") Integer billId);

	@Query(value = "SELECT a.shopName,b.id AS billId, p.name, p.price, bd.quantity,( bd.quantity * p.price) as total\r\n"
			+ "FROM Accounts a JOIN Bills b ON a.id = b.account_id JOIN BillDetails bd ON b.id = bd.bill_id JOIN Products p ON bd.product_id = p.id \r\n"
			+ "JOIN OrderStatuses os ON b.orderStatuses_id = os.id \r\n" + "WHERE a.username = :username  \r\n"
			+ " AND os.name = :orderStatus", nativeQuery = true)
	List<Object[]> getBillDetailsAccountAndStatus(@Param("username") String username,
			@Param("orderStatus") String orderStatus);

	@Query(value = "SELECT Accounts.shopName FROM Accounts JOIN Bills ON Accounts.id = Bills.account_id WHERE Accounts.username = :username AND Bills.id = :billId", nativeQuery = true)
	String findShop(@Param("username") String username, @Param("billId") Integer billId);

	@Query(value = "SELECT (P.price * B.quantity) AS total FROM Accounts A JOIN Bills B ON A.id = B.account_id JOIN Products P ON B.product_id = P.id WHERE Accounts.username = :username AND Bills.id = :billId", nativeQuery = true)
	String total(@Param("username") String username, @Param("billId") Integer billId);

	Optional<Bill> findById(Integer id);

	@Query(value = "SELECT * FROM Bills WHERE id = (SELECT distinct  bill_id FROM BillDetails  WHERE bill_id = :billId)", nativeQuery = true)
	Bill findBillByIdForDetail(@Param("billId") Integer billId);

	@Query(value = "	SELECT Products.\r\n" + "	name FROM\r\n" + "	Bills \r\n" + "	  JOIN\r\n"
			+ "	Accounts ON Accounts.id=\r\n" + "	Bills.account_id \r\n" + "	  JOIN\r\n"
			+ "	Products ON Accounts.id=\r\n" + "	Bills.account_id\r\n"
			+ "	  WHERE Products.name= :namePro", nativeQuery = true)
	String findProductByBill(@RequestParam("namePro") String namePro);

	@Query(value = "SELECT totalPrice+priceShipping-discount  FROM Bills join BillDetails on BillDetails.bill_id = Bills.id WHERE BillDetails.bill_id = :idBill", nativeQuery = true)
	double setTotalPrice(@Param("idBill") Integer idBill);

	
//	@Query(value = "SELECT paymentMethod_id FROM Bills WHERE id = (SELECT distinct  bill_id FROM BillDetails  WHERE bill_id = :idBill)", nativeQuery = true)
//	Integer findPaymentMethodId(@Param("idBill") Integer idBill);
	
//	@Query(value = "SELECT orderStatuses_id FROM Bills WHERE id = (SELECT distinct  bill_id FROM BillDetails  WHERE bill_id = :idBill)", nativeQuery = true)
//	Integer findOrderStatusId(@Param("idBill") Integer idBill);
	
	@Query(value = "SELECT * FROM Bills WHERE finishDay BETWEEN ?1 AND ?2",nativeQuery = true)
	List<Bill> findAllByFinishDayBetween(String dateStart, String dateEnd);

	@Query(value = "EXEC PROC_TK_Seller ?1", nativeQuery = true)
	List<Object[]> FindAllBillByAccount(int account);

	@Query(value = "EXEC PROC_TK_Seller_BetweenEnd ?1,?2,?3", nativeQuery = true)
	List<Object[]> FindAllBillByAccount(int account,String dateStart, String dateEnd);

	@Query(value = "SELECT paymentMethod_id FROM Bills WHERE id = (SELECT distinct  bill_id FROM BillDetails  WHERE bill_id = :idBill)", nativeQuery = true)
	Integer findPaymentMethodId(@Param("idBill") Integer idBill);
	
	@Query(value = "SELECT orderstatus_id"
			+ " FROM Bills WHERE id = (SELECT distinct  bill_id FROM BillDetails  WHERE bill_id = :idBill)", nativeQuery = true)
	Integer findOrderStatusId(@Param("idBill") Integer idBill);

	@Query(value = "SELECT a.shopName\r\n"
			+ "FROM Products p\r\n"
			+ "JOIN Accounts a ON p.account_id = a.id\r\n"
			+ "WHERE p.id = :productId", nativeQuery = true)
	String getShopNameByProduct(@Param("productId") Integer productId );

}
