package com.foti_java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.foti_java.model.Chat;

public interface ChatRepository extends JpaRepository<Chat, Integer> {

}
