package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Student_dto_김세훈;

public class Student_dao_김세훈 {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public int deleteStudent(String syear, String sclass, String no) {
		int result = 0;
		String query = "delete 김세훈_student\r\n" + 
				"where syear='"+syear+"' and sclass = '"+sclass+"' and no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	public int updateStudent(String syear, String sclass, String no, String kor, String eng, String mat) {
		int result = 0;
		String query = "update 김세훈_student\r\n" + 
				"set kor ="+ kor +",\r\n" + 
				"    eng ="+ eng +",\r\n" + 
				"    mat = "+ mat +"\r\n" + 
				"where syear='"+ syear +"' and sclass = '"+ sclass +"' and no = '"+ no +"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	public int saveStudent(String syear, String sclass, String no, String name, String kor, String eng, String mat) {
		int result = 0;
		String query = "insert into 김세훈_student\r\n" + "(syear, sclass, no, name, kor, eng, mat)\r\n" + "values\r\n"
				+ "('" + syear + "', '" + sclass + "', '" + no + "', '" + name + "', " + kor + ", " + eng + ", " + mat
				+ ")";
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

	public double getClsAvg(String syear, String sclass) {
		ArrayList<Integer> score = new ArrayList<>();
		String query = "select kor, eng, mat from 김세훈_student\r\n" + "where syear = '" + syear + "' and sclass = '"
				+ sclass + "'";
		double clsAvg;
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				int sum = rs.getInt(1) + rs.getInt(2) + rs.getInt(3);
				score.add(sum);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		int sum = 0;
		for (int i = 0; i < score.size(); i++) {
			sum += score.get(i);
		}
		clsAvg = sum / (score.size() * 3.0);

		return (Math.round(clsAvg * 10) / 10.0);
	}

	public Student_dto_김세훈 getStuView(String syear, String sclass, String no) {
		Student_dto_김세훈 dto = null;
		String query = "select kor, eng, mat, name from 김세훈_student\r\n" + "where syear = '" + syear
				+ "' and sclass = '" + sclass + "' and no = '" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				int kor = rs.getInt(1);
				int eng = rs.getInt(2);
				int mat = rs.getInt(3);
				String name = rs.getString(4);
				dto = new Student_dto_김세훈(kor, eng, mat, name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dto;
	}

	public ArrayList<Student_dto_김세훈> getStudentList(String sltYear, String sltClass, String sltSelect, String search) {
		ArrayList<Student_dto_김세훈> dtos = new ArrayList<>();
		int chkEqu = 0; // where체크
		int chkAnd = 0; // and체크
		String query = "select syear, sclass, no, name from 김세훈_student\r\n";
		if (!sltYear.equals("all")) {
			if (chkEqu == 0) {
				query += " where ";
				chkEqu++; // where 사용시 값 변경
			}
			query += "syear = '" + sltYear + "'";
			chkAnd++;
		}
		if (!sltClass.equals("all")) {
			if (chkEqu == 0) { // where 사용여부 체크
				query += " where ";
				chkEqu++;
			}
			if (chkAnd > 0)
				query += " and "; // chkAnd가 1이상일때 쿼리문 사이에 and 삽입
			query += "sclass = '" + sltClass + "'";
			chkAnd++;
		}
		if (chkEqu == 0) {
			query += " where ";
			chkEqu++;
		}
		if (chkAnd > 0)
			query += " and ";
		query += "" + sltSelect + " like '%" + search + "%' order by syear, sclass, to_number(no)";
		System.out.println(query);

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String syear = rs.getString(1);
				String sclass = rs.getString(2);
				String no = rs.getString(3);
				String name = rs.getString(4);
				Student_dto_김세훈 dto = new Student_dto_김세훈(syear, sclass, no, name);
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}

	public Student_dto_김세훈 getMemberView(String id) {
		Student_dto_김세훈 dto = null;
		String query = "";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return dto;
	}
}
