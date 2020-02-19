package myServelet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserBean.allBean;

@WebServlet("/newLost")
public class newLost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public newLost() {
        super();
        
    }

	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		//显示的全部失物信息
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/landf";
			String username="root";
			String password="123456";
			Connection con=DriverManager.getConnection(url,username,password);
			Statement stmt=con.createStatement();
			String sql="select* from lost";
			ResultSet rs=stmt.executeQuery(sql);
			
			List<allBean> list2= new ArrayList<allBean>();
			
			while(rs.next()){
				allBean lostf =new allBean();//实例化对象lostf
				
				lostf.setLost_name(rs.getString("lost_name"));
				lostf.setLost_place(rs.getString("lost_place"));
				lostf.setLost_time(rs.getString("lost_time"));
				lostf.setLost_trait(rs.getString("lost_trait"));
				lostf.setLname(rs.getString("lname"));
				lostf.setLphone(rs.getString("lphone"));
				lostf.setLost_num(rs.getInt("lost_num"));
				
				list2.add(lostf);
			}
			request.setAttribute("list2", list2);
			rs.close();
			stmt.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("newAllLost.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
