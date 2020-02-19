<%-- <%@page import="sun.invoke.empty.Empty"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="allBean" class="UserBean.allBean"></jsp:useBean>
    <jsp:setProperty property="*" name="allBean"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎注册</title>
<style>
	*{
        margin: 0;
        padding: 0;
    }
    body{
        background: linear-gradient(to left, rgba(255,0,0,0), rgb(255, 230, 129)); /* 标准的语法 */
    }
    h1{
        width:20%;
        height:60px;
        color: tomato;
        cursor:pointer;
        /*background-color:yellow;*/
        text-align: center;
        line-height:60px;
        margin-top: 100px;
        margin-left: 614px;
    }
    .reback{
        width: 400px;
        height: 50px;
       /*  background-color: gray; */
        margin-left:0;
    }
    .reback a{
        display: block;
        width: 150px;
        height: 30px;
        background-color: tomato;
        border-radius: 25px;
        text-align: center;
        line-height:30px;
        float: left;
        margin-left: 71px;
        margin-top: 20px;
        text-decoration: none;
        color: white;
        font-size:20px;
    }
    .reback a:hover{
        font-weight: bolder;
        background-color: #ff8d79;
        transition: all 0.5s ease 0s;
    }
</style>
</head>
<body>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/landf";
		String username="root";
		String password="123456";
		Connection con = DriverManager.getConnection(url,username,password); 
		
		String sql="insert into users (Name,Password,Phone,userID) values(?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, allBean.getName());
		ps.setString(2, allBean.getPassword());
		ps.setString(3, allBean.getPhone());
		ps.setInt(4, allBean.getUserID());
		
		int row=ps.executeUpdate();
		if(row>0){
			out.print("<h1>"+allBean.getName()+"您的ID为："+allBean.getUserID()+"已注册成功!"+"<h1>");
		}
		ps.close();
		con.close();
	}
	catch(Exception e){
		out.print("<h1>"+"信 息 注 册 失 败 !"+"</h1>");
		e.printStackTrace();
	}
%>

<div class="reback">
	<a href="newAddUser">返回注册</a>
	<a href="newLogin.jsp">返回登陆</a>
</div>

</body>
</html>