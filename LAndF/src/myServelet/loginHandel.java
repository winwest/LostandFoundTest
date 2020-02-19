package myServelet;

import UserBean.login;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginHandel")
public class loginHandel extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public loginHandel() {
        super();
        
    }

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		Connection con;
		Statement sql;
		ResultSet rs;
		login loginBean=null;
		String backNews="";
		
		//创建生命周期为session的bean对象loginbean
		HttpSession session=request.getSession();
		try{
			loginBean=(login)session.getAttribute("loginBean");
			if(loginBean==null){
				loginBean=new login();
				session.setAttribute("loginBean", loginBean);
			}
		}
		catch(Exception ex){
			loginBean=new login();
			session.setAttribute("loginBean",loginBean);
		}
		
		String logname=request.getParameter("Name").trim() , password=request.getParameter("Password").trim();
		boolean ok=loginBean.isSuccess();
		
		if(ok==true&&logname.equals(loginBean.getName())){
			 backNews=logname+"已成功登录!";
			 loginBean.setBackNews(backNews);
		}else{
			String url="jdbc:mysql://localhost:3306/landf";
			String username ="root";
			String userpass="123456";
			boolean boo=(logname.length()>0)&&(password.length()>0); 
			try{
				//建立了与指定数据库test2连接的con对象
				con=DriverManager.getConnection(url,username,userpass);
				String condition="select* from users where Name = '"+logname+"' and Password ='"+password+"'";
				
				//创建数据库操作对象rs
				sql=con.createStatement(); 
				if(boo){
					rs=sql.executeQuery(condition);
					boolean m=rs.next();
					//如果成功
					if(m==true){
						backNews="登陆成功";
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(true);
						loginBean.setName(logname);
						rs.close();
					}
					//如果不成功
					else{
						backNews="您输入的用户名不存在，或密码不般配";
						loginBean.setBackNews(backNews);
						loginBean.setSuccess(false); 
						/*loginBean.setName(logname);
						loginBean.setPassword(password);*/
					}
				}
				else{
					backNews="您输入的用户名不存在，或密码不般配";
					loginBean.setBackNews(backNews); 
					loginBean.setSuccess(false); 
					/*loginBean.setName(logname);
					loginBean.setPassword(password);*/
				}
				//释放资源
				sql.close();
				con.close();
		}
		catch(SQLException exp){
			backNews=""+exp;
			loginBean.setBackNews(backNews);
			loginBean.setSuccess(false); 
		}
	}
			//转发操作
			RequestDispatcher dispatcher=request.getRequestDispatcher("showlogin.jsp"); 
			/*RequestDispatcher dispatcher=request.getRequestDispatcher("newMain.jsp");//登陆成功直接跳转到主页面*/
			dispatcher.forward(request,response);
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
