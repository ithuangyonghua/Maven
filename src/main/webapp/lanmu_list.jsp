<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ithaungyonghua.dao.LanMuDao"%>
<%@ page import="com.ithuangyonghua.entity.LanMuEntity"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
		<tbody>
			<tr>
				<td>栏目ID</td>
				<td>栏目名</td>
				<td>发布者</td>
				<td>发布时间</td>
			</tr>
			<%
				LanMuDao lmdao = new LanMuDao();
			  
			    List<LanMuEntity> list=  lmdao.findAll();
			    for(int i=0;i<list.size();i++){
			%>
			<tr>
				 <td><%= list.get(i).getId()%></td>
				<td><%= list.get(i).getName() %></td>
				<td><%= list.get(i).getCreator()%></td>
				<td><%=list.get(i).getCreatorDate()%></td> 
			</tr>
			<% 
			   }
			%>
		</tbody>
	</table>
</body>
</html>