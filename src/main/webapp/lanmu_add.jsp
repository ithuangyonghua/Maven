<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ithuangyonghua.common.FormatDate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>栏目添加</title>
<style type="text/css">
  td{
   border:1px solid #000;
   padding:5px;
   
  }
</style>
</head>
<body>
<%
	String result = (String) session.getAttribute("login_user");
	if (result == null) {
		response.sendRedirect("denglu.jsp");
	}
%>
<%
FormatDate fd = new FormatDate();
String current = fd.getDate();
String login = (String)session.getAttribute("login_user");
%>
 <h1 align="center">新闻一级栏目发布</h1>

	 <table align="center" border="1">
	  <form action="lanmu_success.jsp" method="post" id="test_form">
	    <tr>
	       <td>栏目名称</td><td><input type="text" name="name" id="lmname"/></td>
	    </tr>
	    <tr>
	       <td>发布者</td><td><input type="text"  name="creator"  value="<%=login %> " /></td>
	    </tr>
	    <tr>
	       <td>发布时间</td><td><input type="text" name="creatorDate" value="<%=current %>" /> </td>
	    </tr>
	    <tr>
	       <td colspan="2" align="center">
	          <input type="button" value="确定" id="button" onclick="copyText()"/>
	          <input type="reset" value="重置"/>
	       </td>
	    </tr>
	     </form>
	     <tr >
	      <td colspan="2"><h5 align="center" ><a href="index.jsp">返回</a></h5></td>
	     </tr>
	 </table>

</body>
</html>
<script>
   var submit_btn = document.getElementById("button");
   var submit_form = document.getElementById("test_form");
   var submit_lmname = document.getElementById("lmname");
   function copyText(){
	   console.log("内容"+submit_lmname.value);
	    if(submit_lmname.value==""){
		  alert("请输入栏目名称");
	   } else{
		   submit_form.submit();
	   }
   }
</script>