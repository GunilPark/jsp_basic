package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Group_dto;

public class Group_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public String getCheckLogin(String id, String password) {
		String loginName = "";
		String query = "select name\r\n" + 
				"from 홍길동_member\r\n" + 
				"where id = '"+ id +"'\r\n" + 
				"and password = '"+ password +"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				loginName = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return loginName;
	}

	// 업데이트
	public int updateMember(Group_dto dto) {
		int result = 0;
		String query = "update \"WEB_박건일_GROUP\"\r\n" + "set name='" + dto.getName() + "',\r\n" + "    age='"
				+ dto.getAge() + "',\r\n" + "    reg_date='" + dto.getReg_date() + "'\r\n" + "where id='" + dto.getId()
				+ "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return result;
	}

	// 삭제~
	public int deleteMember(String id) {
		int result = 0;
		String query = "delete from \"WEB_박건일_GROUP\"\r\n" + "where id='" + id + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return result;
	}

	// 상세조회
	public Group_dto getMemberView(String id) {
		Group_dto dto = null;
		String query = "select id, name, age, to_char(reg_date,'yyyy-MM-dd')\r\n" + "from web_박건일_Group\r\n"
				+ "where id = '" + id + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getString(1);
				String name = rs.getString(2);
				String age = rs.getString(3);
				String reg_date = rs.getString(4);

				dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dto;
	}
	//조회건수
	public int getTotalCount(String select, String search) {
		int result = 0;
		String query = "select count(*)\r\n" + "from web_박건일_Group\r\n" + "where "
				+ select + " like '%" + search + "%'";
		
		System.out.println(query);
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	
	//패이지창
	public ArrayList<Group_dto> getMemberListPage(String select, String search ,int start, int end) {
		ArrayList<Group_dto> dtos = new ArrayList<>();
		String query = "select *\r\n" + 
				"from\r\n" + 
				"(select tbl.*, rownum as rnum\r\n" + 
				"from\r\n" + 
				"(select id, name, age, to_char(reg_date,'yyyy-MM-dd')\r\n" + 
				"from web_박건일_Group\r\n" + 
				"where "+ select +" like '%" + search + "%'\r\n" + 
				"order by reg_date desc) tbl)\r\n" + 
				"where rnum >="+start+" and rnum <="+end+"";
		
		System.out.println(query);
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String age = rs.getString(3);
				String reg_date = rs.getString(4);
				Group_dto dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);
				dtos.add(dto);
			}

		} catch (SQLException e) {

		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}
	
	
	
	// 모록 조회
	public ArrayList<Group_dto> getMemberList(String select, String search) {
		ArrayList<Group_dto> dtos = new ArrayList<>();
		String query = "select id, name, age, to_char(reg_date,'yyyy-MM-dd')\r\n" + "from web_박건일_Group\r\n" + "where "
				+ select + " like '%" + search + "%'\r\n" + "order by reg_date desc";
		
		System.out.println(query);
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String age = rs.getString(3);
				String reg_date = rs.getString(4);
				Group_dto dto = new Group_dto(id, name, Integer.parseInt(age), reg_date);
				dtos.add(dto);
			}

		} catch (SQLException e) {

		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}

	// id 중복검사
	public int getCheckId(String id) {
		int result = 0;
		String query = "select count(*)\r\n" + "from \"WEB_박건일_GROUP\"\r\n" + "where id = '" + id + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return result;
	}

	public int saveMember(Group_dto dto) {
		int result = 0;
		String query = "insert into web_박건일_group\r\n" + "(id, name, age, reg_date)\r\n" + "values\r\n" + "('"
				+ dto.getId() + "','" + dto.getName() + "'," + dto.getAge() + " ,'" + dto.getReg_date() + "')";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

}
