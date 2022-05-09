package dto;

public class Member_dto {
	public Member_dto(String name, String area, int age) {
		this.name = name;
		this.area = area;
		this.age = age;
	}
	String name,area;
	int age;
	public String getName() {
		return name;
	}
	public String getArea() {
		return area;
	}
	public int getAge() {
		return age;
	}

	
}

	