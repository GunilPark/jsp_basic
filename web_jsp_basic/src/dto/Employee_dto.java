package dto;

public class Employee_dto {

	private String id, name, depart, rank, entry_date;

	public Employee_dto(String id, String name, String depart, String rank, String entry_date) {
		this.id = id;
		this.name = name;
		this.depart = depart;
		this.rank = rank;
		this.entry_date = entry_date;
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

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getEntry_date() {
		return entry_date;
	}

	public void setEntry_date(String entry_date) {
		this.entry_date = entry_date;
	}
	
}
