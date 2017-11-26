package com.blog.utils;

import java.security.MessageDigest;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5 {

	public static final String CHARSET_UTF8 = "UTF-8";
	public static final String CHARSET_GBK = "GBK";

	/**
	 * 生成md5密文
	 *
	 * @param password
	 * @return
	 */
	public static String md5Password(String password) {
		return new Md5Hash(password).toHex();

	}

	public static boolean checkMd5Password(String source, String target) {
		String password_cipherText = new Md5Hash(source).toHex();
		return target.equals(password_cipherText);
	}

	public static String encode(String str, String charset) {
		try {
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(str.getBytes(charset));
			byte bytes[] = m.digest();
			return toHex(bytes);
		} catch (Exception e) {
		}
		return "";
	}

	public static String encodeUTF8(String str) {
		return encode(str, CHARSET_UTF8);
	}

	public static String encodeGBK(String str) {
		return encode(str, CHARSET_GBK);
	}

	public static String toHex(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < bytes.length; i++) {
			if ((bytes[i] & 0xff) < 0x10) {
				sb.append("0");
			}
			sb.append(Integer.toString(bytes[i] & 0xff, 16));
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(MD5.encodeUTF8(""));
	}
}
