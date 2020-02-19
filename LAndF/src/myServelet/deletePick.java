package myServelet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deletePick
 */
@WebServlet("/deletePick")
public class deletePick extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletePick() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码（不设置编码输入中文就会出现乱码）
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.setCharacterEncoding("utf-8");
				
				int pick_num=Integer.valueOf(request.getParameter("pick_num"));
				
				//连接数据库
				try{
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost:3306/landf";
					String username="root";
					String pwd="123456";
					Connection con=DriverManager.getConnection(url,username,pwd);
					
					//执行的sql语句
					String sql="delete from pick where pick_num=?";
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setInt(1, pick_num);
					
					
					//执行更新（不能写错了，否则就执行不出来）
					ps.executeUpdate();
					
					ps.close();
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
				response.sendRedirect("findServelet");
	}

}
