<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="UserBean.allBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Modify.css" charset="utf-8">
<title>修改失物</title>
</head>
<body>
<div class="head">
	<table cellpadding="10" cellspacing="0" border="1" frame="above">
		<caption>失物信息表</caption>
			<tr>
				<th>失物名称</th>
				<th>失物地点</th>
				<th>失物时间</th>
				<th>物品备注</th>
				<th>失物人</th>
				<th>联系方式</th>
				
				<th>修改备注</th>
				<th>删除数据</th>
			</tr>
			<%
				List<allBean> list2= (List<allBean>) request.getAttribute("list2");
				if(list2==null||list2.size()<1){
					out.print("<tr><td>没有任何信息!</td></tr>"); 
				}else{
					for(allBean lostf:list2){
					%>
						<tr >
						<!-- 对失物信息的显示 -->
							<td><%=lostf.getLost_name() %></td>
							<td><%=lostf.getLost_place() %></td>
							<td><%=lostf.getLost_time() %></td>
							<td><%=lostf.getLost_trait() %></td>
							<td><%=lostf.getLname() %></td>
							<td><%=lostf.getLphone() %></td>
							<%-- <td><%=lostf.getLost_num() %></td> --%>
							<td>
						<!-- 实现对物品备注的修改 -->
								<form action="updateLostServelet" method="post">
									<input type="hidden" name="lost_num" value="<%=lostf.getLost_num()%>">
									<input type="text" name="lost_trait" style="border: 0;border-radius: 10px;margin:3px 3px 3px;height: 25px" placeholder="修改备注" >
									&nbsp
									<input type="submit" value="修改" style="border: 0;border-radius: 3px;background-color:tomato;color: white;margin: 2px 3px 2px;width: 35px">
								</form>
							</td>
						<!-- 对数据的删除 -->
							<td>
								<form action="deleteLost" method="post">
									<input type="hidden" name="lost_num" value="<%=lostf.getLost_num()%>">
									<input type="submit" value="删除" style="border: 0;border-radius: 3px;background-color:tomato;color: white;width: 35px">
								</form>
							</td>
						</tr>
					<%
					}
				}
			%>
		</table>
</div>
		<div class="box">
			<a href="newShowLost.jsp" class="a1">添加数据</a>
			<a href="newMain.jsp" class="a2">返回主界面</a>
		</div>

</body>
</html>