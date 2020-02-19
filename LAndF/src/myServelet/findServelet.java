package myServelet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserBean.allBean;
import java.util.*;


@WebServlet("/findServelet")
public class findServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public findServelet() {
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
				
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost:3306/landf";
					String username="root";
					String password="123456";
					Connection con=DriverManager.getConnection(url,username,password);
					Statement stmt=con.createStatement();
					String sql="select* from pick";
					ResultSet rs=stmt.executeQuery(sql);
					
					List<allBean> list= new ArrayList<allBean>();
					
					while(rs.next()){
						allBean pickf =new allBean();//实例化对象pickf
						pickf.setPick_name(rs.getString("pick_name"));
						pickf.setPick_place(rs.getString("pick_place"));
						pickf.setPick_time(rs.getString("pick_time"));
						pickf.setPick_trait(rs.getString("pick_trait"));
						pickf.setPick_num(rs.getInt("pick_num"));
						pickf.setPname(rs.getString("pname"));
						pickf.setPphone(rs.getString("pphone"));
						list.add(pickf);
					}
					request.setAttribute("list", list);
					rs.close();
					stmt.close();
					con.close();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}catch(SQLException e){
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("ModPick.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
