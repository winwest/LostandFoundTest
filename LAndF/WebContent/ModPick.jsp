<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="UserBean.allBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Modify.css" charset="utf-8">
<title>修改拾物</title>
</head>
<body>
	<div class="head">
	<table cellpadding="10" cellspacing="0" border="1" frame="above">
	<caption>拾物信息表</caption>
		<tr>
			<th>物品名称</th>
			<th>拾取地点</th>
			<th>拾取时间</th>
			<th>物品备注</th>
			<th>拾物人</th>
			<th>联系方式</th>
			<th>修改备注</th>
			<th>信息删除</th>
		</tr>
	
		<%
			List<allBean> list= (List<allBean>) request.getAttribute("list");
			if(list==null||list.size()<1){
				out.print("<tr><td>还没有任何信息!</td></tr>");
			}else{
				for(allBean pickf:list){
				%>
					<tr >
						<td><%=pickf.getPick_name() %></td>
						<td><%=pickf.getPick_place() %></td>
						<td><%=pickf.getPick_time() %></td>
						<td><%=pickf.getPick_trait() %></td>
						<td><%=pickf.getPname()%></td>
						<td><%=pickf.getPphone() %></td>
						
						<td>
							<form action="updateServelet" method="post">
								<input type="hidden" name="pick_num" value="<%=pickf.getPick_num()%>">
								<input type="text" name="pick_trait" size="10" style="border: 0;border-radius: 10px;margin:3px 3px 3px;height: 25px" placeholder="修改备注" >

								<input type="submit" value="修改" style="border: 0;border-radius: 3px;background-color:tomato;color: white;margin: 2px 3px 2px;width: 35px">
							</form>
						</td>
						<td>
							<form action="deletePick" method="post">
								<input type="hidden" name="pick_num" value="<%=pickf.getPick_num()%>">
								<input type="submit" value="删除" style="border: 0;border-radius: 3px;background-color:tomato;color: white;width: 35px">
							</form>
						</td>
					</tr>
				<%
				}
			}
		%>
	</table>
	<div class="box">
		<a href="newShowPick.jsp" class="a1">添加数据</a>
		<a href="newMain.jsp" class="a2">返回主界面</a>
	</div>
	
</div>
</body>
</html>