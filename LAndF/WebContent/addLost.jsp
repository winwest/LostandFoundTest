<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("utf-8"); %>

    	<%-- <jsp:useBean id="lostbean" class="UserBean.lostBean"></jsp:useBean>
    	<jsp:setProperty property="*" name="lostbean"/> --%>
     
    
    <jsp:useBean id="allBean" class="UserBean.allBean"></jsp:useBean>
    <jsp:setProperty property="*" name="allBean"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>反馈</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addLostUF.css" charset="utf-8"> --%>
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
<!-- 向数据库添加失物信息 -->
<%
try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/landf";
			String username="root";
			String password="123456";
			Connection con = DriverManager.getConnection(url,username,password); 
			
			String sql="insert into lost (lost_name,lost_place,lname,lphone,lost_time,userID,lost_trait,lost_num) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1,allBean.getLost_name());
			ps.setString(2,allBean.getLost_place());
			ps.setString(3,allBean.getLname());
			ps.setString(4,allBean.getLphone());
			ps.setString(5, allBean.getLost_time());
			ps.setInt(6, allBean.getUserID());
			ps.setString(7, allBean.getLost_trait());
			ps.setInt(8, allBean.getLost_num());
			
			int row=ps.executeUpdate();
			if(row>0){
				out.print("<h1>"+"成功添加信息成功!"+"<h1>");
			}
			ps.close();
			con.close();
		}
		catch(Exception e){
			out.print("<h1>"+"信 息 添 加 失 败 !"+"</h1>");
			e.printStackTrace();
		}
%>

<div class="reback">
	<a href="newMain.jsp">返回首页</a>
	<a href="newShowLost.jsp">继续添加</a>
</div>

</body>
</html>