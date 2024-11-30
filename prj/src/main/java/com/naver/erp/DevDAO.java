package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DevDAO {

	int checkJumin(DevDTO devDTO);
	
	int insertDev(DevDTO devDTO);

	int insertDevSkill(DevDTO devDTO);

	
	List<Map<String,String>>  search(SearchDTO searchDTO);
	int searchResultCount(SearchDTO searchDTO);
	
	
	int  devAllCount();
	
	Map<String,Object> getDev(String jumin_no);
	List<String> getDevSkill(String jumin_no);


	int devUpdate(DevDTO devDTO);
	int deleteDevSkill(DevDTO devDTO);
	
	int deleteDev(DevDTO devDTO);
}

