package model;

public class Student {
	private String name;
	private String pin;
	private String email;
	private String branch;
	private int year;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public Student(String name, String pin, String email, String branch, int year) {
		super();
		this.name = name;
		this.pin = pin;
		this.email = email;
		this.branch = branch;
		this.year = year;
	}
	
}