package com.foti_java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.foti_java.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
