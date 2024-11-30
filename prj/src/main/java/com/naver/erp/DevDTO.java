package com.naver.erp;

import java.util.List;

public class DevDTO {
	
	private int developer_no;				//개발자 번호
	private String id;								//이름
	private String jumin1;						//주민번호앞자리
	private String jumin2;						//주민번호뒷자리
	private String religion;						//종교
	private String education;					//학력
	private List<String> skill;					//기술
	private String graduateYear;				//졸업일년
	private String graduateMonth;			//졸업일월
	private String graduateDay;				//졸업일일

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int getDeveloper_no() {
		return developer_no;
	}
	public void setDeveloper_no(int developer_no) {
		this.developer_no = developer_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public List<String> getSkill() {
		return skill;
	}
	public void setSkill(List<String> skill) {
		this.skill = skill;
	}
	public String getGraduateYear() {
		return graduateYear;
	}
	public void setGraduateYear(String graduateYear) {
		this.graduateYear = graduateYear;
	}
	public String getGraduateMonth() {
		return graduateMonth;
	}
	public void setGraduateMonth(String graduateMonth) {
		this.graduateMonth = graduateMonth;
	}
	public String getGraduateDay() {
		return graduateDay;
	}
	public void setGraduateDay(String graduateDay) {
		this.graduateDay = graduateDay;
	}
	
	
}
