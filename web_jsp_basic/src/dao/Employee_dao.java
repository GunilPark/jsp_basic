package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Employee_dto;

public class Employee_dao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	

//리스트 페이지
	public ArrayList<Employee_dto> getListPage(){
		
		ArrayList<Employee_dto> dtos = new ArrayList<>();
		
		String query ="select id, name, depart, rank, to_char(entry_date,'yyyy-MM-dd')\r\n" + 
				"from 홍길동_employee\r\n" + 
				"order by entry_date desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String depart = rs.getString(3);
				String rank = rs.getString(4);
				String entry_date = rs.getString(5);
				
				Employee_dto dto = new Employee_dto(id, name, depart, rank, entry_date);
				
				dtos.add(dto);
				
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
				
		return dtos;
	}
	
}
