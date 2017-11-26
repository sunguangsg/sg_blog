package com.blog.utils;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpUtils {

	public static final int SOCKET_TIMEOUT = 6000;
	public static final int CONNECT_TIMEOUT = 6000;
	public static final String CHARSET = "UTF-8";

	public static String get(String url) throws Exception {
		// 设置请求和传输超时时间
		RequestConfig config = RequestConfig.custom().setSocketTimeout(SOCKET_TIMEOUT).setConnectTimeout(CONNECT_TIMEOUT).build();
		HttpGet request = new HttpGet(url);
		request.setConfig(config);
		CloseableHttpClient client = HttpClientBuilder.create().build();
		CloseableHttpResponse response = client.execute(request);

		// 判断网络连接状态码是否正常(0--200都数正常)
		if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
			return EntityUtils.toString(response.getEntity(), CHARSET);
		}
		return null;
	}

	public static String post(String url, Map<String, String> headers, String content) throws Exception {
		// 设置请求和传输超时时间
		RequestConfig config = RequestConfig.custom().setSocketTimeout(SOCKET_TIMEOUT).setConnectTimeout(CONNECT_TIMEOUT).build();
		HttpPost request = new HttpPost(url);
		request.setConfig(config);
		if (content != null) {
			request.setEntity(new StringEntity(content, CHARSET));
		}

		if (headers != null) {// 设置Header
			for (Iterator<String> it = headers.keySet().iterator(); it.hasNext();) {
				String key = it.next();
				String value = headers.get(key);
				if (value != null && !"".equals(value)) {
					request.addHeader(key, value);
				}
			}
		}
		CloseableHttpClient client = HttpClientBuilder.create().build();
		CloseableHttpResponse response = client.execute(request);
		// 判断网络连接状态码是否正常(0--200都数正常)
		if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
			return EntityUtils.toString(response.getEntity(), CHARSET);
		}
		return null;
	}

	public static String post(String url, Map<String, String> headers, Map<String, String> params) throws Exception {
		// 设置请求和传输超时时间
		RequestConfig config = RequestConfig.custom().setSocketTimeout(SOCKET_TIMEOUT).setConnectTimeout(CONNECT_TIMEOUT).build();
		HttpPost request = new HttpPost(url);
		request.setConfig(config);
		if (headers != null) {// 设置Header
			for (Iterator<String> it = headers.keySet().iterator(); it.hasNext();) {
				String key = it.next();
				String value = headers.get(key);
				if (value != null && !"".equals(value)) {
					request.addHeader(key, value);
				}
			}
		}
		request.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		if (params != null) {
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			for (Iterator<String> it = params.keySet().iterator(); it.hasNext();) {
				String key = it.next();
				Object value = params.get(key);
				if (value != null && !"".equals(value)) {
					nvps.add(new BasicNameValuePair(key, URLEncoder.encode(value.toString(), CHARSET)));
				}
			}
			request.setEntity(new UrlEncodedFormEntity(nvps,CHARSET));
		}
		CloseableHttpClient client = HttpClientBuilder.create().build();
		CloseableHttpResponse response = client.execute(request);

		// 判断网络连接状态码是否正常(0--200都数正常)
		if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
			return EntityUtils.toString(response.getEntity(), CHARSET);
		}
		return null;
	}

}
