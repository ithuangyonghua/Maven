package com.ithuangyonghua.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatDate {
   //��ȡ��ǰʱ�䲢ת��ΪString����
   public String getDate(){
	   SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
	   String current = formater.format(new Date());
	   return current;
   }
}
