package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Animal_dto;

public class Animal_dao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	

//리스트 페이지
	public ArrayList<Animal_dto> getListPage(){
		
		ArrayList<Animal_dto> dtos = new ArrayList<>();
		
		String query ="select no, kind, name, age, weight, height, to_char(reg_date,'yyyy-MM-dd')\r\n" + 
				"from \"홍길동_ANIMAL\"\r\n" + 
				"order by reg_date desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString(1);
				String kind = rs.getString(2);
				String name = rs.getString(3);
				int age = rs.getInt(4);
				int weight = rs.getInt(4);
				int height = rs.getInt(4);
				String date = rs.getString(3);
				
				
				Animal_dto dto = new Animal_dto(no, kind, name, age, weight, height, date);        
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
