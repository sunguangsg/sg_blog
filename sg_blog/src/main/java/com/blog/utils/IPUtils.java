package com.blog.utils;

import javax.servlet.http.HttpServletRequest;

public class IPUtils {

    /** 获取客户端真实Ip **/
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        if (ip != null && ip.indexOf(",") != -1) {
            ip = ip.split(",")[0];
        }

        return ip;
    }

    /**
     * IP转换为数字类型
     * 
     * @param ip
     * @return
     */
    public static long ip2Long(String ip) {
        String[] ips = ip.split("[.]");
        // ip0*256*256*256+ip1*256*256+ip2*256+ip3
        return (Long.parseLong(ips[0]) << 24) + (Long.parseLong(ips[1]) << 16) + (Long.parseLong(ips[2]) << 8) + (Long.parseLong(ips[3]));
    }

    /**
     * 数字类型转换为IP
     * 
     * @param ip
     * @return
     */
    public static String long2ip(long ip) {
        StringBuffer buf = new StringBuffer();
        buf.append((ip & 0xFF000000) >> 24).append(".").append((ip & 0x00FF0000) >> 16).append(".").append((ip & 0x0000FF00) >> 8).append(".").append(ip & 0x000000FF);
        return buf.toString();
    }

    /**
     * 是否本地IP
     * 
     * @param ip
     * @return
     */
    public static boolean isLocal(String ip) {
        if ("127.0.0.1".equals(ip))
            return true;
        long l = ip2Long(ip);
        if (l >= 3232235520L)
            return l <= 3232301055L;
        return (l >= 167772160L) && (l <= 184549375L);
    }
    
    public static void main(String[] args) {
    	System.out.println(ip2Long("223.104.5.227"));
    }

}
