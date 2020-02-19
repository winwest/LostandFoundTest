package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import UserBean.*;
public class pickSearchDao {
	public List<allBean> SearchName(String Name){
		Connection con=null;
		Statement stm=null;
		PreparedStatement pstmt=null;
		List<allBean> classList =new ArrayList<allBean>();
		try{
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/landf","root","123456");
			
			
			String sql="select* from pick where pick_name like '%";
			sql+=Name+"%'";
			
			/*String sql="select* from pick where pick_name like '%"+Name+"%' && select* from pick where pick_name like '"+Name+"%'";*/
			
			stm=con.createStatement();
			ResultSet rs=stm.executeQuery(sql);
			while(rs.next()){
				String pick_name=rs.getString("pick_name");
				String pick_place=rs.getString("pick_place");
				String pick_time=rs.getString("pick_time");
				String pick_trait=rs.getString("pick_trait");
				String pname=rs.getString("pname");
				String pphone =rs.getString("pphone");
				
				
				allBean pick=new allBean();
				pick.setPick_name(pick_name);
				pick.setPick_place(pick_place);
				pick.setPick_time(pick_time);
				pick.setPick_trait(pick_trait);
				pick.setPname(pname);
				pick.setPphone(pphone);
			
				classList.add(pick);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return classList;
	}
}
