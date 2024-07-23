package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.Account;

public interface AccountRepositoty extends JpaRepository<Account, Integer> {
	Account findByUsernameAndPassword(String userName, String passWord);

	Account findByEmail(String email);

	List<Account> findAllByIdIn(List<Integer> list);
	
	@Query(value = "SELECT COALESCE(COUNT(id), 0)  FROM Accounts WHERE status = 1 AND numberCitizenIdentification IS NOT NULL AND id NOT IN (SELECT account_id FROM RoleDetails WHERE role_id = 2 OR role_id = 1);", nativeQuery = true)
	Integer countSellerNotCheck();

	@Query(value = "SELECT COALESCE(COUNT(id), 0) FROM Accounts WHERE status = 1 ", nativeQuery = true)
	Integer countAccount();
	
	@Query(value = "  SELECT COALESCE(COUNT(id), 0) FROM Accounts WHERE status = 1 AND id  IN ( SELECT account_id  FROM RoleDetails WHERE role_id = 2);", nativeQuery = true)
	Integer countSeller();
	
	@Query(value = "  SELECT COALESCE(COUNT(id), 0) as cnt\r\n"
			+ "    FROM Accounts \r\n"
			+ "    WHERE status = 1 \r\n"
			+ "    AND id  IN (\r\n"
			+ "        SELECT account_id \r\n"
			+ "        FROM RoleDetails \r\n"
			+ "        WHERE role_id = 3\r\n"
			+ "    );", nativeQuery = true)
	Integer countUser();
	
	@Query(value = "  SELECT COALESCE(COUNT(id), 0) as cnt\r\n"
			+ "    FROM Accounts \r\n"
			+ "    WHERE status = 1 \r\n"
			+ "    AND id  IN (\r\n"
			+ "        SELECT account_id \r\n"
			+ "        FROM RoleDetails \r\n"
			+ "        WHERE role_id = 1\r\n"
			+ "    );", nativeQuery = true)
	Integer countAdmin();
	


	@Query(value = "SELECT COALESCE(SUM(BD.QUANTITY*BD.PRICE*0.01 - B.discount),0) FROM BILLDETAILS BD JOIN Bills B ON B.id = BD.bill_id WHERE BD.active=0 AND BD.status=1", nativeQuery = true)

	Double totalPriceAdmin();
	
	@Query(value = "SELECT \r\n"
			+ "    role,\r\n"
			+ "    COUNT(id) AS count,\r\n"
			+ "    ROUND((COUNT(id) * 100.0 / (SELECT COUNT(*) FROM Accounts)), 1) AS percentage\r\n"
			+ "FROM (\r\n"
			+ "    SELECT id, 'User' AS role\r\n"	
			+ "    FROM Accounts \r\n"
			+ "    WHERE status = 1 AND id NOT IN (SELECT account_id FROM RoleDetails WHERE role_id IN (2, 3))\r\n"
			+ "    UNION ALL\r\n"
			+ "    SELECT id, 'Seller' AS role\r\n"
			+ "    FROM Accounts \r\n"
			+ "    WHERE status = 1 AND id IN (SELECT account_id FROM RoleDetails WHERE role_id = 2)\r\n"
			+ "    UNION ALL\r\n"
			+ "    SELECT id, 'Admin' AS role\r\n"
			+ "    FROM Accounts \r\n"
			+ "    WHERE status = 1 AND id IN (SELECT account_id FROM RoleDetails WHERE role_id = 3)\r\n"
			+ ") AS role_counts\r\n"
			+ "GROUP BY role;", nativeQuery = true)
	List<Object[]> findListAccount();

	List<Account> findAllByStatus(boolean status);
	
	@Query(value = "SELECT * FROM Accounts WHERE numberCitizenIdentification IS NOT NULL AND id NOT IN (SELECT A.id FROM Accounts A JOIN RoleDetails RD ON A.id = RD.account_id JOIN Roles R ON R.id = RD.role_id WHERE R.id=2 OR R.id=1)"
			, nativeQuery = true)
	List<Account> findAllCheckSeller();
	
	@Query(value = "SELECT * FROM Accounts WHERE ID NOT IN (SELECT account_id  FROM RoleDetails WHERE role_id = 1)",nativeQuery = true)
	List<Account> findAllListAccountNotAdmin();
	
	// Thu
	@Query(value = "SELECT * FROM Accounts WHERE Accounts.username = :username", nativeQuery = true)
	Account getByUsername(String username);

	@Query(value = "SELECT Accounts.* FROM Accounts JOIN Products P ON P.account_id =Accounts.id JOIN BillDetails BD ON BD.product_id = P.id WHERE BD.bill_id= :billId", nativeQuery = true)
	Account getAccount(@Param("billId") Integer idBill);

	@Query(value = "SELECT fullname FROM Accounts WHERE id= :idAccount", nativeQuery = true)
	String getFullname(@Param("idAccount") Integer idAccount);

	
}