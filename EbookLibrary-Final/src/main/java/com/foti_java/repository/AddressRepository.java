package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.Account;
import com.foti_java.model.Address;

public interface AddressRepository extends JpaRepository<Address, Integer> {
	List<Address> findAllByAccount(Account account);

	@Query(value = "SELECT Address.* FROM Address JOIN Accounts ON Address.acount_id =Accounts.id  JOIN Products P ON P.account_id =Accounts.id JOIN BillDetails BD ON BD.product_id = P.id WHERE BD.bill_id= :billId", nativeQuery = true)
	Address getAddress(@Param("billId") Integer billId);

	@Query("SELECT d FROM Address d WHERE d.account.id = :acount_id")
	List<Address> getAddressByAccountId(@Param("acount_id") Integer acount_id);

	//Thu
	@Query(value = "SELECT * FROM Address WHERE acount_id = (SELECT id  FROM Accounts WHERE  id LIKE :idAccount ) AND status = 1", nativeQuery = true)
	Address findAddressByAccount(@Param("idAccount") Integer idAccount);

	@Query(value = "SELECT name  FROM Province WHERE id = (SELECT provinces_id FROM Address WHERE acount_id = (SELECT id  FROM Accounts WHERE  id =  :idAccount  ) AND status = 1)", nativeQuery = true)
	String findProvinceByAccount(@Param("idAccount") Integer idAccount);

	@Query(value = "SELECT name  FROM Districts WHERE id = (SELECT districts_id FROM Address WHERE acount_id = (SELECT id  FROM Accounts WHERE  id =  :idAccount  ) AND status = 1)", nativeQuery = true)
	String findDistrictsByAccount(@Param("idAccount") Integer idAccount);

	@Query(value = "SELECT name  FROM Communes WHERE id = (SELECT communes_id FROM Address WHERE acount_id = (SELECT id  FROM Accounts WHERE  id = :idAccount  ) AND status = 1)", nativeQuery = true)
	String findCommunesByAccount(@Param("idAccount") Integer idAccount);

	@Query(value = "SELECT fullNameAddress FROM Address WHERE acount_id = (SELECT id  FROM Accounts WHERE  id LIKE  :idAccount AND status = 1)", nativeQuery = true)
	String findFullAddressByAccount(@Param("idAccount") Integer idAccount);

}
