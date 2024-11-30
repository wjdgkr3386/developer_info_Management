package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface DevService {

	
	int checkJumin(DevDTO devDTO);
	
	int insertDev(DevDTO devDTO);
	
	Map<String,Object> getDev(String developer_no);
	
	int devUpdate(DevDTO devDTO);
	
	int deleteDev(DevDTO devDTO);
}
