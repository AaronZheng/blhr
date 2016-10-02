package com.yoyo.blhr.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.expression.ParseException;

public class GetBeforeDay {

	/**
	 * 查询当前日期前day天的日期
	 * @param day
	 * @return
	 * @throws java.text.ParseException
	 */
	@SuppressWarnings("static-access")
	public Date[] getDayBetween(Integer day) throws java.text.ParseException {
		Date startDt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s = sdf.format(startDt.getTime());
		try {
		startDt = sdf.parse(s);
		} catch (ParseException e) {
		e.printStackTrace();
		}
		 
		Calendar calendar = new GregorianCalendar();
		
		Date[] date = new Date[day];
		for(int i = 0; i < day; i++){
			calendar.setTime(new Date(startDt.getTime()));
			calendar.add(calendar.DATE, -i);
			System.out.println(calendar.getTime());
			date[i] = calendar.getTime();
		}
		return date;
		}
}
