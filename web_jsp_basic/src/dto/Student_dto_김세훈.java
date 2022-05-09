package dto;

public class Student_dto_김세훈{
	private String sYear, sClass, no, name = "";
	private int kor, eng, mat = 0;
	
	public Student_dto_김세훈(String sYear, String sClass, String no, String name, int kor, int eng, int mat) {
		this.sYear = sYear;
		this.sClass = sClass;
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	public Student_dto_김세훈(String sYear, String sClass, String no, String name) {
		this.sYear = sYear;
		this.sClass = sClass;
		this.no = no;
		this.name = name;
		
	}
	
	
	public Student_dto_김세훈(int kor, int eng, int mat, String name) {
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.name = name;
	}
	

	public String getsYear() {
		return sYear;
	}

	public void setsYear(String sYear) {
		this.sYear = sYear;
	}

	public String getsClass() {
		return sClass;
	}

	public void setsClass(String sClass) {
		this.sClass = sClass;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}
	
	
	
}
