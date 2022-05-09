package dto;

public class Snack_dto {
	
	private String p_code, p_name, m_code, price;

	public Snack_dto(String p_code, String p_name, String m_code, String price) {

		this.p_code = p_code;
		this.p_name = p_name;
		this.m_code = m_code;
		this.price = price;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
	

}
