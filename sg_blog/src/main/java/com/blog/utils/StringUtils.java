package com.blog.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {

    public static String createOutTradeNo() {
        return DateUtils.format(new Date(), "yyyyMMddHHmmssSSS") + RandStrUtils.randNumeric(8);
    }

    public static String iso2utf(String s) {
        if (s != null) {
            try {
                return new String(s.getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return "";
    }

    public static String encode(String str) {
        try {
            return URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static String decode(String str) {
        try {
            return URLDecoder.decode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }
    
    
    public static boolean isDigit(String str){ 
        Pattern pattern = Pattern.compile("[0-9]*"); 
        return pattern.matcher(str).matches();    
     }
    
    /**
     * 判断<code>s</code>是否为空
     * 
     * @param s
     * @return
     */
    public static boolean isEmpty(String s) {
        return (s == null || s.isEmpty());
    }

    /**
     * 去掉首位空格,判断<code>s</code>是否为空
     * 
     * @param s
     * @return
     */
    public static boolean isTrimEmpty(String s) {
        return (s == null || "".equals(s.trim()));
    }

    public static String trimEmpty(String s) {
        return s == null ? "" : s.trim();
    }

    public static int toInt(String s) {
        if (s == null || "".equals(s.trim())) {
            return 0;
        }
        return Integer.parseInt(s.trim());
    }

    public static String[] split(String dst, String regex) {
        if (dst == null || "".equals(dst))
            return new String[0];
        return dst.split(regex);
    }

    public static int[] toInts(String dst, String regex) {
        if (dst == null || "".equals(dst))
            return null;
        String[] a = dst.split(regex);
        int[] digital = new int[a.length];
        for (int i = 0; i < a.length; i++) {
            digital[i] = Integer.parseInt(a[i]);
        }
        return digital;
    }

    /**
     * 校验是否合法的用户名
     * 
     * @param username
     * @return
     */
    public static boolean validateUsername(String username) {
    	 Pattern pattern = Pattern.compile("[A-Za-z0-9_]{5,30}");
         Matcher matcher = pattern.matcher(username);
         return matcher.matches();
    }
    
    /**
     * 验证邮箱格式是否正确
     * 
     * @param email
     * @return
     * @author TanGuiyuan
     * @date 2012-11-17
     */
    public static boolean isEmail(String email) {
        String regex = "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
    
    /***
     * 验证手机号
     * @param mobile
     * @return
     */
    public static boolean isMobile(String mobile) {
    	String regex = "^1[3|4|5|6|7|8|9][0-9]{1}[0-9]{8}$";
    	 Pattern pattern = Pattern.compile(regex);
         Matcher matcher = pattern.matcher(mobile);
         return matcher.matches();
    }
    
    /**
     * 判断字符串是否合法有效(由汉字和字母组成,并且不超过长度(字节数)<code>len</code>)
     * 
     * @param str
     * @param len
     *            限制长度 字节数( 一个汉字2个字节 1个字符1个字节)
     * @return 0=字符串合法,-1=有其他字符,-2=字符串超过长度,-3=字符串太短, -4=字符串为空
     * @author LuZhiYong
     * @Date 2012-11-7
     */
    public static int isLegStr(String str, int minLen, int maxLen) {
        if (str == null)
            str = "";
        Pattern pattern1 = Pattern.compile("[a-zA-Z0-9 ]");
        // pattern2 = Pattern.compile("[\u4e00-\u9fa5]");//匹配中文字符
        Pattern pattern2 = Pattern.compile("[^\\x00-\\xff]");// 匹配双字节字符
        char[] strs = str.toCharArray();

        int count = 0;
        for (char s : strs) {
            Matcher matcher1 = pattern1.matcher(String.valueOf(s));
            Matcher matcher2 = pattern2.matcher(String.valueOf(s));
            if (matcher1.find()) {
                count++;
            } else if (matcher2.find()) {
                count = count + 2;
            } else {
                return -1;
            }
        }
        if (count > maxLen)
            return -2;
        if (count < minLen)
            return -3;
        return 0;
    }

    /**
     * @param s
     * @return
     * @author TanGuiyuan
     * @date 2012-11-15
     */
    public static byte[] getUTFBytes(String s) {
        try {
            if (s == null) {
                return null;
            }
            return s.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            return s.getBytes();
        }
    }

    /**
     * @param s
     * @return
     * @author TanGuiyuan
     * @date 2012-11-15
     */
    public static byte[] getGBKBytes(String s) {
        try {
            return s.getBytes("GBK");
        } catch (UnsupportedEncodingException e) {
            return s.getBytes();
        }
    }

    /**
     * @param s
     * @return
     * @author TanGuiyuan
     * @date 2012-11-15
     */
    public static byte[] getBytes(String s) {
        return s.getBytes();
    }

    /**
     * 
     * @param b
     * @return
     * @author TanGuiyuan
     * @date 2012-12-5
     */
    public static String toUTFString(byte[] b) {
        try {
            return new String(b, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return new String(b);
        }
    }

    /***
     * 替换字符串某个位置的字符
     * 
     * @param idx
     *            位置
     * @param str0
     *            原字符串
     * @param str1
     *            替换的字符
     * @return Demo: idx=3,str0="0123456789",str1="x" return "012x456789";
     * @author LuZhiYong
     * @Date 2013-3-19
     */
    public static String repalce(int idx, String str0, String str1) {
        return str0.substring(0, idx) + str1 + str0.substring(idx + 1);
    }

    /****
     * 统计字符串中某个字符的数量
     * 
     * @param srcStr
     * @param find
     * @return Demo srcStr="0001010", find='0' return 5;
     * @author LuZhiYong
     * @Date 2013-3-19
     */
    public static int countStr(String srcStr, char find) {
        if (srcStr == null || srcStr.isEmpty()) {
            throw new RuntimeException("srcStr is null.");
        }
        int num = 0;
        char[] chars = srcStr.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            if (find == chars[i])
                num++;
        }
        return num;
    }

    public static String binary2Hex(byte[] bArray) {
        StringBuffer sb = new StringBuffer(bArray.length);
        String sTemp;
        for (int i = 0; i < bArray.length; i++) {
            sTemp = Integer.toHexString(0xFF & bArray[i]);
            if (sTemp.length() < 2) {
                sb.append(0);
            }
            sb.append(sTemp.toUpperCase());
        }
        return sb.toString();
    }

    public static byte[] hex2Binary(String hexString) {
        if (StringUtils.isEmpty(hexString))
            throw new IllegalArgumentException("this hexString must not be empty");

        hexString = hexString.toLowerCase();
        final byte[] byteArray = new byte[hexString.length() / 2];
        int k = 0;
        for (int i = 0; i < byteArray.length; i++) {
            byte high = (byte) (Character.digit(hexString.charAt(k), 16) & 0xff);
            byte low = (byte) (Character.digit(hexString.charAt(k + 1), 16) & 0xff);
            byteArray[i] = (byte) (high << 4 | low);
            k += 2;
        }
        return byteArray;
    }

    /**
     * 将int数值转换为占四个字节的byte数组，本方法适用于(低位在前，高位在后)的顺序。 和bytesToInt（）配套使用
     * 
     * @param value
     *            要转换的int值
     * @return byte数组
     */
    public static byte[] intToBytes(int value) {
        byte[] src = new byte[4];
        src[3] = (byte) ((value >> 24) & 0xFF);
        src[2] = (byte) ((value >> 16) & 0xFF);
        src[1] = (byte) ((value >> 8) & 0xFF);
        src[0] = (byte) (value & 0xFF);
        return src;
    }

    /**
     * 将int数值转换为占四个字节的byte数组，本方法适用于(高位在前，低位在后)的顺序。 和bytesToInt2（）配套使用
     */
    public static byte[] intToBytes2(int value) {
        byte[] src = new byte[4];
        src[0] = (byte) ((value >> 24) & 0xFF);
        src[1] = (byte) ((value >> 16) & 0xFF);
        src[2] = (byte) ((value >> 8) & 0xFF);
        src[3] = (byte) (value & 0xFF);
        return src;
    }

    /**
     * byte数组中取int数值，本方法适用于(低位在前，高位在后)的顺序，和和intToBytes（）配套使用
     * 
     * @param src
     *            byte数组
     * @param offset
     *            从数组的第offset位开始
     * @return int数值
     */
    public static int bytesToInt(byte[] src, int offset) {
        int value;
        value = (int) ((src[offset] & 0xFF) 
                        | ((src[offset + 1] & 0xFF) << 8) 
                        | ((src[offset + 2] & 0xFF) << 16) 
                        | ((src[offset + 3] & 0xFF) << 24));
        return value;
    }

    /**
     * byte数组中取int数值，本方法适用于(低位在后，高位在前)的顺序。和intToBytes2（）配套使用
     */
    public static int bytesToInt2(byte[] src, int offset) {
        int value;
        value = (int) (((src[offset] & 0xFF) << 24)
                        | ((src[offset + 1] & 0xFF) << 16) 
                        | ((src[offset + 2] & 0xFF) << 8) 
                        | (src[offset + 3] & 0xFF));
        return value;
    }
    
    /** 自动生成appid */
    public static String getAutoAppid(){
    	String[] inputs = new String[]{"wx","ab","ad","bf","bc","ad"};
		Random rand = new Random();
		return inputs[rand.nextInt(inputs.length)]+Long.toHexString(System.currentTimeMillis() / 1000) + RandStrUtils.randNumeric(4);
		
    }
    
    public static String hideMobile(String mobile) {
    	return mobile.substring(0, 3)+"****"+mobile.substring(7,11);
    }
    public static void main(String[] args) {
        System.out.println(StringUtils.hideMobile("13761372019"));
    }
}
