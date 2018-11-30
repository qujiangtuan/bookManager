package com.bie.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getTodayDateTime() {
		String stringDate;
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date;
		date = new Date();
		stringDate = form.format(date);
		return stringDate;
	}
	public static String getTodayDate() {
		String stringDate;
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		date = new Date();
		stringDate = form.format(date);
		return stringDate;
	}
}
