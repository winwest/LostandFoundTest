package myServelet;

import java.sql.*;
import java.util.*;
import java.io.*;
import UserBean.allBean;

import com.dao.lostSearchDao;
import com.dao.pickSearchDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class lostSearch
 */
@WebServlet("/lostSearch")
public class lostSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lostSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("UTF-8"); 
    	response.setCharacterEncoding("UTF-8");
    	
    	//将JSP中name="pick_name"的值赋给Sring类型的name
    	String name=request.getParameter("lost_name");
    	//新建一个Dao
    	lostSearchDao dao = new lostSearchDao();
    	String sql = "select * from lost where lost_name ='";
        sql += name + "'";
        //创建一个列表，调用dao的SearchName
    	List<allBean> SearchName = dao.SearchName(name);  
        //保存查询的信息用setAttribute将值给SearchName    
        request.setAttribute("SearchName", SearchName);
        //转发请求  
        request.getRequestDispatcher("/lostSearch.jsp").forward(request, response);  

	}

}
