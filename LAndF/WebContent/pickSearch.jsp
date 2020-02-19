<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="UserBean.allBean" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Modify.css" charset="utf-8">
<title>拾物查询</title>
</head>
<body>

	<div class="box1">
		<form action="pickSearch" method="post">
			<input type="text" name="pick_name" placeholder="输入查询物品" class="in_1" value="">
			<input type="submit" value="查询" class="in_2">
		</form>
	</div>
	
	<div class="box2">
		<table cellpadding="10" cellspacing="0" border="1" frame="above">
			<caption>拾物查询</caption>
			<tr>
				<th>名称</th>
				<th>地点</th>
				<th>时间</th>
				<th>备注</th>
				<th>拾物人</th>
				<th>联系方式</th>
			</tr>
			<%
			//新建一个allBean类的列表，名字为SearchName
			//getAttribute：将SearchName信息的值给SearchName
				List<allBean> SearchName=(List<allBean>)request.getAttribute("SearchName");
				if(SearchName!=null&&!SearchName.isEmpty()){
					for(allBean a : SearchName){
			%>
			<tr>
				<td><%=a.getPick_name() %></td>
				<td><%=a.getPick_place() %></td>
				<td><%=a.getPick_time() %></td>
				<td><%=a.getPick_trait() %></td>
				<td><%=a.getPname() %></td>
				<td><%=a.getPphone() %></td>	
			</tr>
			<%
					}
				}else{
					out.print("<tr><td>没有任何信息!</td></tr>");
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