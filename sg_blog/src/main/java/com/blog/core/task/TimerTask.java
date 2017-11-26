package com.blog.core.task;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class TimerTask {

    private static ScheduledExecutorService schedule = Executors.newScheduledThreadPool(2);

    private static final int DAY_MILLISECONDS = 86400000;
    private static final int HOUR_MILLISECONDS = 3600000;
    private static final int MINUTE_MILLISECONDS = 60000;

    private static DateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
    private static DateFormat dayHHFormat = new SimpleDateFormat("yyyy-MM-dd HH");
    private static DateFormat dayHHmmFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    private static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * @param command
     * @param source HH:mm:ss
     */
    public static void addEveryDayTask(Runnable command, String source) {
        try {
            if (source == null || "".equals(source)) {
                throw new RuntimeException("请设置正确的时间格式");
            }
            long nowTime = System.currentTimeMillis();
            long taskTime = dateFormat.parse(dayFormat.format(nowTime) + " " + source).getTime();
            long initialDelay = (nowTime <= taskTime) ? (taskTime - nowTime) : (DAY_MILLISECONDS - (nowTime - taskTime));
            schedule.scheduleAtFixedRate(command, initialDelay, DAY_MILLISECONDS, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @param command
     * @param source mm:ss
     */
    public static void addEveryHourTask(Runnable command, String source) {
        try {
            if (source == null || "".equals(source)) {
                throw new RuntimeException("请设置正确的时间格式");
            }
            long nowTime = System.currentTimeMillis();
            long taskTime = dateFormat.parse(dayHHFormat.format(nowTime) + ":" + source).getTime();
            long initialDelay = (nowTime <= taskTime) ? (taskTime - nowTime) : (HOUR_MILLISECONDS - (nowTime - taskTime));
            schedule.scheduleAtFixedRate(command, initialDelay, HOUR_MILLISECONDS, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @param command
     * @param source
     *            ss
     */
    public static void addEveryMinuteTask(Runnable command, int second) {
        try {
            long nowTime = System.currentTimeMillis();
            long taskTime = dateFormat.parse(dayHHmmFormat.format(nowTime) + ":" + second).getTime();
            long initialDelay = (nowTime <= taskTime) ? (taskTime - nowTime) : (MINUTE_MILLISECONDS - (nowTime - taskTime));
            schedule.scheduleAtFixedRate(command, initialDelay, MINUTE_MILLISECONDS, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
