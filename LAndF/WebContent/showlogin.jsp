<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setHeader("refresh", "2;URL=newMain.jsp");//这里的3,是你要确定的时间秒URL是要跳转的地址%>
    
    <jsp:useBean id="loginBean" class="UserBean.login" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>；
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/showlogin.css" charset="utf-8">
<title>跳转……</title>
</head>
<!-- 登录成功跳转页面 -->
<body>

<%if(loginBean.isSuccess()==true){
	%>
		<div class="success">
			<img alt="" src="${pageContext.request.contextPath}/images/ok.PNG"><br>
			<span class="tic">3秒后跳转!</span><br>
			<span class="nam">用户名：<jsp:getProperty name="loginBean" property="name"/></span><br>
			<div class="go"><a href="newMain.jsp">正在前往用户界面</a></div>
		</div>
	<%
}else{
	%>
		<div class="defeat">
			<span class="note">登录失败!</span>
			<span class="backnews"><jsp:getProperty name="loginBean" property="backNews"/></span>
			<img width=100px alt="加载失败" src="${pageContext.request.contextPath}/images/fault.jpg" >
			<div class="back"><a href="newLogin.jsp">返回重新登录</a></div>
		</div>
	 <%
}
	%>


</body>
</html>