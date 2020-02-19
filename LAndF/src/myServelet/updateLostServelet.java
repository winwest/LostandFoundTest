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

@WebServlet("/updateLostServelet")
public class updateLostServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public updateLostServelet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	//修改失物的备注信息
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码（不设置编码输入中文就会出现乱码）
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				response.setCharacterEncoding("utf-8");
				String lost_trait=request.getParameter("lost_trait");
				int lost_num=Integer.valueOf(request.getParameter("lost_num"));
				
				//连接数据库
				try{
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost:3306/landf";
					String username="root";
					String pwd="123456";
					Connection con=DriverManager.getConnection(url,username,pwd);
					
					//执行的sql语句(修改)
					String sql = "update lost set lost_trait=? where lost_num=?";
					
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setString(1, lost_trait);
					ps.setInt(2, lost_num);
					
					
					//执行更新（不能写错了，否则就执行不出来）
					ps.executeUpdate();
					
					ps.close();
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
				response.sendRedirect("lostServelet");
			}

}
