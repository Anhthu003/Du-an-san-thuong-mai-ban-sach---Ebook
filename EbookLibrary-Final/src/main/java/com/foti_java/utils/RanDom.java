package com.foti_java.utils;

import java.util.*;

public class RanDom {
	public static String generateRandomCode(int length) {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			int digit = random.nextInt(10);
			sb.append(digit);
		}
		return sb.toString();
	}
}
