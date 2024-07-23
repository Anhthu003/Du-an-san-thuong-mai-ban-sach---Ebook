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
@Table(name = "BillDetails")
public class BillDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	int quantity;
	double price;
	double discount;
	double priceShipping;
	@Temporal(TemporalType.TIMESTAMP)
	Date dateBuy = new Date();
	@Nationalized
	String addressFrom;
	Date finishDay;
	boolean status;
	boolean active;
	@ManyToOne
	@JoinColumn(name = "product_id")
	Product product;
	@ManyToOne
	@JoinColumn(name = "bill_id")
	Bill bill;
	@OneToOne
	@JoinColumn(name = "voucherDetail_id")
	VoucherDetail voucherDetail;
	@ManyToOne
	@JoinColumn(name = "orderstatus_id")
	OrderStatus orderStatus;

}
