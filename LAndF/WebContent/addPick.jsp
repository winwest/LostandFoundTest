<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<%@ page import="java.io.*"%>
<%@ page import="java.nio.*"%>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%-- <jsp:useBean id="pickbean" class="UserBean.pickBean"></jsp:useBean>
    <jsp:setProperty property="*" name="pickbean"/> --%>
    
    <jsp:useBean id="allBean" class="UserBean.allBean"></jsp:useBean>
    <jsp:setProperty property="*" name="allBean"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失物招领系统</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addPickUF.css" charset="utf-8"> --%>
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
<!-- 向数据库添加拾物信息 -->
<%
	try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/landf";
			String username="root";
			String password="123456";
			Connection con = DriverManager.getConnection(url,username,password); 
			
			String sql="insert into pick (pick_name,pick_place,pname,pphone,pick_time,userID,pick_trait,pick_num) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			/*  //图片上传
			request.setCharacterEncoding("utf-8");
			String content = request.getParameter("pick_file");
			String filename = request.getParameter("pick_img");
			System.out.println(filename);
			InputStream str = new FileInputStream(filename);
			String sql1 = "select * from pick_binfile";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql1);
			rs.last();
			int id = rs.getInt("id") + 1;
			String sql2 = "insert into images(id,content,image) values(" + id + ",?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			long l = (long) str.available();
			pstmt.setBinaryStream(2, str, l);
			try {
				pstmt.executeUpdate();
			} catch (Exception e) {
				out.print(e.getMessage());
			}
			out.println("Success,You Have Insert an Image Successfully");  */
			
			
			//图片上传
			/* String pick_file=request.getParameter("pick_img");
			File file=new File(pick_file);//获取表单传过来的图片的url
			 try {
					//打开文件
					FileInputStream fin = new FileInputStream(file);
					//建一个缓冲保存数据
					ByteBuffer nbf = ByteBuffer.allocate((int) file.length());
					byte[] array = new byte[1024];
					int offset = 0, length = 0;
					//读存数据
					while ((length = fin.read(array)) > 0) {
						if (length != 1024)
							nbf.put(array, 0, length);
						else
							nbf.put(array);
						offset += length;
					}
				  //新建一个数组保存要写的内容
					byte[] content = nbf.array();
					//保存数据
					Statement stmt =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
					String sqlstr = "select * from pick where pick_file='01'";
					ResultSet rs = stmt.executeQuery(sqlstr);
					if (rs.next()) 
					{
						rs.updateBytes(2, content);
						rs.updateRow();
					} else {
						rs.moveToInsertRow();
						rs.updateString(1, "01");
						rs.updateBytes(2, content);
						rs.insertRow();
					}
					rs.close(); 
					//关闭文件
					fin.close();
					out.println("恭喜，已经将新的记录成功地添加到数据库中！");
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} */
			
			
			ps.setString(1, allBean.getPick_name());
			ps.setString(2, allBean.getPick_place());
			ps.setString(3, allBean.getPname());
			ps.setString(4, allBean.getPphone());
			ps.setString(5, allBean.getPick_time());
			ps.setInt(6, allBean.getUserID());
			ps.setString(7, allBean.getPick_trait());
			ps.setInt(8, allBean.getPick_num());
			
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
	<a href="newShowPick.jsp">继续添加</a>
</div>


</body>
</html>