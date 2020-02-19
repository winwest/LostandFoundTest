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
            <th>拾物名称</th>
            <th>拾物地点</th>
            <th>拾物时间</th>
            <th>拾物人姓名</th>
            <th>联系方式</th>
            <th>备注</th>
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
						<td><%=pickf.getPname()%></td>
						<td><%=pickf.getPphone() %></td>
						<td><%=pickf.getPick_trait() %></td>
					</tr>
				<%
				}
			}
		%>
	</table>

</body>
</html>