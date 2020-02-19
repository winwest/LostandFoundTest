package myServelet;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


@WebServlet("/updateServelet")
public class updateServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updateServelet() {
        super();
       
    }

	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	//修改拾取物品的备注信息
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码（不设置编码输入中文就会出现乱码）
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String pick_trait=request.getParameter("pick_trait");
		int pick_num=Integer.valueOf(request.getParameter("pick_num"));
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/landf";
			String username="root";
			String pwd="123456";
			Connection con=DriverManager.getConnection(url,username,pwd);
			
			
			String sql = "update pick set pick_trait=? where pick_num=?";
			
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, pick_trait);
			ps.setInt(2, pick_num);
			
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
