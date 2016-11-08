package com.advik.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	private static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat(
			"dd-mm-yyyy HH:mm:ss");

	public static String getDate(Date date) {
		return SIMPLE_DATE_FORMAT.format(date);
	}
}
