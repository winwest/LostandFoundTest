<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="UserBean.allBean" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Modify.css" charset="utf-8">
<title>失物查询</title>
</head>
<body>

	<div class="box1">
		<form action="lostSearch" method="post">
			<input type="text" name="lost_name" placeholder="输入查询物品" class="in_1">
			<input type="submit" value="查询" class="in_2">
		</form>
	</div>
	
	<div class="box2">
		<table cellpadding="10" cellspacing="0" border="1" frame="above">
			<caption>失物查询</caption>
			<tr>
				<th>名称</th>
				<th>地点</th>
				<th>时间</th>
				<th>备注</th>
				<th>失物人</th>
				<th>联系方式</th>
			</tr>
			<%
			//getAttribute：将SearchName信息的值给SearchName
				List<allBean> SearchName=(List<allBean>)request.getAttribute("SearchName");
				if(SearchName!=null&&!SearchName.isEmpty()){
					for(allBean a : SearchName){
			%>
			<tr>
				<td><%=a.getLost_name() %></td>
				<td><%=a.getLost_place() %></td>
				<td><%=a.getLost_time() %></td>
				<td><%=a.getLost_trait() %></td>
				<td><%=a.getLname() %></td>
				<td><%=a.getLphone() %></td>
			</tr>
			<%
					}
				}else{
					out.print("<tr><td>没有信息!</td></tr>");
				}
			%>
		</table>
	</div>
	
	<div class="box">
		<a href="newMain.jsp" class="a1">返回主界面</a>
		<a href="#" class="a2">返回顶部</a>
	</div>

</body>
</html>