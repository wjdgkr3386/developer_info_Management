package com.naver.erp;

import java.util.HashMap;
import java.util.Map;

public class Util {

	public static Map<String,Integer> getPagingMap( int searchResultCount, int rowCnt, int selectPageNo ) {
		Map<String,Integer> pagingMap = new HashMap<String,Integer>();
		try {
			//if(searchResultCount<1) 	{ searchResultCount=0; }	//검색결과개수
			if(rowCnt<=0)						{ rowCnt=10; }					//행보기
			if(selectPageNo<=0)			{ selectPageNo=1; }			//선택페이지번호

			int pageNoCntPerPage=10;			//한번에 보여줄 페이지의 개수
			int last_pageNo=0;						//페이징전체번호
			int remainder=0;							//마지막페이지에 행의 개수
			
			if(searchResultCount==0) {
				//---------------------------------------------------------------------------------
				pagingMap.put("searchResultCount", searchResultCount);
				pagingMap.put("rowCnt", rowCnt);
				pagingMap.put("selectPageNo", selectPageNo);
				//---------------------------------------------------------------------------------
				pagingMap.put("pageNoCntPerPage", pageNoCntPerPage);
				pagingMap.put("last_pageNo", last_pageNo);
				pagingMap.put("remainder", remainder);
				//---------------------------------------------------------------------------------
				pagingMap.put("begin_rowNo", 0);
				pagingMap.put("end_rowNo", 0);
				pagingMap.put("begin_pageNo", 0);
				pagingMap.put("end_pageNo", 0);
				//---------------------------------------------------------------------------------
				pagingMap.put("serialNo_asc", 0);
				pagingMap.put("serialNo_desc", 0 );
				//---------------------------------------------------------------------------------
				return pagingMap;
				
			}
				last_pageNo = searchResultCount/rowCnt;
				remainder = searchResultCount%rowCnt;
				if(remainder>0) { last_pageNo++; }
				if(last_pageNo<selectPageNo) { selectPageNo = last_pageNo; }
				//-----------------------------------------------------
				int end_rowNo = selectPageNo * rowCnt;
				int begin_rowNo = end_rowNo-rowCnt+1;
					if( end_rowNo>searchResultCount ) { end_rowNo = searchResultCount; }
				//-----------------------------------------------------
				int begin_pageNo = (int)Math.floor(  (selectPageNo-1)/pageNoCntPerPage  )*pageNoCntPerPage + 1;
				int end_pageNo = begin_pageNo + pageNoCntPerPage - 1;
					if( end_pageNo>last_pageNo ) { end_pageNo = last_pageNo; }
				//---------------------------------------------------------------------------------
				pagingMap.put("searchResultCount", searchResultCount);
				pagingMap.put("rowCnt", rowCnt);
				pagingMap.put("selectPageNo", selectPageNo);
				//---------------------------------------------------------------------------------
				pagingMap.put("pageNoCntPerPage", pageNoCntPerPage);
				pagingMap.put("last_pageNo", last_pageNo);
				pagingMap.put("remainder", remainder);
				//---------------------------------------------------------------------------------
				pagingMap.put("begin_rowNo", begin_rowNo);
				pagingMap.put("end_rowNo", end_rowNo);
				pagingMap.put("begin_pageNo", begin_pageNo);
				pagingMap.put("end_pageNo", end_pageNo);
				//---------------------------------------------------------------------------------
				pagingMap.put("serialNo_asc", begin_rowNo);
				pagingMap.put("serialNo_desc", searchResultCount-begin_rowNo+1 );
				//---------------------------------------------------------------------------------
				return pagingMap;
				
			
		}catch(Exception ex){
			return new HashMap<String,Integer>();
		}
		
	}
	
}
