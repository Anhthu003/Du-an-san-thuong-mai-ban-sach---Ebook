package com.foti_java.model;

import java.util.Date;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "Bills")
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	double totalPrice;
	double discount;
	int quantity;
	boolean status;
	double priceShipping;
	Date finishDay;
	Date dateBuy;
	@Nationalized
	String addRessTo;
	@OneToMany(mappedBy = "bill")
	List<BillDetail> billDetails;
	@OneToOne
	@JoinColumn(name = "voucherDetail_id",nullable = true)
	VoucherDetail voucherDetail;
	@ManyToOne
	@JoinColumn(name = "account_id")
	Account account;
	@OneToMany(mappedBy = "bill")
	List<Transaction> transactions;
	@ManyToOne
	@JoinColumn(name = "paymentmethod_id")
	PaymentMethod paymentMethod;
	@ManyToOne
	@JoinColumn(name = "orderstatus_id")
	OrderStatus orderStatus;
	
}
