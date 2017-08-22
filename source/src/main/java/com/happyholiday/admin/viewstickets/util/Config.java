package com.happyholiday.admin.viewstickets.util;

import java.util.Properties;

public class Config {
	private static String fileName = "config.properties";

	public static Properties getPro() {
		return Tools.loadProperties(fileName);
	}

	
}
