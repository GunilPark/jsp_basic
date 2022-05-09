package dto;

public class Animal_dto {
	
	private String no, kind, name, date;
	private int age, weight, height;
	public Animal_dto(String no, String kind, String name, int age, int weight, int height, String date) {
		super();
		this.no = no;
		this.kind = kind;
		this.name = name;
		this.date = date;
		this.age = age;
		this.weight = weight;
		this.height = height;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}

	
	

	
	
}
