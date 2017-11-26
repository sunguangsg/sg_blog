package com.blog.utils;

public class ViewUrlUtils {

	private static final String REDIRECT = "redirect:/";

	/**
	 * 获取返回的重定向视图
	 * 
	 * @param prefix
	 * @param suffix
	 * @return
	 */
	public static String doGetRedirectUrl(String Prefix, String suffix) {
		return REDIRECT + Prefix + suffix;
	}

}
