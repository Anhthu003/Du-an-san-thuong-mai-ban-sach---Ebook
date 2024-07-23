package com.foti_java.model;

import java.util.List;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
public class AccountProduct {
	private String avatars;
	private String shopName;
	private Long quantity;
	private List<Object[]> products;

	public AccountProduct(String avatars, String shopName, Long quantity, List<Object[]> products) {
		this.avatars = avatars;
		this.shopName = shopName;
		this.quantity = quantity;
		this.products = products;
	}
}
