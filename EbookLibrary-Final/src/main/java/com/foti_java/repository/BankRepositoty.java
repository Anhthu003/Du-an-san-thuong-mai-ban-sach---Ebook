package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.foti_java.model.Bank;

public interface BankRepositoty extends JpaRepository<Bank, Integer> {
	@Query("Select b From Bank b Where b.account.id = :id")
	List<Bank> findAllById(Integer id);
}
