<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ithuangyonghua.common.FormatDate,com.ithaungyonghua.dao.LanMuDao,com.ithuangyonghua.entity.LanMuEntity,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻标题及新闻内容发布</title>
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
		String login = (String) session.getAttribute("login_user");

		LanMuDao lmdao = new LanMuDao();
		List<LanMuEntity> list = lmdao.findAll();
	%>
	<h1 align="center">新闻标题及新闻内容发布</h1>
	<table align="center">
		<form method="post" action="neirong_success.jsp">
			<tr>
				<td>新闻标题:</td>
				<td><input type="text" name="newsname" /></td>
			</tr>
			<tr>
				<td>关键字:</td>
				<td><input type="text" name="keyword" /></td>
			</tr>
			<tr>
				<td>所属栏目:</td>
				<td>
				<select name="titlename" id="titlename">
              <%
               for(int i=0;i<list.size();i++){
            	    String name = list.get(i).getName();
                 %>
                  <option value="<%= name%>"><%= name %></option>
              <% 
               }
              %>
				</select>
				</td>
			</tr>
			<tr>
				<td>发布者:</td>
				<td><input type="text" name="creator" value="<%=login %>" /></td>
			</tr>
			<tr>
				<td>发布时间:</td>
				<td><input type="text" name="writedate"  value="<%=current %>" /></td>
			</tr>
			<tr>
				<td>内容简介:</td>
				<td><textarea cols="25" rows="6" name="jianjie"></textarea>
			</tr>
			<tr>
				<td>主要内容:</td>
				<td><textarea cols="25" rows="6" name="content"></textarea></td>
			</tr>
			 <tr>
	       <td colspan="2" align="center">
	          <input type="submit" value="确定" id="button" />
	          <input type="reset" value="重置"/>
	       </td>
	    </tr>
	  
		</form>
	</table>
<h5 align="center" ><a href="index.jsp">返回</a></h5>    
</body>
</html>