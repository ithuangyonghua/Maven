package com.ithuangyonghua.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatDate {
   //获取当前时间并转换为String类型
   public String getDate(){
	   SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
	   String current = formater.format(new Date());
	   return current;
   }
}
