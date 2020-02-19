<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="UserBean.allBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/selectAllP.css" charset="utf-8">
<title>信息显示</title>
</head>
<body>

<!-- 显示在主界面右侧的信息 -->

<div class="box2">
	<table>
	<caption>拾物招领信息表</caption>
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
		/*
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/landf";
				String username="root";
				String password="123456";
				Connection con = DriverManager.getConnection(url,username,password); 
				
				//显示图片
				String sql="select pick_binfile from pick where pick_file='01'";
				out.clearBuffer();
				out = pageContext.pushBody();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					response.setContentType("image/jpeg");
					Blob b = rs.getBlob("pick_binfile");
					long size = b.length();
					byte bs[] = b.getBytes(1, (int) size);
					OutputStream outs = response.getOutputStream();
					outs.write(bs);
					outs.flush();
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} */
		
		
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
								<input type="text" name="pick_trait" size="10" style="border: 1px solid gray;margin:5px 5px 5px 5px;">
								&nbsp
								<input type="submit" value="修改" style="color: black; border-radius: 5px; border: 1px solid gray; margin:5px 5px 5px 0; ">
							</form>
						</td>
						<td>
							<form action="deletePick" method="post">
								<input type="hidden" name="pick_num" value="<%=pickf.getPick_num()%>">
								<input type="submit" value="删除" style="color: black; border-radius: 5px; border: 1px solid gray; margin:5px 5px 5px 0; ">
							</form>
						</td>
					</tr>
				<%
				}
			}
		%>
	</table>
	
	<a href="showPickf.jsp" class="a1">返回</a>
	<a href="main.jsp" class="a2">返回主界面</a>
</div>
</body>
</html>