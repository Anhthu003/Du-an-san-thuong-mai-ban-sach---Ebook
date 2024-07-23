package com.foti_java.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
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
@Table(name = "VoucherDetails")
public class VoucherDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	boolean status;

	@ManyToOne
	@JoinColumn(name = "account_id")
	Account account;
	@OneToOne(mappedBy = "voucherDetail")
	Bill bill;
	@OneToOne(mappedBy = "voucherDetail")
	BillDetail billDetail;

	@ManyToOne
	@JoinColumn(name = "voucher_id")
	Voucher voucher;
}
