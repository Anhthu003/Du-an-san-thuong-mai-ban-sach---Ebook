package com.foti_java.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
public class Selerstatistical {
	    private String fullName;
	    private String phone;
	    private String address;
	    private String email;
	    private double totalRevenue;
	    private double discount;
	    private double profit;
	    private Boolean status;    
}
