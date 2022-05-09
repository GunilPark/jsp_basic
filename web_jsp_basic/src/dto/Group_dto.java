package dto;

public class Group_dto {
	private String id, name, reg_date;
	private int age;
	public Group_dto(String id, String name,  int age, String reg_date) {
		this.id = id;
		this.name = name;
		this.reg_date = reg_date;
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
