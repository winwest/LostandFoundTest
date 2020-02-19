<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="UserBean.allBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newAllLost.css" charset="utf-8">
<title>信息显示</title>
</head>
<body>

	<table cellpadding="0" cellspacing="0" border="1" frame="above">
       <!--  <caption>失物信息</caption> -->
        <tr>
            <th>失物名称</th>
            <th>失物地点</th>
            <th>失物时间</th>
            <th>失物人姓名</th>
            <th>联系方式</th>
            <th>备注</th>
        </tr>

   			 <%
				List<allBean> list2= (List<allBean>) request.getAttribute("list2");
				if(list2==null||list2.size()<1){
					out.print("<tr><td>没有信息!</td></tr>"); 
				}else{
					for(allBean lostf:list2){
					%>
						<tr >
						<!-- 对失物信息的显示 -->
							<td><%=lostf.getLost_name() %></td>
							<td><%=lostf.getLost_place() %></td>
							<td><%=lostf.getLost_time() %></td>
							<td><%=lostf.getLname() %></td>
							<td><%=lostf.getLphone() %></td>
							<td><%=lostf.getLost_trait() %></td>
						</tr>
					<%
					}
				}
			%>
	</table>

</body>
</html>