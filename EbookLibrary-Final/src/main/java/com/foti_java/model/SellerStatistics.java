package com.foti_java.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SellerStatistics {
	private int id;
	private String username;
	private String fullname;
	private int countTD;
	private int countDanhGia;
	private int countDaBan;
	private float loiNhuan;
	private float doanhThu;
	private float avgDanhGia;
	private boolean status;
}
