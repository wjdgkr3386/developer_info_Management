package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DevServiceImpl  implements DevService{
	
	@Autowired
	private DevDAO devDAO;
	

	
	@Override
	public int checkJumin(DevDTO devDTO){
		int checkJuminCnt=0;
		checkJuminCnt = devDAO.checkJumin(devDTO);
		if(checkJuminCnt>0) { checkJuminCnt=-10; return checkJuminCnt; }
		
		return checkJuminCnt;
	}
	
	@Override
	public int insertDev(DevDTO devDTO){
		int RegCnt=0;
		RegCnt = devDAO.insertDev(devDTO);
		devDAO.insertDevSkill(devDTO);

		return RegCnt;
	}
	
	@Override
	public Map<String,Object> getDev(String developer_no) {
		Map<String,Object> devList = this.devDAO.getDev(developer_no);
		List<String> devSkillList = this.devDAO.getDevSkill(developer_no);
		devList.put("devSkillList",devSkillList);
		
		return devList;
	}
	
	@Override
	public int devUpdate(DevDTO devDTO) {
		int re;
		int a = devDAO.devUpdate(devDTO);
		int b = devDAO.deleteDevSkill(devDTO);
		int c = devDAO.insertDevSkill(devDTO);
		if(a>0&&b>0&&c>0)
			re=1;
		else
			re=0;
		return re;
	}
	
	@Override
	public int deleteDev(DevDTO devDTO) {
		int re=0;
		int a = devDAO.deleteDevSkill(devDTO);
		int b = devDAO.deleteDev(devDTO);
		if(a>0&&b>0)
			re=1;
		else
			re=0;
		
		return re;
	}
	
}
