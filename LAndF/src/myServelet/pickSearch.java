package myServelet;
import java.sql.*;
import java.util.*;
import java.io.*;
import UserBean.*;
import com.dao.pickSearchDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pickSearch
 */
@WebServlet("/pickSearch")
public class pickSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public pickSearch() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	//拾取物品的查询
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
    	response.setCharacterEncoding("UTF-8");
    	
    	//将JSP中name="pick_name"的值赋给Sring类型的name
    	String name=request.getParameter("pick_name");
    	//新建一个Dao
    	pickSearchDao dao = new pickSearchDao();
    	
    	
        //创建一个列表，调用dao的SearchName
    	List<allBean> SearchName = dao.SearchName(name);  
    	
        //保存查询的信息用setAttribute将值给SearchName    
        request.setAttribute("SearchName", SearchName);
        
        //转发请求  
        request.getRequestDispatcher("/pickSearch.jsp").forward(request, response);  

	}

}
