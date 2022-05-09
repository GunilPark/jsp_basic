package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.CommonUtil;
import common.DBConnection;
import dto.Snack_dto;
import dto.Snack_info_dto;

public class Snack_dao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 삭제
	public int deleteSnack(String p_code) {
		int result = 0;
		String query = "delete from web_박건일_snack\r\n" + 
				"where p_code='"+ p_code +"'";
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

	// 업데이트
	public int updateSnack(Snack_dto dto) {
		int result = 0;
		String query = "update \"WEB_박건일_SNACK\"\r\n" + "set p_name ='" + dto.getP_name() + "',m_code='"
				+ dto.getM_code() + "',price='" + dto.getPrice() + "'\r\n" + "where p_code = '" + dto.getP_code() + "'";

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

	// 뷰 생성 Snack_dto dto = dao.getSnackView(p_code);
	public Snack_dto getSnackView(String p_code) {
		Snack_dto dto = null;
		String query = "select a.p_code, a.p_name,\r\n" + "b.m_name||'['||a.m_code||']'as m_name,to_char(a.price,'999,999') || '원'\r\n"
				+ "from web_박건일_snack a, a00_snack_info b\r\n" + "where a.m_code = b.m_code\r\n" + "and p_code = '"
				+ p_code + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				p_code = rs.getString(1);
				String p_name = rs.getString(2);
				String m_code = rs.getNString(3);
				String price = rs.getString(4);
				dto = new Snack_dto(p_code, p_name, m_code, price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	//snackView2
	public Snack_dto getSnackView2(String p_code) {
		Snack_dto dto = null;
		String query = "select a.p_code, a.p_name,\r\n" + "b.m_name||'['||a.m_code||']'as m_name,to_char(a.price,'999,999') || '원'\r\n"
				+ "from web_박건일_snack a, a00_snack_info b\r\n" + "where a.m_code = b.m_code\r\n" + "and p_code = '"
				+ p_code + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				p_code = rs.getString(1);
				String p_name = rs.getString(2);
				String m_code = rs.getNString(3);
				String price = rs.getString(4);
				dto = new Snack_dto(p_code, p_name, m_code, price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	public ArrayList<Snack_dto> getSnackListPage(String select, String search, String m_code, int start, int end) {
		ArrayList<Snack_dto> dtos = new ArrayList<>();
		
		String query = "";
		
		if(m_code.equals("all")) {
		query = "select *\r\n" + 
				"from\r\n" + 
				"(select tbl.*, rownum as rnum\r\n" + 
				"from\r\n" + 
				"(select a.p_code, a.p_name,\r\n" + 
				"b.m_name||'['||a.m_code||']'as m_name, to_char(a.price,'999,999') || '원'\r\n" + 
				"from web_박건일_snack a, a00_snack_info b\r\n" + 
				"where a.m_code = b.m_code\r\n" + 
				"and "+ select +" like '%"+ search +"%'\r\n" + 
				"order by a.p_code) tbl)\r\n" + 
				"where rnum >="+start+" and rnum <="+end+"";
		}else {
		query = "select *\r\n" + 
				"from\r\n" + 
				"(select tbl.*, rownum as rnum\r\n" + 
				"from\r\n" + 
				"(select a.p_code, a.p_name,\r\n" + 
				"b.m_name||'['||a.m_code||']'as m_name, to_char(a.price,'999,999') || '원'\r\n" + 
				"from web_박건일_snack a, a00_snack_info b\r\n" + 
				"where a.m_code = b.m_code\r\n" + 
				"and "+ select +" like '%"+ search +"%'\r\n" + 
				"and a.m_code = "+ m_code +"\r\n" + 
				"order by a.p_code) tbl)\r\n"+ 
				"where rnum >="+start+" and rnum <="+end+"";
		}
		System.out.print(query);
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String p_code = rs.getString(1);
				String p_name = rs.getString(2);
				m_code = rs.getString(3);
				String price = rs.getString(4);

				Snack_dto dto = new Snack_dto(p_code, p_name, m_code, price);

				dtos.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}
	
	public int getTotalCount(String select, String search, String m_code){
		int count = 0;
		String query = "";
		
		if(m_code.equals("all")) {
		query = "select count(*) \r\n" + 
				"from web_박건일_snack a, a00_snack_info b\r\n" + 
				"where a.m_code = b.m_code\r\n" + 
				"and "+ select +" like '%"+ search +"%'\r\n" + 
				"order by a.p_code";
		}else {
		query = "select count(*) \r\n" + 
				"from web_박건일_snack a, a00_snack_info b\r\n" + 
				"where a.m_code = b.m_code\r\n" + 
				"and "+ select +" like '%"+ search +"%'\r\n" + 
				"and a.m_code = "+ m_code +"\r\n" + 
				"order by a.p_code desc";
		}
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
		
		
		return count;
	}
	
	
	
	
	// 리스트 저장
	public ArrayList<Snack_dto> getSnackList(String select, String search, String m_code) {
		ArrayList<Snack_dto> dtos = new ArrayList<>();
		
		String query = "";
		
		if(m_code.equals("all")) {
		query = "select a.p_code, a.p_name,\r\n" + 
				"b.m_name||'['||a.m_code||']'as m_name, to_char(a.price,'999,999') || '원'\r\n" + 
				"from web_박건일_snack a, a00_snack_info b\r\n" + 
				"where a.m_code = b.m_code\r\n" + 
				"and "+ select +" like '%"+ search +"%'\r\n" + 
				"order by a.p_code";
		}else {
		query = "select a.p_code, a.p_name,\r\n" + 
				"b.m_name||'['||a.m_code||']'as m_name, to_char(a.price,'999,999') || '원'\r\n" + 
				"from web_박건일_snack a, a00_snack_info b\r\n" + 
				"where a.m_code = b.m_code\r\n" + 
				"and "+ select +" like '%"+ search +"%'\r\n" + 
				"and a.m_code = "+ m_code +"\r\n" + 
				"order by a.p_code desc";
		}
		System.out.print(query);
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String p_code = rs.getString(1);
				String p_name = rs.getString(2);
				m_code = rs.getString(3);
				String price = rs.getString(4);

				Snack_dto dto = new Snack_dto(p_code, p_name, m_code, price);

				dtos.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}

	// 새로운 번호 생성
	public String getNewCode() {
		String no = "";
		String query = "select nvl(MAX(p_code),'p0000')\r\n" + "from web_박건일_snack";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				no = rs.getString(1);
				no = CommonUtil.getNewNo("p0000", no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return no;
	}

	public int saveSnack(Snack_dto dto) {
		int result = 0;
		String query = "insert into \"WEB_박건일_SNACK\"\r\n" + "(p_code, p_name, m_code ,price)\r\n" + "values\r\n" + "('"
				+ dto.getP_code() + "', '" + dto.getP_name() + "', '" + dto.getM_code() + "', '" + dto.getPrice()
				+ "')";

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

	// 제조사 조회
	public ArrayList<Snack_info_dto> getInfoList() {
		ArrayList<Snack_info_dto> dtos = new ArrayList<>();
		String query = "select m_code, m_name\r\n" + "from a00_snack_info\r\n" + "order by m_code";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				String m_code = rs.getString(1);
				String m_name = rs.getString(2);

				Snack_info_dto dto = new Snack_info_dto(m_code, m_name);
				dtos.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}

		return dtos;
	}

}
