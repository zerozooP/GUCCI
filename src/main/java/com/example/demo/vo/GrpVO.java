package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component
public class GrpVO {
	
	private int num;
	private	String name;
	private	String position;
	private	String office;
	private	int age;
	private	String startdate;
	private	int salary;
	
	public GrpVO() {}
	public GrpVO(int num, String name, String position, String office, int age, String startdate, int salary) {
		super();
		this.num = num;
		this.name = name;
		this.position = position;
		this.office = office;
		this.age = age;
		this.startdate = startdate;
		this.salary = salary;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	
}
