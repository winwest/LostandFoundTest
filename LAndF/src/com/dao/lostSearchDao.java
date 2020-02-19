package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import UserBean.*;
public class lostSearchDao {
	public List<allBean> SearchName(String Name){
		Connection con=null;
		Statement stm=null;
		List<allBean> classList =new ArrayList<allBean>();
		try{
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/landf","root","123456");
			String sql="select* from lost where lost_name like '%";
			sql+=Name+"%'";
			
			stm=con.createStatement();
			ResultSet rs=stm.executeQuery(sql);
			while(rs.next()){
				String lost_name=rs.getString("lost_name");
				String lost_place=rs.getString("lost_place");
				String lost_time=rs.getString("lost_time");
				String lost_trait=rs.getString("lost_trait");
				String lname=rs.getString("lname");
				String lphone=rs.getString("lphone");
				
				
				allBean lost=new allBean();
				lost.setLost_name(lost_name);
				lost.setLost_place(lost_place);
				lost.setLost_time(lost_time);
				lost.setLost_trait(lost_trait);
				lost.setLphone(lphone);
				lost.setLname(lname);
			
				classList.add(lost);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return classList;
	}
}
