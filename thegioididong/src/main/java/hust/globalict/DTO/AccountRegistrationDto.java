package hust.globalict.DTO;

public class AccountRegistrationDto {
	private String first_name;
    private String last_name;
    private String phone;
    private String email;
    private String street;
    private String cỉty;
    private String user_name;
    private String password;
	public AccountRegistrationDto(String first_name, String last_name, String phone, String email, String street,
			String cỉty, String user_name, String password) {
		this.first_name = first_name;
		this.last_name = last_name;
		this.phone = phone;
		this.email = email;
		this.street = street;
		this.cỉty = cỉty;
		this.user_name = user_name;
		this.password = password;
	}
	public AccountRegistrationDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCỉty() {
		return cỉty;
	}
	public void setCỉty(String cỉty) {
		this.cỉty = cỉty;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
    
}