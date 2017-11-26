package com.blog.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Map;

/**
 * 签名验证
 * 
 * @author guiyuan
 *
 */
public class SignVerify {

	public static String urlEncode(String s) {
		try {
			return URLEncoder.encode(s, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return s;
		}
	}

	public static String urlDecode(String s) {
		try {
			return URLDecoder.decode(s, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return s;
		}
	}

	/**
	 * 获取待签名字符串,按key的ascii码升序排序，将值不为空的数据进行加密
	 * 
	 * @param param
	 * @return
	 */
	public static String getSignStr(Map<String, String> params) {
		Object[] keys = params.keySet().toArray();
		Arrays.sort(keys);
		StringBuffer buf = new StringBuffer();
		for (int index = 0; index < keys.length; index++) {
			String key = (String) keys[index];
			String value = params.get(key);
			if (!"sign".equals(key) && value != null && !"".equals(value)) {
				buf.append("&").append(key).append("=").append(urlEncode(value.toString()));
			}
		}
		return buf.substring(1);
	}

	/**
	 * 获取MD5签名
	 * 
	 * @param params
	 * @param appkey
	 * @return
	 */
	public static String getSign(Map<String, String> params, String appkey) {
		return MD5.encodeUTF8(getSignStr(params) + "&appkey=" + appkey).toLowerCase();
	}

	/**
	 * 校验MD5签名是否通过
	 * @param params
	 * @param appkey
	 * @return
	 */
	public static boolean verify(Map<String, String> params, String appkey) {
		String sig = getSign(params, appkey);
		String sign = (String) params.get("sign");
		return sig.equalsIgnoreCase(sign);
	}
}
