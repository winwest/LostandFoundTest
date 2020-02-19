<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="UserBean.allBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/selectAllL.css" charset="utf-8">
<title>信息显示</title>
</head>
<body>

	<div class="box2">
		<table>
		<caption>拾物招领信息表</caption>
			<tr>
				<th>失物名称</th>
				<th>失物地点</th>
				<th>失物时间</th>
				<th>物品备注</th>
				<th>失物人</th>
				<th>联系方式</th>
				<!-- <th>编号</th> -->
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
									<input type="text" name="lost_trait" size="10" style="border: 1px solid gray;margin:5px 5px 5px 5px;">
									&nbsp
									<input type="submit" value="修改" style="color: black; border-radius: 5px; border: 1px solid gray; margin:5px 5px 5px 0; ">
								</form>
							</td>
						<!-- 对数据的删除 -->
							<td>
								<form action="deleteLost" method="post">
									<input type="hidden" name="lost_num" value="<%=lostf.getLost_num()%>">
									<input type="submit" value="删除" style="color: black; border-radius: 5px; border: 1px solid gray; margin:5px 5px 5px 0; ">
								</form>
							</td>
						</tr>
					<%
					}
				}
			%>
		</table>
		<a href="newShowPick.jsp" class="a1">继续添加</a>
		<a href="newMain.jsp" class="a2">返回主界面</a>
		
		<!-- <a href="showPickf.jsp" class="a1">返回</a>
		<a href="main.jsp" class="a2">返回主界面</a> -->
	</div>

</body>
</html>