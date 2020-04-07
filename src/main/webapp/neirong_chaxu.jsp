<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ithuangyonghua.common.FormatDate,com.ithaungyonghua.dao.LanMuDao,com.ithuangyonghua.entity.LanMuEntity,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容列表</title>
</head>
<body>
	<%
		LanMuDao lmdao = new LanMuDao();
		List<LanMuEntity> list = lmdao.findAll();
	%>
	<h3 align="center">查询条件</h3>
	<form method="post" action="neirong_chaxu_cg.jsp">
		<table align="center">
			<tr>
				<td>新闻名称</td>
				<td><input type="text" name="newsname" /></td>
			</tr>
			<tr>
				<td>新闻关键字</td>
				<td><input type="text" name="keyword" /></td>
			</tr>
			<tr>
				<td>新闻所属栏目</td>
				<td><select name="titlename" id="titlename">
						<%
							for (int i = 0; i < list.size(); i++) {
								String name = list.get(i).getName();
						%>
						<option value="<%=name%>"><%=name%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="查询"
					id="button" /> <input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</body>
</html>