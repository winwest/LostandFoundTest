<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newAddUser.css" charset="utf-8">
</head>
<body>

	<form action="addUser.jsp" method="post" onsubmit=" return check(this)">
		<div class="box">
		    <div class="tit">
		        <img src="./images/登录.png">
		        <p>注册</p>
		    </div>
		    <div class="content">
		        <ul>
		            <li>
		                <input type="text" name="name" placeholder="请输入用户名">
		            </li>
		            <li>
		                <input type="password" name="password" placeholder="请输入你的密码">
		            </li>
		            <li>
		                <input type="text" name="phone" placeholder="请输入你的电话号码">
		            </li>
		            <li>
		                <input type="text" name="userID" placeholder="请输入你的ID">
		            </li>
		            <li>
		                <input type="submit" value="提交">
		                <a href="newLogin.jsp">前往登陆</a>
		            </li>
		        </ul>
		    </div>
		</div>
	</form>

</body>
</html>