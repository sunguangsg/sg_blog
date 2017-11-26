package com.blog.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * @Date 2016-1-20
 */
public class Utils {

	public static final String MD5_KEY = "lobby5126md5key!@#$%^&*";

	public Utils() {
	}

	public static String encodeBase64(String data) {
		return new BASE64Encoder().encode(StringUtils.getUTFBytes(data));
	}

	public static String decodeBase64(String data) {
		try {
			String retValue = new String(new BASE64Decoder().decodeBuffer(data));
			return retValue;
		} catch (IOException e) {
			return "";
		}
	}

	public static String encodeURL(String data) {
		try {
			return URLEncoder.encode(data, "utf8");
		} catch (UnsupportedEncodingException e) {
			return data;
		}
	}

	public static String decodeURL(String data) {
		try {
			return URLDecoder.decode(data, "utf8");
		} catch (IOException e) {
			return data;
		}
	}

	/**
	 * 回写数据到客户端
	 * 
	 * @param response
	 * @param result
	 *            格式：｛"code":200,"msg":"成功","info":JSON对象或者JSON数组｝
	 */
	public static void writeDataToClient(HttpServletResponse response, JSONObject result) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=UTF-8");
		ServletOutputStream out = null;
		try {
			String data = encodeURL(result.toJSONString());
			JSONObject json = new JSONObject();
			json.put("data", data);
			json.put("sig", MD5.encodeUTF8(data + MD5_KEY));
			out = response.getOutputStream();
			byte[] bytes = StringUtils.getUTFBytes(json.toJSONString());
			out.write(bytes);
			out.flush();
		} catch (Exception e) {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	public static void writeDataToClientJSON(HttpServletResponse response, String data) {
		ServletOutputStream out = null;
		try {
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			response.addHeader("Access-Control-Allow-Origin", "*");
			out = response.getOutputStream();
			byte[] bytes = StringUtils.getUTFBytes(data);
			out.write(bytes);
			out.flush();
		} catch (Exception e) {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	public static void writeDataToClientJsonp(HttpServletResponse response, JSONObject result, String callback) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		ServletOutputStream out = null;
		try {
			String data = encodeBase64(result.toJSONString());
			JSONObject json = new JSONObject();
			json.put("data", encodeURL(data));
			json.put("sig", MD5.encodeUTF8(data + MD5_KEY));
			out = response.getOutputStream();
			out.println(callback + "(" + json.toJSONString() + ")");
			out.flush();
		} catch (Exception e) {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	/**
	 * 判断客户端的数据是否有修改过
	 * 
	 * @param request
	 * @return
	 */
	public static boolean isValidation(HttpServletRequest request) {
		String data = request.getParameter("data");
		String sig = request.getParameter("sig");
		String sig0 = MD5.encodeUTF8(data + MD5_KEY);
		return sig0.equalsIgnoreCase(sig);
	}

	public static boolean isValidation(Map<String, String> map) {
		if (map == null) {
			return false;
		}
		if (!map.containsKey("sig")) {
			return false;
		}
		String sig = map.get("sig");
		Object[] keys = map.keySet().toArray();
		Arrays.sort(keys);
		StringBuffer buf = new StringBuffer();
		for (int index = 0; index < keys.length; index++) {
			String k = (String) keys[index];
			String v = map.get(k);
			if (!"sig".equals(k)) {
				buf.append("&").append(k).append("=").append(encodeURL(v));
			}
		}
		String sigstr = "";
		if (buf.length() > 0) {
			sigstr = buf.toString().substring(1);
		}
		String md5 = MD5.encodeUTF8(sigstr + MD5_KEY);
		return md5.equalsIgnoreCase(sig);
	}

	/**
	 * 获得参数的JSON格式
	 * 
	 * @param request
	 * @return
	 */
	public static JSONObject parseParams(HttpServletRequest request) {
		String data = request.getParameter("data");
		return JSON.parseObject(decodeBase64(data));
	}

	public static void writeDataToClient(HttpServletResponse response, String data) {
		ServletOutputStream out = null;
		try {
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			out = response.getOutputStream();
			byte[] bytes = StringUtils.getUTFBytes(data);
			out.write(bytes);
			out.flush();
		} catch (Exception e) {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	public static TreeMap<String, String> getParameterMap(HttpServletRequest request) {
		Map<String, String[]> requestMap = request.getParameterMap();
		TreeMap<String, String> returnMap = new TreeMap<String, String>();
		Iterator<Map.Entry<String, String[]>> entries = requestMap.entrySet().iterator();
		Map.Entry<String, String[]> entry = null;
		while (entries.hasNext()) {
			entry = (Map.Entry<String, String[]>) entries.next();
			String name = (String) entry.getKey();
			String value = "";
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				for (int i = 0; i < values.length; i++) {
					value = values[i] + ",";
				}
				value = value.substring(0, value.length() - 1);
			} else {
				value = valueObj.toString();
			}
			returnMap.put(name, value.trim());
		}
		return returnMap;
	}

	public static TreeMap<String, Object> getParameters(HttpServletRequest request) {
		Map<String, String[]> requestMap = request.getParameterMap();
		TreeMap<String, Object> returnMap = new TreeMap<String, Object>();
		Iterator<Map.Entry<String, String[]>> entries = requestMap.entrySet().iterator();
		Map.Entry<String, String[]> entry = null;
		while (entries.hasNext()) {
			entry = (Map.Entry<String, String[]>) entries.next();
			String name = (String) entry.getKey();
			String value = "";
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				for (int i = 0; i < values.length; i++) {
					value = values[i] + ",";
				}
				value = value.substring(0, value.length() - 1);
			} else {
				value = valueObj.toString();
			}
			returnMap.put(name, value.trim());
		}
		return returnMap;
	}

	public static String parseRequest(HttpServletRequest request) {
		BufferedReader br = null;
		StringBuffer buf = new StringBuffer();
		try {
			br = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
			String line = null;
			while ((line = br.readLine()) != null) {
				buf.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (Exception e) {

				}
			}
		}
		return buf.toString();
	}

	public static Map<String, String> xml2map(String text) {
		Map<String, String> params = new TreeMap<String, String>();
		try {
			Document doc = DocumentHelper.parseText(text);
			@SuppressWarnings("unchecked")
			List<Element> els = doc.getRootElement().elements();
			for (Element el : els) {
				params.put(el.getName().toLowerCase(), el.getTextTrim());
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return params;
	}

	/***
	 * 将分转换为元
	 * 
	 * @param fee
	 * @return
	 */
	public static String formatRMBYuan(String fee) {
		DecimalFormat df = new DecimalFormat("#0.00");
		return df.format(new Double(fee).doubleValue() / 100);
	}

	/** 校验文件是不是excel */
	public static boolean isExcelFile(String fileName) {
		boolean isExcel = false;
		String[] imgExts = { ".xls" };
		for (String ext : imgExts) {
			if (fileName != null && fileName.toLowerCase().endsWith(ext)) {
				isExcel = true;
			}
		}
		return isExcel;
	}

	private static String VIEW_NAME = ".page";
	private static String REDIRECT = "redirect:/";

	/**
	 * 获取返回的视图
	 * 
	 * @param prefix
	 * @param suffix
	 * @return
	 */
	public static String doGetResultUrl(String prefix, String suffix) {
		return prefix + suffix + VIEW_NAME;
	}

	/**
	 * 获取返回的视图
	 * 
	 * @param prefix
	 * @param suffix
	 * @return
	 */
	public static String doGetResultUrl(String prefix) {
		return prefix + VIEW_NAME;
	}

	/**
	 * 获取返回的重定向视图
	 * 
	 * @param prefix
	 * @param suffix
	 * @return
	 */
	public static String doGetRedirectUrl(String prefix, String suffix) {
		return REDIRECT + prefix + suffix;
	}

	/**
	 * 获取返回的重定向视图
	 * 
	 * @param prefix
	 * @param suffix
	 * @return
	 */
	public static String doGetRedirectUrl(String prefix) {
		return REDIRECT + prefix;
	}

	/**
	 * 
	 * @param parameters
	 * @return
	 */
	public static String getQueryString(Map<String, String> parameters) {
		Object[] keys = parameters.keySet().toArray();
		Arrays.sort(keys);
		StringBuffer buf = new StringBuffer();
		for (int index = 0; index < keys.length; index++) {
			String key = (String) keys[index];
			String value = parameters.get(key);
			if (value == null) {
				value = "";
			}
			if (!"sig".equals(key)) {
				try {
					buf.append("&").append(key).append("=").append(URLEncoder.encode(value, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		String queryString = buf.toString();
		if (!queryString.isEmpty()) {
			queryString = queryString.substring(1);
		}
		return queryString;
	}

	/** 创建账户充值订单号 */
	public static String doGetRechargeAccountOrderId() {
		return "S" + DateUtils.format(new Date(), "yyyyMMddHHmmssSSS") + RandStrUtils.randNumeric(8);
	}

}
