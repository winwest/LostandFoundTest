<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <jsp:useBean id="loginBean" class="UserBean.login" scope="session"></jsp:useBean>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LostAndFuond</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newMain.css" charset="utf-8">
</head>
<body>
	<div class="head">
        <div class="left">
            <p class="p0">Lost</p>
            <p class="p1">&</p>
            <p class="p2">Found</p>
        </div>
       
        <div class="nav">
            <p>失 物 管 理</p>
            
           <div class="n_nav">
            <form action="" method="get">
                <ul>
                    <li>
                        <!--链接搜索页面-->
                        <a href="#"><img src="./images/首页.png"><br>主页</a>
                    </li>
                    <li>
                        <!--添加pick全部信息链接-->
                        <a href="pickSearch.jsp"><img src="./images/失物招领%20(1).png"><br>拾物搜索</a>
                    </li>
                    <li>
                        <a>
                            <!--添加lost全部信息链接-->
                            <a href="lostSearch.jsp"><img src="./images/失物招领.png"><br>失物搜索</a>
                        </a>
                    </li>
                </ul>
                </form>
            </div>
            
        </div>

        <div class="right">
            <img src="./images/用户.png">
            <a href="newLogin.jsp" class="register">退出登录</a>
        </div>
    </div>


    <div class="center">
        <div class="to">
        <form action="" method="get">
            <ul>
                <!--发布失物链接-->
                <li><a href="newShowLost.jsp"><img src="./images/添加.png"> 登记失物</a></li>   
                <!--发布拾取物链接-->
                <li><a href="newShowPick.jsp"><img src="./images/发布.png"> 登记拾物</a></li>
                <!--修改失物链接-->
                <li><a href="lostServelet"><img src="./images/修改.png"> 修改失物</a></li>
                <!--修改拾取物链接-->
                <li><a href="findServelet"><img src="./images/发布信息.png"> 修改拾物</a></li>
            </ul>
           </form>
        </div>
        
        <div class="left">
            <p>失物信息</p><br>
            <iframe src="newLost" frameborder="0" scrolling="yes"></iframe>

            <!--更多信息，添加失物查询链接-->
            <a href="lostServelet">更多信息</a>
        </div>
        
        <div class="right">
            <p>拾物信息</p><br>
            <iframe src="newPick" frameborder="0" scrolling="yes"></iframe>

            <!--更多信息，添加拾物查询链接-->
            <a href="findServelet">更多信息</a>
        </div>
        
    </div>

    <div class="footer">
        <ul>
            <!--放主页面链接-->
            <li><a href="newMain.jsp"><img src="./images/主页1.png"><br>主页</a></li>
            <li><a href="#"><img src="./images/返回顶部.png"><br>返回顶部</a></li>
        </ul>
    </div>
</body>
</html>