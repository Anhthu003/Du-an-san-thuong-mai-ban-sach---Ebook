package com.foti_java.model;

import java.util.Date;
import java.util.List;

import org.hibernate.annotations.Nationalized;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	double price;
	double discount;
	boolean discountType;
	@Nationalized
	String name;
	@Nationalized
	String introduce;
	@Nationalized
	String writerName;
	@Nationalized
	String publishingCompany;
	@Temporal(TemporalType.DATE)
	Date date;
	String image;
	boolean status;
	int quantity;
	int quantitySell;
	boolean active;
	double weight;

	@OneToMany(mappedBy = "product")
	List<ImageProduct> imageProducts;

	@ManyToOne
	@JoinColumn(name = "category_id")
	Category category;

	@ManyToOne
	@JoinColumn(name = "account_id")
	Account account;

	@OneToMany(mappedBy = "product")
	List<CartDetail> cartDetail;

	@OneToMany(mappedBy = "product")
	List<BillDetail> billDetails;

	@OneToMany(mappedBy = "product")
	List<Evalue> evalues;

	@OneToMany(mappedBy = "product")
	List<Share> shares;

	@OneToMany(mappedBy = "product")
	List<Like> likes;
}
