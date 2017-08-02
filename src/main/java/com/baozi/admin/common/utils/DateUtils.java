/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.baozi.admin.common.utils;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * 
 * @author ThinkGem
 * @version 2014-4-15
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

	private static String[] parsePatterns = { "yyyy-MM-dd",
			"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", "yyyy/MM/dd",
			"yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd",
			"yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM" };

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}

	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}

	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}

	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}
	
	
	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static int  getWeek(Date date) {
        Calendar cal = Calendar.getInstance();  
        cal.setTime(date); 
	   int week_index = cal.get(Calendar.DAY_OF_WEEK) - 1; 
	   if(week_index==0){
		   week_index=7;
	   }
	   return week_index;
	}

	/**
	 * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
	 * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy.MM.dd",
	 * "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null) {
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 * 
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (24 * 60 * 60 * 1000);
	}

	/**
	 * 获取过去的小时
	 * 
	 * @param date
	 * @return
	 */
	public static long pastHour(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 60 * 1000);
	}

	/**
	 * 获取过去的分钟
	 * 
	 * @param date
	 * @return
	 */
	public static long pastMinutes(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (60 * 1000);
	}

	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * 
	 * @param timeMillis
	 * @return
	 */
	public static String formatDateTime(long timeMillis) {
		int day = (int)Math.floor(timeMillis / (24 * 60 * 60 ));
		int hour = (int)Math.floor(timeMillis / (60 * 60 ) - day * 24);
		int min = (int)Math.floor(timeMillis / (60) - day * 24 * 60 - hour * 60);
		int s = (int)Math.floor(timeMillis  - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		
		return (day > 0 ? day + "天," : "") + hour + ":" + min + ":" + s;
	}

	/**
	 * 获取两个日期之间的天数
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static double getDistanceOfTwoDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		return (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
	}

	public static final String YYYYMMDD = "yyyy-MM-dd";
	public static final String YYYYMMDDHHmmss = "yyyy-MM-dd HH:mm:ss";
	public static final String HHmmss = "HH:mm:ss";

	public static final String YYYYMM = "yyyyMM";
	public static final String YMD = "yyyyMMdd";
	public static final int FIRST_DAY_OF_WEEK = Calendar.MONDAY; // 设置 周一是一周的第一天
	public static final String TIMEZONE = "GMT+8:00";

	private static final ThreadLocal<Map<String, DateFormat>> _threadLocal = new ThreadLocal<Map<String, DateFormat>>() {
		protected Map<String, DateFormat> initialValue() {
			return new HashMap<String, DateFormat>();
		}
	};

	public static DateFormat getDateFormat(String pattern) {
		DateFormat dateFormat = _threadLocal.get().get(pattern);
		if (dateFormat == null) {
			dateFormat = new SimpleDateFormat(pattern);
			dateFormat.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
			_threadLocal.get().put(pattern, dateFormat);
		}
		return dateFormat;
	}



	public static  int getHour(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 
	 * @param strDate
	 * @return
	 */
	public static Date parseDate(String strDate) {
		return parseDate(strDate, YYYYMMDD);
	}

	/**
	 * parseDate
	 * 
	 * @param strDate
	 * @param pattern
	 * @return
	 */
	public static Date parseDate(String strDate, String pattern) {
		Date date = null;
		try {
			if (pattern == null) {
				pattern = YYYYMMDD;
			}
			date = getDateFormat(pattern).parse(strDate);
		} catch (Exception e) {
		}
		return date;
	}

	/**
	 * 根据日期取得对应 周 周一日期
	 * 
	 * @param date
	 * @return
	 */
	public static Date getMondayOfWeek(Date date) {
		Calendar monday = Calendar.getInstance();
		monday.setTime(date);
		monday.setFirstDayOfWeek(FIRST_DAY_OF_WEEK);
		monday.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return monday.getTime();
	}

	/**
	 * 取得当前时间是当月中的第几天
	 * 
	 * @param date
	 * @return
	 */
	public static Integer getDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 根据日期取得对应 周 周日日期
	 * 
	 * @param date
	 * @return
	 */
	public static Date getSundayOfWeek(Date date) {
		Calendar sunday = Calendar.getInstance();
		sunday.setTime(date);
		sunday.setFirstDayOfWeek(FIRST_DAY_OF_WEEK);
		sunday.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		return sunday.getTime();
	}

	/**
	 * 取得月第一天
	 * 
	 * @param date
	 * @return
	 */
	public static Date getFirstDateOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
		return c.getTime();
	}

	/**
	 * 取得月最后一天
	 * 
	 * @param date
	 * @return
	 */
	public static Date getLastDateOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		return c.getTime();
	}

	/**
	 * 取得季度月
	 * 
	 * @param date
	 * @return
	 */
	public static Date[] getSeasonDate(Date date) {
		Date[] season = new Date[3];

		Calendar c = Calendar.getInstance();
		c.setTime(date);

		int nSeason = getSeason(date);
		if (nSeason == 1) {// 第一季度
			c.set(Calendar.MONTH, Calendar.JANUARY);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.FEBRUARY);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.MARCH);
			season[2] = c.getTime();
		} else if (nSeason == 2) {// 第二季度
			c.set(Calendar.MONTH, Calendar.APRIL);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.MAY);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.JUNE);
			season[2] = c.getTime();
		} else if (nSeason == 3) {// 第三季度
			c.set(Calendar.MONTH, Calendar.JULY);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.AUGUST);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.SEPTEMBER);
			season[2] = c.getTime();
		} else if (nSeason == 4) {// 第四季度
			c.set(Calendar.MONTH, Calendar.OCTOBER);
			season[0] = c.getTime();
			c.set(Calendar.MONTH, Calendar.NOVEMBER);
			season[1] = c.getTime();
			c.set(Calendar.MONTH, Calendar.DECEMBER);
			season[2] = c.getTime();
		}
		return season;
	}


	/**
	 * 
	 * 1 第一季度 2 第二季度 3 第三季度 4 第四季度
	 * 
	 * @param date
	 * @return
	 */
	public static int getSeason(Date date) {

		int season = 0;

		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int month = c.get(Calendar.MONTH);
		switch (month) {
		case Calendar.JANUARY:
		case Calendar.FEBRUARY:
		case Calendar.MARCH:
			season = 1;
			break;
		case Calendar.APRIL:
		case Calendar.MAY:
		case Calendar.JUNE:
			season = 2;
			break;
		case Calendar.JULY:
		case Calendar.AUGUST:
		case Calendar.SEPTEMBER:
			season = 3;
			break;
		case Calendar.OCTOBER:
		case Calendar.NOVEMBER:
		case Calendar.DECEMBER:
			season = 4;
			break;
		default:
			break;
		}
		return season;
	}


	/**
	 * 取得季度第一天
	 * 
	 * @param date
	 * @return
	 */
	public static Date getFirstDateOfSeason(Date date) {
		return getFirstDateOfMonth(getSeasonDate(date)[0]);
	}

	/**
	 * 取得季度最后一天
	 * 
	 * @param date
	 * @return
	 */
	public static Date getLastDateOfSeason(Date date) {
		return getLastDateOfMonth(getSeasonDate(date)[2]);
	}

	/**
	 * 将指定的日期转换成Unix时间戳
	 *
	 *            date 需要转换的日期 yyyy-MM-dd HH:mm:ss
	 * @return long 时间戳
	 */
	public static long dateToUnixTimestamp(String date) {
		long timestamp = 0;
		try {
			timestamp = getDateFormat(YYYYMMDDHHmmss).parse(date).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timestamp;
	}

	/**
	 * 将指定的日期转换成Unix时间戳
	 *
	 *            date 需要转换的日期 yyyy-MM-dd
	 * @return long 时间戳
	 */
	public static long dateToUnixTimestamp(String date, String dateFormat) {
		long timestamp = 0;
		try {
			timestamp = getDateFormat(dateFormat).parse(date).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timestamp;
	}

	public static int compareDates(String date1, String date2) {
		Date d1 = parseDate(date1);
		Date d2 = parseDate(date2);
		return d1.compareTo(d2);
	}

	public static Map<String, Object> getTodayStartAndEndSec(String timezone) {
		if (timezone == null) {
			timezone = TIMEZONE;
		}
		Calendar cal = Calendar.getInstance();
		DateFormat sediff = getDateFormat(YYYYMMDDHHmmss);
		cal.setTimeZone(TimeZone.getTimeZone(timezone));
		long start = 0, end = 0;
		String nowDate = cal.get(Calendar.YEAR) + "-"
				+ (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
		try {
			start = sediff.parse(nowDate + " 00:00:00").getTime();
			end = sediff.parse(nowDate + " 23:59:59").getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return map;
	}

	// 获取 day=2 start(当前-2天) end(当前)
	public static Map<String, Date> getDayStartAndEndSec(int day) {
		Calendar cal = Calendar.getInstance();
		DateFormat sediff = getDateFormat(YYYYMMDDHHmmss);
		cal.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		long start = 0, end = 0;
		String nowDate = cal.get(Calendar.YEAR) + "-"
				+ (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
		cal.add(Calendar.DAY_OF_YEAR, -day);
		String beforeDate = cal.get(Calendar.YEAR) + "-"
				+ (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
		try {
			start = sediff.parse(beforeDate + " 00:00:00").getTime();
			end = sediff.parse(nowDate + " 23:59:59").getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date startTime = new Date(start);
		Date endTime = new Date(end);
		Map<String, Date> map = new HashMap<String, Date>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		return map;
	}

	// 将日期转换为毫秒
	public static long getDateToSec(String Date) {
		DateFormat sediff = getDateFormat(YYYYMMDDHHmmss);
		long Sec = 0;
		try {
			Sec = sediff.parse(Date + " 00:00:00").getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return Sec;
	}

	// 获取当前日期的yyyyMM
	public static String getYYYYMMofNow(String timezone) {
		if (timezone == null) {
			timezone = TIMEZONE;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(TimeZone.getTimeZone(timezone));
		return String.valueOf(cal.get(Calendar.YEAR))
				+ paddingDigit(cal.get(Calendar.MONTH) + 1);
	}

	// 获取当前日期的yyyy
	public static String getYYYYofNow() {
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return String.valueOf(cal.get(Calendar.YEAR));
	}

	// 获取日期的yyyy
	public static String getYYYY(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		cal.setTime(date);
		return String.valueOf(cal.get(Calendar.YEAR));
	}

	public static String paddingDigit(int d) {
		String _v = String.valueOf(d);
		if (_v.length() < 2)
			_v = "0" + _v;
		return _v;
	}

	public static String dateToTimeZone(long timemills, String timezone,
			String pattern) {
		if (timezone == null) {
			timezone = TIMEZONE;
		}
		if (pattern == null) {
			pattern = YYYYMMDD;
		}
		DateFormat o = getDateFormat(pattern);
		o.setTimeZone(TimeZone.getTimeZone(timezone));
		Date date = new Date(timemills);
		return o.format(date);
	}

	// 获取今天已逝去的秒数
	public static int elapseSecsOfNow(String timezone) {
		if (timezone == null) {
			timezone = TIMEZONE;
		}
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(timezone));
		return c.get(Calendar.HOUR_OF_DAY) * 3600 + c.get(Calendar.MINUTE) * 60
				+ c.get(Calendar.SECOND);
	}

	// 获得今天是星期几
	public static int dayOfWeek() {
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c.get(Calendar.DAY_OF_WEEK);
	}

	// 获得时间是星期几
	public static int dayOfWeek(Date d) {
		Calendar c = Calendar.getInstance();
		if (d != null) {
			c.setTime(d);
		}
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c.get(Calendar.DAY_OF_WEEK);
	}

	public static Integer[] getYMD(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		Integer[] rs = { cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
				cal.get(Calendar.DATE) };
		return rs;
	}

	public static long getCurrentInMillis(String timezone) {
		if (timezone == null) {
			timezone = TIMEZONE;
		}
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(timezone));
		return c.getTimeInMillis();
	}

	public static Date getCurrentDate() {

		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c.getTime();
	}

	public static Calendar getCalendar(){
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c;
	}

	public static String getCurrentDateStrYYYYMMDDHHmmss() {

		Calendar c = Calendar.getInstance();

		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YYYYMMDDHHmmss);
		return df.format(c.getTime());
	}

	public static String getCurrentDateStrYYYYMMDD() {

		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YYYYMMDD);
		return df.format(c.getTime());
	}

	public static String getCurrentDateStrYMD() {

		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YMD);
		return df.format(c.getTime());
	}

	public static String getYesTodayDateStrYMD() {

		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YMD);
		c.add(Calendar.DAY_OF_YEAR, -1);
		return df.format(c.getTime());
	}

	public static String getTomorrowDateStrYMD(Date d) {
		Calendar c = Calendar.getInstance();
		if (d != null) {
			c.setTime(d);
		}
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YMD);
		c.add(Calendar.DAY_OF_YEAR, +1);
		return df.format(c.getTime());
	}

	public static String getStrYMD(Date time) {

		Calendar c = Calendar.getInstance();
		c.setTime(time);
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YMD);
		return df.format(c.getTime());
	}
	
	public static String getStrYYYYMMDD(Date time) {

		Calendar c = Calendar.getInstance();
		c.setTime(time);
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(YYYYMMDD);
		return df.format(c.getTime());
	}

	public static String getCurrentDateStrHHmmss() {

		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		DateFormat df = getDateFormat(HHmmss);
		return df.format(c.getTime());
	}

	/**
	 * 
	 * @param addSecond
	 *            添加秒数 11 09:10:00=> 09:10:11
	 * @return
	 */
	public static String getCurrentDateStrHHmmssByAddSecond(int addSecond) {

		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		c.setTimeInMillis(c.getTimeInMillis() + (long) (addSecond * 1000));
		DateFormat df = getDateFormat(HHmmss);
		return df.format(c.getTime());
	}

	public static int getSecond(String HHmmss) {
		String[] hms = HHmmss.split(":");
		int second = 0;
		// hour
		if (hms[0].substring(0, 1).equals("0")) {
			second = Integer.valueOf(hms[0].substring(1)) * 60 * 60;
		} else if (hms[0].equals("24")) {
			second = 24 * 60 * 60;
		} else {
			second = Integer.valueOf(hms[0]) * 60 * 60;
		}

		// minute
		if (hms[1].substring(0, 1).equals("0")) {
			second = second + Integer.valueOf(hms[1].substring(1))
					* 60;
		} else {
			second = second + Integer.valueOf(hms[1]) * 60;
		}

		// seconde
		if (hms[2].substring(0, 1).equals("0")) {
			second = second + Integer.valueOf(hms[2].substring(1));
		}  else {
			second = second + Integer.valueOf(hms[2]);
		}
		return second;
	}

	/**
	 * 
	 * 获取当前天在一年中是第几天
	 * 
	 * @return
	 */
	public static int getCurrentDayOfYear() {
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 
	 * 获取YYYYMMDD天在一年中是第几天
	 * 
	 * @return
	 */
	public static int getDayOfYear(String date) {
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		long time = dateToUnixTimestamp(date, YYYYMMDD);
		c.setTimeInMillis(time);
		return c.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 
	 * 获取YYYYMMDD天在一年中是第几天
	 * 
	 * @return
	 */
	public static int getDayOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		c.setTime(date);
		return c.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 
	 * 获取明天在一年中是第几天
	 * 
	 * @return
	 */
	public static int getTomorrowDayOfYear() {
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(c.getTimeInMillis() + 86400 * 1000);
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c.get(Calendar.DAY_OF_YEAR);
	}

	// 获取明天日期的yyyy
	public static String getYYYYofTomorrow() {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(cal.getTimeInMillis() + 86400 * 1000);
		cal.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return String.valueOf(cal.get(Calendar.YEAR));
	}

	// 用于报表日期格式数据
	public static List<Map<String, Object>> judgeType(Date begin, Date end, Integer type) {
		List<Map<String, Object>> maps = new ArrayList<Map<String, Object>>();
		long beginLong = begin.getTime();
		long endLong = end.getTime();
		if (type == null || type == 2) {
			if ((endLong - beginLong)/1000 > 2592000) {
				return null;
			}
			begin = DateUtils.parseDate(
					DateUtils.formatDate(begin, "yyyy-MM-dd"), "yyyy-MM-dd");
			while (begin.before(end) || begin.compareTo(end) < 1) {
				Map<String, Object> map = new HashMap<String, Object>();
				Calendar temp = Calendar.getInstance();
				temp.setTime(begin);
				temp.add(Calendar.DAY_OF_YEAR, 1);
				map.put("begin", begin);
				map.put("end", temp.getTime());
				map.put("dateStr", DateUtils.formatDate(begin, "yyyy-MM-dd"));
				maps.add(map);
				begin = temp.getTime();
			}
		} else if (type == 1) {
			if ((endLong - beginLong)/1000 > 259200) {
				return null;
			}
			begin = DateUtils.parseDate(
					DateUtils.formatDate(begin, "yyyy-MM-dd HH:00:00"),
					"yyyy-MM-dd HH:mm:ss");
			while (begin.before(end)) {
				Map<String, Object> map = new HashMap<String, Object>();
				Calendar temp = Calendar.getInstance();
				temp.setTime(begin);
				temp.add(Calendar.HOUR_OF_DAY, 1);
				map.put("begin", begin);
				map.put("end", temp.getTime());
				map.put("dateStr",
						DateUtils.formatDate(begin, "yyyy-MM-dd H:mm"));
				maps.add(map);
				begin = temp.getTime();
			}
		}
		return maps;
	}


	public static Calendar getCalendar(Date currentDate,int plusYear){

		Calendar c = Calendar.getInstance();
		c.setTime(currentDate);
		LunarUtil lu=new LunarUtil(c);
		int lyear=lu.getYear();
		c.set(Calendar.YEAR,lyear-plusYear);
		c.set(Calendar.MONTH,9);
		c.set(Calendar.DAY_OF_MONTH,1);
		c.setTimeZone(TimeZone.getTimeZone(TIMEZONE));
		return c;
	}

	public static String getAnimalsYear(int x){
		LunarUtil lu=new LunarUtil(DateUtils.getCalendar(DateUtils.getCurrentDate(),x));
		return lu.animalsYear();
	}

	public static String getAnimalsYearByDate(Date date, int x) {
		LunarUtil lu = new LunarUtil(DateUtils.getCalendar(date, x));
		return lu.animalsYear();
	}
	/**
	 * @param args
	 * @throws ParseException
	 */
	public static void main(String[] args) throws ParseException {
		// System.out.println(formatDate(parseDate("2010/3/6")));
		// System.out.println(getDate("yyyy年MM月dd日 E"));
		// long time = new Date().getTime()-parseDate("2012-11-19").getTime();
		// System.out.println(time/(24*60*60*1000));
		// System.out.println(dayOfWeek(null));
		// System.out.println(DateUtils.getDayOfYear("2015-03-20"));
		System.out.println(getWeek(parseDate("2016-06-12")));
		System.out.println(parseDate("2016-02-07"));
		System.out.println(DateUtils.formatDate(getDayStartAndEndSec(1).get(
				"startTime")));
		System.out.println(DateUtils.formatDate(getDayStartAndEndSec(1).get(
				"endTime")));
	}

}


class LunarUtil {

   final static long[] lunarInfo = new long[]
           {0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0,
                   0x09ad0, 0x055d2, 0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255,
                   0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977, 0x04970, 0x0a4b0,
                   0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2,
                   0x04970, 0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60,
                   0x186e3, 0x092e0, 0x1c8d7, 0x0c950, 0x0d4a0, 0x1d8a6, 0x0b550,
                   0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557,
                   0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5d0, 0x14573, 0x052d0,
                   0x0a9a8, 0x0e950, 0x06aa0, 0x0aea6, 0x0ab50, 0x04b60, 0x0aae4,
                   0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0, 0x096d0,
                   0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540,
                   0x0b5a0, 0x195a6, 0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a,
                   0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570, 0x04af5, 0x04970,
                   0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x055c0, 0x0ab60, 0x096d5,
                   0x092e0, 0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0,
                   0x0abb7, 0x025d0, 0x092d0, 0x0cab5, 0x0a950, 0x0b4a0, 0x0baa4,
                   0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930,
                   0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0,
                   0x0d260, 0x0ea65, 0x0d530, 0x05aa0, 0x076a3, 0x096d0, 0x04bd7,
                   0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45, 0x0b5a0,
                   0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255,
                   0x06d20, 0x0ada0};
   private int year;
   private int month;
   private int day;
   private boolean leap;

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    /**
    * 传出y年m月d日对应的农历. yearCyl3:农历年与1864的相差数 ? monCyl4:从1900年1月31日以来,闰月数
    * dayCyl5:与1900年1月31日相差的天数,再加40 ?
    *
    * @return
    */
   public LunarUtil(Calendar cal) {
       int yearCyl, monCyl, dayCyl;
       int leapMonth = 0;
       Date baseDate = null;
       try {
           baseDate = DateUtils.parseDate("1900-01-31");
       } catch (Exception e) {
           e.printStackTrace(); // To change body of catch statement use
           // Options | File Templates.
       }

       // 求出和1900年1月31日相差的天数
       int offset = (int) ((cal.getTime().getTime() - baseDate.getTime()) / 86400000L);
       dayCyl = offset + 40;
       monCyl = 14;

       // 用offset减去每农历年的天数
       // 计算当天是农历第几天
       // i最终结果是农历的年份
       // offset是当年的第几天
       int iYear, daysOfYear = 0;
       for (iYear = 1900; iYear < 2050 && offset > 0; iYear++) {
           daysOfYear = yearDays(iYear);
           offset -= daysOfYear;
           monCyl += 12;
       }
       if (offset < 0) {
           offset += daysOfYear;
           iYear--;
           monCyl -= 12;
       }
       // 农历年份
       year = iYear;

       yearCyl = iYear - 1864;
       leapMonth = leapMonth(iYear); // 闰哪个月,1-12
       leap = false;

       // 用当年的天数offset,逐个减去每月（农历）的天数，求出当天是本月的第几天
       int iMonth, daysOfMonth = 0;
       for (iMonth = 1; iMonth < 13 && offset > 0; iMonth++) {
           // 闰月
           if (leapMonth > 0 && iMonth == (leapMonth + 1) && !leap) {
               --iMonth;
               leap = true;
               daysOfMonth = leapDays(year);
           } else
               daysOfMonth = monthDays(year, iMonth);

           offset -= daysOfMonth;
           // 解除闰月
           if (leap && iMonth == (leapMonth + 1))
               leap = false;
           if (!leap)
               monCyl++;
       }
       // offset为0时，并且刚才计算的月份是闰月，要校正
       if (offset == 0 && leapMonth > 0 && iMonth == leapMonth + 1) {
           if (leap) {
               leap = false;
           } else {
               leap = true;
               --iMonth;
               --monCyl;
           }
       }
       // offset小于0时，也要校正
       if (offset < 0) {
           offset += daysOfMonth;
           --iMonth;
           --monCyl;
       }
       month = iMonth;
       day = offset + 1;
   }

   // ====== 传回农历 y年的总天数
   final private static int yearDays(int y) {
       int i, sum = 348;
       for (i = 0x8000; i > 0x8; i >>= 1) {
           if ((lunarInfo[y - 1900] & i) != 0)
               sum += 1;
       }
       return (sum + leapDays(y));
   }

   // ====== 传回农历 y年闰月的天数
   final private static int leapDays(int y) {
       if (leapMonth(y) != 0) {
           if ((lunarInfo[y - 1900] & 0x10000) != 0)
               return 30;
           else
               return 29;
       } else
           return 0;
   }

   // ====== 传回农历 y年闰哪个月 1-12 , 没闰传回 0
   final private static int leapMonth(int y) {
       return (int) (lunarInfo[y - 1900] & 0xf);
   }

   // ====== 传回农历 y年m月的总天数
   final private static int monthDays(int y, int m) {
       if ((lunarInfo[y - 1900] & (0x10000 >> m)) == 0)
           return 29;
       else
           return 30;
   }


   /** */

   // ====== 传回农历 y年的生肖
   final public String animalsYear() {
       final String[] Animals = new String[]
               {"鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪"};
       return Animals[(year - 4) % 12];
   }

   public String numeric_md() {// 返回阿拉伯数字的阴历日期
       String temp_day;
       String temp_mon;
       temp_mon = month < 10 ? "0" + month : "" + month;
       temp_day = day < 10 ? "0" + day : "" + day;

       return temp_mon + temp_day;
   }

}
