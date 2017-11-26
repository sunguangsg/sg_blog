package com.blog.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

    private static final long DAY_MILLIS = 86400000;
    private static final long HOUR_MILLIS = 3600000;

    private static SimpleDateFormat dateFormat = new SimpleDateFormat();

    /**
     * @return 获取当前时间
     */
    public static Date getCurrentTime() {
        return new Date();
    }

    /**
     * 将日期格式化为指定的格式 如yyyy-MM-dd HH:mm:ss
     * 
     * @param date
     * @param pattern
     * @return
     */
    public static String format(Date date, String pattern) {
        if (date == null) {
            return null;
        }
        dateFormat.applyPattern(pattern);
        return dateFormat.format(date);
    }

    /**
     * 将日期格式化为简单日期.(yyyy-MM-dd)
     * 
     * @param date
     * @return
     */
    public static String formatSimpleDate(Date date) {
        return format(date, "yyyy-MM-dd");
    }

    /**
     * 将日期格式化为完整日期.(yyyy-MM-dd HH:mm:ss)
     * 
     * @param date
     * @return
     */
    public static String formatFullDate(Date date) {
        return format(date, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 将日期格式化为.(HH:mm)
     * 
     * @param date
     * @return
     */
    public static String formatHHmm() {
        return format(new Date(), "HH:mm");
    }

    /**
     * 将日期格式化为.(HH:mm)
     * 
     * @param date
     * @return
     */
    public static String formatHHmm(Date date) {
        return format(date, "HH:mm");
    }

    /**
     * 
     * @param date
     * @return
     */
    public static int getHourOfDay(Date date) {
        if (date == null) {
            throw new RuntimeException("The date must be not null.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.HOUR_OF_DAY);
    }

    /**
     * 获取<code>date</code>日期在处于当月的第几天
     * 
     * @param date
     * @return
     */
    public static int getDayOfMonth(Date date) {
        if (date == null) {
            throw new RuntimeException("The date must be not null.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.DAY_OF_MONTH);
    }

    /***
     * 获取Date日期处于星期的第几天(星期一算第一天)
     * 
     * @param date
     * @return
     * @author LuZhiYong
     * @Date 2012-12-5
     */
    public static int getDayOfWeek(Date date) {
        if (date == null) {
            throw new RuntimeException("The date must be not null.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        return (dayOfWeek == 1 ? 7 : dayOfWeek - 1);
    }

    /**
     * @param date
     * @return
     */
    public static int getMonth(Date date) {
        if (date == null) {
            throw new RuntimeException("The date must be not null.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.MONTH);
    }

    /**
     * 
     * @param date
     * @return
     */
    public static int getYear(Date date) {
        if (date == null) {
            throw new RuntimeException("The date must be not null.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.YEAR);
    }

    /**
     * 
     * @param source
     * @param pattern
     * @return
     */
    public static Date parseDate(String source, String pattern) {
        try {
            if (source == null || "".equals(source)) {
                return null;
            }
            dateFormat.applyPattern(pattern);
            return dateFormat.parse(source);
        } catch (ParseException e) {
            throw new RuntimeException("The source is not match pattern.");
        }
    }

    /**
     * @param source
     * @return
     */
    public static Date parseSimpleDate(String source) {
        return parseDate(source, "yyyy-MM-dd");
    }

    /**
     * @param source
     * @return
     */
    public static Date parseFullDate(String source) {
        return parseDate(source, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 判断两个日期否同一个月
     * 
     * @return
     */
    public static boolean hasSameMonth(Date date1, Date date2) {

        if (date1 == null || date2 == null) {
            throw new RuntimeException("date1 and date2 must be not null.");
        }

        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        int y1 = cal1.get(Calendar.YEAR);
        int m1 = cal1.get(Calendar.MONTH);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        int y2 = cal2.get(Calendar.YEAR);
        int m2 = cal2.get(Calendar.MONTH);

        if (y1 == y2 && m1 == m2) {
            return true;
        }
        return false;
    }

    /**
     * 判断两个日期是否同一天
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static boolean hasSameDay(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            throw new RuntimeException("date1 and date2 must be not null.");
        }

        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        int y1 = cal1.get(Calendar.YEAR);
        int m1 = cal1.get(Calendar.MONTH);
        int d1 = cal1.get(Calendar.DAY_OF_MONTH);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        int y2 = cal2.get(Calendar.YEAR);
        int m2 = cal2.get(Calendar.MONTH);
        int d2 = cal2.get(Calendar.DAY_OF_MONTH);

        if (y1 == y2 && m1 == m2 && d1 == d2) {
            return true;
        }
        return false;
    }

    /**
     * 判断两个日期是否同一分钟
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static boolean hasSameMinute(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            throw new RuntimeException("date1 and date2 must be not null.");
        }

        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        int y1 = cal1.get(Calendar.YEAR);
        int m1 = cal1.get(Calendar.MONTH);
        int d1 = cal1.get(Calendar.DAY_OF_MONTH);
        int minute1 = cal1.get(Calendar.MINUTE);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        int y2 = cal2.get(Calendar.YEAR);
        int m2 = cal2.get(Calendar.MONTH);
        int d2 = cal2.get(Calendar.DAY_OF_MONTH);
        int minute2 = cal2.get(Calendar.MINUTE);
        if (y1 == y2 && m1 == m2 && d1 == d2 && minute1 == minute2) {
            return true;
        }
        return false;
    }

    /**
     * 是否同一周 按照中国日历算 (周一为一周的开始)
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static boolean hasSameWeek(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            throw new RuntimeException("date1 and date2 must be not null.");
        }

        Calendar cal1 = Calendar.getInstance();
        cal1.setFirstDayOfWeek(Calendar.MONDAY);
        cal1.setTime(date1);
        int y1 = cal1.get(Calendar.YEAR);
        int week1 = cal1.get(Calendar.WEEK_OF_YEAR);

        Calendar cal2 = Calendar.getInstance();
        cal2.setFirstDayOfWeek(Calendar.MONDAY);
        cal2.setTime(date2);
        int y2 = cal2.get(Calendar.YEAR);
        int week2 = cal2.get(Calendar.WEEK_OF_YEAR);
        if (y1 == y2 && week1 == week2) {
            return true;
        }
        return false;
    }

    /**
     * 获取每周的第一天的日期
     * 
     * @param date
     * @return
     */
    public static String getFirstWeekDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        return formatSimpleDate(cal.getTime());
    }

    /**
     * 获取每月的第一天的日期
     * 
     * @param date
     * @return
     */
    public static String getFirstMonthDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
        return formatSimpleDate(cal.getTime());
    }

    /**
     * <code> startDate</code>与<code>endDate</code>相差的月份
     * 
     * @param startDate
     * @param endDate
     * @return
     */
    public static int betweenMonth(Date startDate, Date endDate) {
        if (startDate == null || endDate == null) {
            throw new RuntimeException("startDate and endDate must be not null.");
        }
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(startDate);
        int y1 = cal1.get(Calendar.YEAR);
        int m1 = cal1.get(Calendar.MONTH);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(endDate);
        int y2 = cal2.get(Calendar.YEAR);
        int m2 = cal2.get(Calendar.MONTH);
        return 12 * (y2 - y1) + (m2 - m1);
    }

    /**
     * startDate与endDate相差的天数
     * 
     * @param startDate
     * @param endDate
     * @return
     * @throws ParseException
     */
    public static int betweenDay(Date startDate, Date endDate) {
        if (startDate == null || endDate == null) {
            throw new RuntimeException("startDate and endDate must be not null.");
        }

        startDate = getFirstTimeOfDay(startDate);
        endDate = getFirstTimeOfDay(endDate);

        long time1 = startDate.getTime() / DAY_MILLIS;
        long time2 = endDate.getTime() / DAY_MILLIS;
        return (int) Math.abs(time1 - time2);
    }

    /**
     * <code> startDate</code>与<code>endDate</code>相差的小时
     * 
     * @param startDate
     * @param endDate
     * @return
     */
    public static long betweenHour(Date startDate, Date endDate) {

        if (startDate == null || endDate == null) {
            throw new RuntimeException("startDate and endDate must be not null.");
        }

        long startTime = startDate.getTime();
        long endTime = endDate.getTime();
        return (endTime - startTime) / HOUR_MILLIS;
    }

    /**
     * <code> startDate</code>与<code>endDate</code>相差的周数
     * 
     * @param startDate
     * @param endDate
     * @return
     */
    public static int betweenWeek(Date startDate, Date endDate) {
        if (startDate == null || endDate == null) {
            throw new RuntimeException("startDate and endDate must be not null.");
        }
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(startDate);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(endDate);
        int y2 = cal2.get(Calendar.YEAR);
        int m2 = cal2.get(Calendar.MONTH);
        int w2 = cal2.get(Calendar.DAY_OF_WEEK_IN_MONTH);
        int weeks = 0;
        // 开始日期大于结束日期时结束
        while (cal1.before(cal2)) {
            int y1 = cal1.get(Calendar.YEAR);
            int m1 = cal1.get(Calendar.MONTH);
            int w1 = cal1.get(Calendar.DAY_OF_WEEK_IN_MONTH);
            // 同年同月同周时退出循环
            if (y1 == y2 && m1 == m2 && w1 == w2) {
                break;
            } else {
                weeks += 1;
                cal1.add(Calendar.DAY_OF_YEAR, 7);
            }
        }
        return weeks;
    }

    public static Date addMonths(Date date, int m) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (m < 1) {
            throw new RuntimeException("The number of Month should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, m);
        return cal.getTime();
    }

    public static Date subMonths(Date date, int m) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (m < 1) {
            throw new RuntimeException("The number of Month should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, -m);
        return cal.getTime();
    }

    public static Date addWeeks(Date date, int w) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (w < 1) {
            throw new RuntimeException("The number of Week should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.WEEK_OF_YEAR, w);
        return cal.getTime();
    }

    public static Date subWeeks(Date date, int w) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (w < 1) {
            throw new RuntimeException("The number of Week should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.WEEK_OF_YEAR, -w);
        return cal.getTime();
    }

    public static Date addDays(Date date, int d) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (d < 1) {
            throw new RuntimeException("The number of Day should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DAY_OF_YEAR, d);
        return cal.getTime();
    }

    public static Date subDays(Date date, int d) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (d < 1) {
            throw new RuntimeException("The number of Day should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DAY_OF_YEAR, -d);
        return cal.getTime();
    }

    public static Date addMinutes(Date date, int minute) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (minute < 1) {
            throw new RuntimeException("The number of Minute should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MINUTE, minute);
        return cal.getTime();
    }

    public static Date subMinutes(Date date, int minute) {
        if (date == null) {
            throw new RuntimeException("The date must be not NULL.");
        }
        if (minute < 1) {
            throw new RuntimeException("The number of Minute should be more than zero.");
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MINUTE, -minute);
        return cal.getTime();
    }

    /**
     * 计算两个时间相差多少秒
     * 
     * @param time1
     * @param time2
     * @return 如果出现错误则返回 -1
     * @author LuZhiYong
     * @Date 2012-8-16
     */
    public static long betweenSecond(Date time1, Date time2) {
        if (time1 == null || time2 == null) {
            throw new RuntimeException("The date must be not NULL.");
        }

        long second = (time1.getTime() - time2.getTime()) / 1000;
        return Math.abs(second);
    }

    /**
     * 计算两个时间相差多少秒
     * 
     * @param time1
     * @param time2
     * @return 如果出现错误则返回 -1
     * @author LuZhiYong
     * @Date 2012-8-16
     */
    public static int betweenSecond(Date time1, long time2) {
        if (time1 == null) {
            throw new RuntimeException("The date must be not NULL.");
        }

        long second = (time1.getTime() - time2) / 1000;
        return (int) Math.abs(second);
    }

    /**
     * 获取今天的开始时间
     * 
     * @param time
     * @return
     * @author LuZhiYong
     * @Date 2012-8-16
     */
    public static Date getFirstTimeOfDay() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        return cal.getTime();
    }

    /**
     * 获取今天的结束时间
     * 
     * @param time
     * @return
     * @author LuZhiYong
     * @Date 2012-8-16
     */
    public static Date getEndTimeOfDay() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return cal.getTime();
    }

    /**
     * 获取某一天的开始时间
     * 
     * @param time
     * @return
     * @author LuZhiYong
     * @Date 2012-8-16
     */
    public static Date getFirstTimeOfDay(Date time) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        return cal.getTime();
    }

    /**
     * 获取某一天的结束时间
     * 
     * @param time
     * @return
     * @author LuZhiYong
     * @Date 2012-8-16
     */
    public static Date getEndTimeOfDay(Date time) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return cal.getTime();
    }

    /**
     * 获取某周指定的周几的时间 <BR/>
     * Demo: 上一周 周五=[week = -1, weekDay = 5 (周一=1,周日=7)]
     * 
     * @param week
     * @param weekDay
     *            1~7
     * @return
     * @author LuZhiYong
     * @Date 2012-9-10
     */
    public static Date getOneDayTimeOfWeek(int week, int weekDay) {
        if (weekDay < 1 || weekDay > 7) {
            throw new RuntimeException("The weekDay must be 1~7.");
        }
        Calendar c = Calendar.getInstance();
        c.setFirstDayOfWeek(Calendar.MONDAY);
        c.add(Calendar.WEEK_OF_YEAR, week);

        int preNowWeekDay = c.get(Calendar.DAY_OF_WEEK);
        int preSubDays = weekDay - preNowWeekDay + 1;
        c.add(Calendar.DAY_OF_WEEK, preSubDays);
        c.set(Calendar.HOUR_OF_DAY, 23);
        c.set(Calendar.MINUTE, 59);
        c.set(Calendar.SECOND, 59);
        return c.getTime();
    }

    public static int getWeek(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setMinimalDaysInFirstWeek(7);
        return cal.get(Calendar.WEEK_OF_YEAR);
    }

    /**
     * 将日期格式化为yyyy-MM
     * 
     * @param date
     * @return
     * @author TanGuiyuan
     * @date 2013-1-17
     */
    public static String formatMonth(Date date) {
        if (date == null) {
            return null;
        }
        dateFormat.applyPattern("yyyy-MM");
        return dateFormat.format(date);
    }

    /**
     * 获取当前月的第一天
     * @return yyyy-MM-dd
     */
    public static String getFirstDay(){
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, 0);//-1表示上个月；0表示当前月；1表示下个月
        cal.set(Calendar.DAY_OF_MONTH, 1);//-1：月的前一天；0：月的前一天；1：第一天
        return formatSimpleDate(cal.getTime());
    }
    
    /**
     * 获取当前月的最后一天
     * @return yyyy-MM-dd
     */
    public static String getLastDay(){
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, 1);//-1表示上个月；0表示当前月；1表示下个月
        cal.set(Calendar.DAY_OF_MONTH, 0);//-1：月的前两天；0：月的前一天；1：第一天
        return formatSimpleDate(cal.getTime());
    }
    
    /**
     * 昨天
     * @return
     */
    public static String getYesterday(){
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, -1);
        return formatSimpleDate(cal.getTime());
    }
    
    public static void main(String[] args) {
        System.out.println(getYesterday());
    }
}
