package com.foti_java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Integer> {

	//Thu
	@Query(value = "SELECT name FROM PaymentMethods WHERE id = :idPaymentMethod", nativeQuery = true)
	String findMethodById(@Param("idPaymentMethod") Integer idPaymentMethod);
}
