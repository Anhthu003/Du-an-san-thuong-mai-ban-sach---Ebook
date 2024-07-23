package com.foti_java.model;

import java.util.Date;

import org.hibernate.annotations.Nationalized;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "Address")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	boolean status;
	String phone;
	@Nationalized
	String nameAddress;
	@Nationalized
	String fullNameAddress;

	@ManyToOne
	@JoinColumn(name = "acount_id ")
	Account account;

	@ManyToOne
	@JoinColumn(name = "provinces_id")
	Province province;

	@ManyToOne
	@JoinColumn(name = "districts_id")
	District district;

	@ManyToOne
	@JoinColumn(name = "communes_id")
	Commune commune;
}
