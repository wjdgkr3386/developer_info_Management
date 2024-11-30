package com.naver.erp;

import java.util.List;

public class SearchDTO {
	private String keyword;						//키워드
	private List<String> gender;				//남여
	private String religion;						//종교
	private List<String> education;			//학력
	private List<String> skill;					//기술
	private String graduateYearMin;		//졸업일년최소
	private String graduateMonthMin;	//졸업일월최소
	private String graduateYearMax;		//졸업일년최대
	private String graduateMonthMax;	//졸업일월최대
	
	private int selectPageNo;				//선택한 페이지번호	
	private int rowCnt;						//행보기
	private int begin_rowNo;				//테이블 검색 시 시작행 번호
	private int end_rowNo;					// 테이블 검색 시 끝행 번호
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<String> getGender() {
		return gender;
	}
	public void setGender(List<String> gender) {
		this.gender = gender;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public List<String> getEducation() {
		return education;
	}
	public void setEducation(List<String> education) {
		this.education = education;
	}
	public List<String> getSkill() {
		return skill;
	}
	public void setSkill(List<String> skill) {
		this.skill = skill;
	}
	public String getGraduateYearMin() {
		return graduateYearMin;
	}
	public void setGraduateYearMin(String graduateYearMin) {
		this.graduateYearMin = graduateYearMin;
	}
	public String getGraduateMonthMin() {
		return graduateMonthMin;
	}
	public void setGraduateMonthMin(String graduateMonthMin) {
		this.graduateMonthMin = graduateMonthMin;
	}
	public String getGraduateYearMax() {
		return graduateYearMax;
	}
	public void setGraduateYearMax(String graduateYearMax) {
		this.graduateYearMax = graduateYearMax;
	}
	public String getGraduateMonthMax() {
		return graduateMonthMax;
	}
	public void setGraduateMonthMax(String graduateMonthMax) {
		this.graduateMonthMax = graduateMonthMax;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
	public int getBegin_rowNo() {
		return begin_rowNo;
	}
	public void setBegin_rowNo(int begin_rowNo) {
		this.begin_rowNo = begin_rowNo;
	}
	public int getEnd_rowNo() {
		return end_rowNo;
	}
	public void setEnd_rowNo(int end_rowNo) {
		this.end_rowNo = end_rowNo;
	}
	
	
	
}
