package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBConnection;
import dto.Student_dto_박건일;

public class Student_dao_박건일 {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 생성
	public int getInsertStudent(Student_dto_박건일 dto) {
		int result = 0;
		String query = "insert into 박건일_student\r\n" + "(syear, sclass, no, name, kor, eng, mat)\r\n" + "VALUES\r\n"
				+ "('" + dto.getsYear() + "','" + dto.getsClass() + "','" + dto.getNo() + "','" + dto.getName() + "',"
				+ dto.getKor() + "," + dto.getEng() + "," + dto.getMat() + ")";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);

		return result;
	}

	// 중복체크
	public int getCheckStudent(String sYear, String sClass, String no) {
		int result = 0;
		String query = "select count(*)\r\n" + "from 박건일_student\r\n" + "where syear = '" + sYear + "'\r\n"
				+ "and sclass = '" + sClass + "'\r\n" + "and no = '" + no + "'";
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
		System.out.println(query);

		return result;
	}

	// 삭제
	public int getDeleteStudent(String sYear, String sClass, String no) {
		int result = 0;
		String query = "delete from 박건일_STUDENT\r\n" + "where syear='" + sYear + "'\r\n" + "and sclass='" + sClass
				+ "'\r\n" + "and no='" + no + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);

		return result;
	}

	// 업데이트
	public int getUpdateStudent(Student_dto_박건일 dto) {
		int result = 0;
		String query = "update 박건일_STUDENT\r\n" + "set name = '" + dto.getName() + "', kor=" + dto.getKor() + ", eng="
				+ dto.getEng() + ", mat=" + dto.getMat() + "\r\n" + "where syear='" + dto.getsYear() + "'\r\n"
				+ "and sclass='" + dto.getsClass() + "'\r\n" + "and no='" + dto.getNo() + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);

		return result;
	}

	// 반평균
	public String getClassAverage(Student_dto_박건일 dto) {
		double classAverage = 0;
		String query = "select syear, sclass, no, name, kor, eng, mat \r\n" + "from 박건일_student \r\n" + "where syear ='"
				+ dto.getsYear() + "'\r\n" + "and sclass ='" + dto.getsClass() + "'";
		ArrayList<Student_dto_박건일> dtos = new ArrayList<>();

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				String sYear = rs.getString(1);
				String sClass = rs.getString(2);
				String no = rs.getString(3);
				String name = rs.getString(4);
				int kor = rs.getInt(5);
				int eng = rs.getInt(6);
				int mat = rs.getInt(7);

				Student_dto_박건일 dto2 = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
				dtos.add(dto2);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		double total = 0;
		for (int k = 0; k < dtos.size(); k++) {
			total += dtos.get(k).getKor() + dtos.get(k).getEng() + dtos.get(k).getMat();
		}
		classAverage = total / (dtos.size() * 3.0);

		DecimalFormat form = new DecimalFormat("##.#");
		String classAverageS = form.format(classAverage);
		return classAverageS;
	}

	// 평균
	public String getAverage(Student_dto_박건일 dto) {
		double average = 0;

		DecimalFormat form = new DecimalFormat("##.#");

		average = (dto.getKor() + dto.getEng() + dto.getMat()) / 3.0;

		String averageS = form.format(average);

		return averageS;
	}

	// 총점
	public int getTotal(Student_dto_박건일 dto) {
		int total = 0;
		total = dto.getKor() + dto.getEng() + dto.getMat();
		return total;
	}

	// 상세정보(view)생성
	public Student_dto_박건일 getViewStudent(String sYear, String sClass, String no) {
		Student_dto_박건일 dto = null;
		String query = "select syear,sclass,no,name,kor,eng,mat\r\n" + "from 박건일_student\r\n" + "where syear='" + sYear
				+ "'\r\n" + "and sclass='" + sClass + "'\r\n" + "and no='" + no + "'";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				sYear = rs.getString(1);
				sClass = rs.getString(2);
				no = rs.getString(3);
				String name = rs.getString(4);
				int kor = rs.getInt(5);
				int eng = rs.getInt(6);
				int mat = rs.getInt(7);

				dto = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dto;
	}

	public ArrayList<Student_dto_박건일> getStudentListTotal(String selectYear, String selectClass1, String selectClass2,
			String selectClass3, String selectClass4, String selectClass5, String selectNN, String search) {
		ArrayList<Student_dto_박건일> dtos = new ArrayList<>();
		if (selectClass1.equals("1")) {
			ArrayList<Student_dto_박건일> dtos1 = getStudentList(selectYear, selectClass1, selectNN, search);
			for (int k = 0; k < dtos1.size(); k++) {
				dtos.add(dtos1.get(k));
			}
		}
		if (selectClass2.equals("2")) {
			ArrayList<Student_dto_박건일> dtos2 = getStudentList(selectYear, selectClass2, selectNN, search);
			for (int k = 0; k < dtos2.size(); k++) {
				dtos.add(dtos2.get(k));
			}
		}
		if (selectClass3.equals("3")) {
			ArrayList<Student_dto_박건일> dtos3 = getStudentList(selectYear, selectClass3, selectNN, search);
			for (int k = 0; k < dtos3.size(); k++) {
				dtos.add(dtos3.get(k));
			}
		}
		if (selectClass4.equals("4")) {
			ArrayList<Student_dto_박건일> dtos4 = getStudentList(selectYear, selectClass4, selectNN, search);
			for (int k = 0; k < dtos4.size(); k++) {
				dtos.add(dtos4.get(k));
			}
		}
		if (selectClass5.equals("5")) {
			ArrayList<Student_dto_박건일> dtos5 = getStudentList(selectYear, selectClass5, selectNN, search);
			for (int k = 0; k < dtos5.size(); k++) {
				dtos.add(dtos5.get(k));
			}
		}

		return dtos;
	}
	// 토탈

	public int getTotalCount(String selectYear, String[] selectClass, String selectNN, String search) {
		int count = 0;
		
		
		String inString = String.join("', '", selectClass);

		System.out.println(inString);
		String likeEqu = "";
		// like 변수
		if (selectNN.equals("no")) {
			likeEqu = "= '" + search + "'";
		} else {
			likeEqu = "like '%" + search + "%'";
		}

		String query = "select count(*) \r\n" + "from 박건일_student \r\n" + "where sclass in('" + inString + "') \r\n";
		// syear 추가
		if (selectYear.equals("all")) {
		} else {
			query += "and syear = '" + selectYear + "' \r\n";
		}
		query += "and " + selectNN + " " + likeEqu + "\r\n order by syear,sclass,to_number(no)";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return count;
	}

	// 리스트 페이지

	public ArrayList<Student_dto_박건일> getStudentListPage(String selectYear, String[] selectClass, String selectNN,
			String search, int start, int end) {
		ArrayList<Student_dto_박건일> dtos = new ArrayList<>();
		

		String inString = String.join("', '", selectClass);

		System.out.println(inString);
		String likeEqu = "";
		// like 변수
		if (selectNN.equals("no")) {
			likeEqu = "= '" + search + "'";
		} else {
			likeEqu = "like '%" + search + "%'";
		}
		String query = "";
		
		System.out.println(selectClass.length);
		if (selectClass.length == 0) {
			query = "select * \r\n" + "from \r\n" + "(select tbl.*, rownum as rnum \r\n" + "from \r\n"
					+ "(select syear, sclass, no, name, kor, eng, mat \r\n" + "from 박건일_student \r\n"
					+ "where sclass in('1','2','3','4','5'') \r\n";
		} else {
			query = "select * \r\n" + "from \r\n" + "(select tbl.*, rownum as rnum \r\n" + "from \r\n"
					+ "(select syear, sclass, no, name, kor, eng, mat \r\n" + "from 박건일_student \r\n"
					+ "where sclass in('" + inString + "') \r\n";
		}
		// syear 추가
		if (selectYear.equals("all")) {
		} else {
			query += "and syear = '" + selectYear + "' \r\n";
		}
		query += "and " + selectNN + " " + likeEqu + "\r\n order by syear,sclass,to_number(no)) tbl) \r\n"
				+ "where rnum >=" + start + " and rnum <=" + end;

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String sYear = rs.getString(1);
				String sClass = rs.getString(2);
				String no = rs.getString(3);
				String name = rs.getString(4);
				int kor = rs.getInt(5);
				int eng = rs.getInt(6);
				int mat = rs.getInt(7);

				Student_dto_박건일 dto = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
				dtos.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}

	// 리스트 생성 String.join("", 배열) +++ SQL in('','','','','') 활용.
	public ArrayList<Student_dto_박건일> getStudentListIN(String selectYear, String[] selectClass, String selectNN,
			String search) {
		ArrayList<Student_dto_박건일> dtos = new ArrayList<>();

		for (int k = 0; k < 5; k++) {
			if (selectClass[k].equals("")) {
				selectClass[k] = "000";
			}
		}

		if (selectClass[0].equals("000") && selectClass[1].equals("000") && selectClass[2].equals("000")
				&& selectClass[3].equals("000") && selectClass[4].equals("000")) {
			selectClass[0] = "1";
			selectClass[1] = "2";
			selectClass[2] = "3";
			selectClass[3] = "4";
			selectClass[4] = "5";
		}

		String inString = String.join("', '", selectClass);
		String likeEqu = "";
		// like 변수
		if (selectNN.equals("no")) {
			likeEqu = "= '" + search + "'";
		} else {
			likeEqu = "like '%" + search + "%'";
		}

		String query = "select syear, sclass, no, name, kor, eng, mat \r\n" + "from 박건일_student \r\n"
				+ "where sclass in('" + inString + "') \r\n";
		// syear 추가
		if (selectYear.equals("all")) {
		} else {
			query += "and syear = '" + selectYear + "' \r\n";
		}
		query += "and " + selectNN + " " + likeEqu + "\r\n order by syear,sclass,to_number(no)";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String sYear = rs.getString(1);
				String sClass = rs.getString(2);
				String no = rs.getString(3);
				String name = rs.getString(4);
				int kor = rs.getInt(5);
				int eng = rs.getInt(6);
				int mat = rs.getInt(7);

				Student_dto_박건일 dto = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
				dtos.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		System.out.println(query);

		return dtos;
	}

//리스트 생성
	public ArrayList<Student_dto_박건일> getStudentListOrAnd(String selectYear, String[] selectClass, String selectNN,
			String search) {
		ArrayList<Student_dto_박건일> dtos = new ArrayList<>();

		String likeEqu = "";
		if (selectNN.equals("no")) {
			likeEqu = "= '" + search + "'";
		} else {
			likeEqu = "like '%" + search + "%'";
		}

		String query = "select syear, sclass, no, name, kor, eng, mat \r\n from 박건일_student \r\n";
		int cnt = 0;
		String yearQuery = "";
		if (selectYear.equals("all")) {
			for (int k = 0; k < 5; k++) {
				if (selectClass[k].equals(Integer.toString(k + 1) + "") && cnt == 0) {
					query += "where sclass = '" + selectClass[k] + "'\r\n";
					query += "and " + selectNN + " " + likeEqu + "\r\n";
					cnt++;
				}
			}
			if (cnt == 0) {
				query += "where sclass = ''\r\n";
			}

			for (int k = 1; k < 5; k++) {
				if (selectClass[k].equals(Integer.toString(k + 1) + "") && cnt != 0) {
					query += "or sclass = '" + selectClass[k] + "'";
					query += "and " + selectNN + " " + likeEqu + "\r\n";
				}
			}
		}

		for (int i = 0; i < 3; i++) {
			if (selectYear.equals(Integer.toString(i + 1) + "")) {
				yearQuery = "where syear = '" + selectYear + "'\r\n";
				cnt = 0;

				for (int k = 0; k < 5; k++) {
					if (selectClass[k].equals(Integer.toString(k + 1) + "") && cnt == 0) {
						query += yearQuery;
						query += "and sclass = '" + selectClass[k] + "'\r\n";
						query += "and " + selectNN + " " + likeEqu + "\r\n";
						cnt++;
					}
				}

				if (cnt == 0) {
					query += "where sclass = ''\r\n";
				}

				yearQuery = "or syear = '" + selectYear + "'\r\n";

				for (int k = 1; k < 5; k++) {
					if (selectClass[k].equals(Integer.toString(k + 1) + "") && cnt != 0) {
						query += yearQuery;
						query += "and sclass = '" + selectClass[k] + "'\r\n";
						query += "and " + selectNN + " " + likeEqu + "\r\n";
					}
				}
			}
		}

		query += "order by syear,sclass,to_number(no)";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String sYear = rs.getString(1);
				String sClass = rs.getString(2);
				String no = rs.getString(3);
				String name = rs.getString(4);
				int kor = rs.getInt(5);
				int eng = rs.getInt(6);
				int mat = rs.getInt(7);

				Student_dto_박건일 dto = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
				dtos.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}

	// 리스트 생성
	public ArrayList<Student_dto_박건일> getStudentList(String selectYear, String selectClass, String selectNN,
			String search) {
		ArrayList<Student_dto_박건일> dtos = new ArrayList<>();
		String query = "select syear, sclass, no, name, kor, eng, mat\r\n" + "from 박건일_student\r\n";

		if (selectYear.equals("all")) {
			if (selectClass.equals("all")) {
				if (selectNN.equals("no")) {
					query += "where no like '%" + search + "%'\r\n";
				} else {
					query += "where name like '%" + search + "%'\r\n";
				}
			} else {
				query += "where sclass ='" + selectClass + "'\r\n";
				if (selectNN.equals("no")) {
					query += "and no like '%" + search + "%'\r\n";
				} else {
					query += "and name like '%" + search + "%'\r\n";
				}
			}
		} else {
			query += "where syear ='" + selectYear + "'\r\n";
			if (selectClass.equals("all")) {
				if (selectNN.equals("no")) {
					query += "and no like '%" + search + "%'\r\n";
				} else {
					query += "and name like '%" + search + "%'\r\n";
				}
			} else {
				query += "and sclass ='" + selectClass + "'\r\n";
				if (selectNN.equals("no")) {
					query += "and no like '%" + search + "%'\r\n";
				} else {
					query += "and name like '%" + search + "%'\r\n";
				}
			}
		}

		query += "order by syear,sclass,to_number(no)";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String sYear = rs.getString(1);
				String sClass = rs.getString(2);
				String no = rs.getString(3);
				String name = rs.getString(4);
				int kor = rs.getInt(5);
				int eng = rs.getInt(6);
				int mat = rs.getInt(7);

				Student_dto_박건일 dto = new Student_dto_박건일(sYear, sClass, no, name, kor, eng, mat);
				dtos.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}

		return dtos;
	}

}
