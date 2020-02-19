<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newLogin.css" charset="utf-8">
</head>
<body>

	<div class="box">
        <div class="tit">
            <img src="./images/登录.png">
            <p>登陆</p>
        </div>
        
        <form action="loginHandel" method="post" >
	       <div class="content"> 
		       <ul>
		            <li>
		                <input type="text" name="Name" placeholder="请输入用户名">
		            </li>
		            <li>
		                <input type="password" name="Password" placeholder="请输入你的密码">
		            </li>
		            <li>
		                <input type="submit" value="登陆">
		                <a href="newAddUser.jsp">前往注册</a>
		            </li>
		        </ul>
	        </div>
        </form>
        
    </div>

</body>
</html>