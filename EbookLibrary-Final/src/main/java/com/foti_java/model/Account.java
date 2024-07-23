package com.foti_java.model;

import java.util.Date;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "Accounts")
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String username;
	String password;
	String avatar;
	@Nationalized
	String fullname;
	boolean gender;
	String email;
	@Temporal(TemporalType.DATE)
	Date birthday;
	String phone;
	String background;
	@Nationalized
	String shopName;
	boolean status;
	String numberCitizenIdentification;
	String beforeCitizenIdentification;
	String afterCitizenIdentification;

	@OneToMany(mappedBy = "account")
	List<VoucherDetail> voucherDetails;

	@OneToMany(mappedBy = "account")
	List<RoleDetail> roledetails;

	@OneToMany(mappedBy = "account")
	List<Address> addresses;

	@OneToMany(mappedBy = "account")
	List<Chat> chats;

	@OneToMany(mappedBy = "account")
	List<Follower> followers;

	@OneToMany(mappedBy = "account")
	List<Transaction> transections;

	@OneToMany(mappedBy = "account")
	List<Bill> bills;

	@OneToMany(mappedBy = "account")
	List<Bank> banks;

	@OneToMany(mappedBy = "account")
	List<CartDetail> cartDetails;

	@OneToMany(mappedBy = "account")
	List<Evalue> evalues;

	@OneToMany(mappedBy = "account")
	List<Like> likes;
	@OneToMany(mappedBy = "account")
	List<Product> products;
}
