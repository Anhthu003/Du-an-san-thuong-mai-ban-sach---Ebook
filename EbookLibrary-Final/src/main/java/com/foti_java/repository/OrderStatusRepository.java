package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foti_java.model.OrderStatus;

public interface OrderStatusRepository extends JpaRepository<OrderStatus, Integer>{
	OrderStatus findByName(String name);
	@Query(value = "EXEC dbo.sp_product_revenue_profit_discount ?1,?2,?3,?4,?5,?6", nativeQuery = true)
	List<Object[]> seller(Integer key1, Integer key2, Integer key3, Integer key4, Double key5, Integer key6 );
	
	@Query(value = "EXEC dbo.sp_product_revenue_profit_discount12 ?1,?2,?3,?4,?5,?6", nativeQuery = true)
	List<Object[]> revenueMothAll(Integer key1, Integer key2, Integer key3, Integer key4, Double key5, Integer key6 );
	
	@Query(value = "EXEC dbo.sp_product_revenue_profit_discount13 ?1,?2,?3,?4,?5,?6", nativeQuery = true)
	List<Integer> profitMothAll(Integer key1, Integer key2, Integer key3, Integer key4, Double key5, Integer key6 );
  
  	//Thu
	@Query(value = "SELECT name FROM [OrderStatuses] WHERE id = :idStatus", nativeQuery = true)
	String findStatusById(@Param("idStatus") Integer idStatus);

}
