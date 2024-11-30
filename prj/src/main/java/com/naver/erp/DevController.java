package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DevController {
	
	@Autowired
	private DevDAO devDAO;  
	@Autowired
	private DevService devService;
	
	@RequestMapping( value="/developer_search_form.do")
	public ModelAndView devSearchForm(
			SearchDTO searchDTO
			){
		Map<String,Object> devMap = getDevListSearchResultMap(searchDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "developer_search_form.jsp" );
		mav.addObject(   "devMap" , devMap     );
		return mav;
	}
	
	@RequestMapping( value="/developer_updel_form.do" )
	public ModelAndView devUpdelForm( 	
			@RequestParam(value="developer_no") String developer_no
	){
		Map<String,Object> devUpdel = this.devService.getDev(developer_no);
		ModelAndView mav = new ModelAndView( );

		mav.setViewName( "developer_updel_form.jsp");
		mav.addObject("devUpdel", devUpdel);
		return mav;
		
	}

	
	@RequestMapping( value="/developer_input_form.do")
	public ModelAndView devInputForm(
			DevDTO devDTO
			){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "developer_input_form.jsp" );
		return mav;
	}
	
	
	@RequestMapping( 
			value="/inputProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> DevRegProc(
			DevDTO  devDTO
	){
		Map<String,String> responseMap = new HashMap<String,String>();
		int devRegCnt = 0;
		try{
			devRegCnt=this.devService.checkJumin(devDTO);
			if(devRegCnt==-10){
				responseMap.put("devRegCnt" , devRegCnt+"" );
				return responseMap;
			};
			devRegCnt = this.devService.insertDev(devDTO);
		}catch(Exception ex){
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			System.out.println(ex);
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			devRegCnt = -1;
		}
		responseMap.put("devRegCnt" , devRegCnt+"" );
		return responseMap;
	}
	
	private Map<String,Object> getDevListSearchResultMap(SearchDTO searchDTO){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		int searchResultCount = devDAO.searchResultCount(searchDTO);
		int devAllCount = this.devDAO.devAllCount();
		// 여기까지 행개수-> 0개
		Map<String,Integer> pagingMap = Util.getPagingMap( searchResultCount, searchDTO.getRowCnt(), searchDTO.getSelectPageNo() );
		searchDTO.setSelectPageNo(  		  	(int)pagingMap.get("selectPageNo")  );
		searchDTO.setRowCnt( 					(int)pagingMap.get("rowCnt") );
		searchDTO.setBegin_rowNo(   			(int)pagingMap.get("begin_rowNo")   );  // 테이블에서 검색 시 시작행 번호 저장하기
		searchDTO.setEnd_rowNo(			 	(int)pagingMap.get("end_rowNo")     );  // 테이블에서 검색 시 끝행 번호 저장하기
		
		// 여기서부터 행개수가 기본 10개가 된다. 그래서 순서를 잘 줘야함.
		List<Map<String,String>> devList = this.devDAO.search(searchDTO);
		
		resultMap.put(	"devList"							, devList);														//검색결과물
		resultMap.put(	"devAllCount"					, devAllCount);												//db에 저장된 모든행의 개수
		resultMap.put(	"searchResultCount"			, pagingMap.get("searchResultCount"));			//검색결과물의 개수
		resultMap.put(	"rowCnt"							, pagingMap.get("rowCnt"));							//행보기 수
		resultMap.put(	"searchDTO"  					, searchDTO);												//searchDTO 객체

		resultMap.put(	"pageNoCntPerPage"	, pagingMap.get("pageNoCntPerPage"));		//한 화면에 보여줄 페이지번호
		resultMap.put(  "begin_pageNo"				, pagingMap.get("begin_pageNo")        );		//한 화면에 보여줄 시작페이지번호
		resultMap.put(  "end_pageNo"				, pagingMap.get("end_pageNo")          );		//한 화면에 보여줄 끝페이지번호
		resultMap.put(	"selectPageNo"				, pagingMap.get("selectPageNo"));				//선택한페이지번호
		resultMap.put(	"last_pageNo"				, pagingMap.get("last_pageNo"));					//마지막 페이지번호
		resultMap.put(	"remainder"					, pagingMap.get("remainder"));						//마지막 페이지에 보여줄 행의 나머지개수
		resultMap.put(  "begin_serialNo_asc"		, pagingMap.get("begin_serialNo_asc")  );
		resultMap.put(  "begin_serialNo_desc"	, pagingMap.get("begin_serialNo_desc") );
		
		return resultMap;
	}

	@RequestMapping( 
			value="/devUpdateProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,Integer> devUpdateProc( 	
			DevDTO devDTO
	){
		int updelCnt=0;
		updelCnt = devService.devUpdate(devDTO);
		Map<String,Integer> response = new HashMap<String,Integer>();
		
		response.put(   "updelCnt" , updelCnt  );
		return response;
	}
	
	@RequestMapping( 
			value="/devDeleteProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int devDeleteProc(
			DevDTO devDTO
	){
		int deleteDevCnt = this.devService.deleteDev(devDTO);
		
		return deleteDevCnt;
	}

}

