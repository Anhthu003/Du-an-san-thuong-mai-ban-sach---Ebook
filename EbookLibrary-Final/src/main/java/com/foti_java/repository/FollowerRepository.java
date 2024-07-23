package com.foti_java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.foti_java.model.Account;
import com.foti_java.model.Follower;

public interface FollowerRepository extends JpaRepository<Follower, Integer> {
	@Query("SELECT o FROM Follower o WHERE o.follower_id = :followerId AND o.status = true")
	List<Follower> findAllByFollower_id(@RequestParam("followerId") int followerId);

	@Query("SELECT o FROM Follower o WHERE o.follower_id = :followerId AND o.account = :account")
	Follower findByFolloweAndAccount( int followerId,Account account);
	
}