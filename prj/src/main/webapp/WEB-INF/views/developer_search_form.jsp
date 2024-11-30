<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>사원 정보 검색</title>
<script>
$(function(){init();});

function init(){

}

function del_btn(){
	var obj = $("[name='searchForm']");
	obj.find("[name='keyword']").val("");
	obj.find("[name='gender']").attr("checked", false);
	obj.find("[name='religion']").val("");
	obj.find("[name='education']").attr("checked", false);
	obj.find("[name='skill']").attr("checked", false);
	obj.find("[name='graduateYearMin']").val("");
	obj.find("[name='graduateMonthMin']").val("");
	obj.find("[name='graduateYearMax']").val("");
	obj.find("[name='graduateMonthMax']").val("");
}

function pageNoClick( clickPageNo ){
		var formObj = $("[name='searchForm']");
		formObj.find("[name='selectPageNo']").val(clickPageNo);
		search();
	}

function search(){
		var searchObj = $("[name='searchForm']");
		var minStr = searchObj.find("[name='graduateYearMin']").val()+searchObj.find("[name='graduateMonthMin']").val();
		var maxStr = searchObj.find("[name='graduateYearMax']").val()+searchObj.find("[name='graduateMonthMax']").val();
		if(minStr.length==6 && maxStr.length==6 && minStr>maxStr){
			alert("졸업일 최소날짜가 최대날짜보다 작아야합니다.");
			return;
		}
		
		ajax(
				"/developer_search_form.do"
				,"post"
				,searchObj
				,function(responseHtml){
					var obj = $(responseHtml);
					var searchResultCnt = obj.find(".searchResultCnt").html();
					var pageNos = obj.find(".pageNos").html();
					var searchResult = obj.find("[name='searchForm'] .searchResult").html();

					$(".searchResultCnt").html( searchResultCnt );
					$(".pageNos").html( pageNos );
					$(".searchResult").html( searchResult );
					
				}
		)
}

function all_search(){
	del_btn();
	search()
}

function goDevUpdelForm(developer_no){
	$("[name='devUpdelForm'] [name='developer_no']").val(developer_no);
	document.devUpdelForm.submit();
}


</script>

</head>
<body>
<center>
<form name='searchForm'>

<input type="hidden" name="selectPageNo" value="1">
    <table border="1" 
    cellpadding="7" 
    style="border-collapse:collapse"
    bordercolor="#c3c3c3">
	<tr>
		<th colspan="6" class="header">사원 정보 검색</td>
	</tr>
	<tr>
		<td>키워드</td>
		<td><input type="text" name="keyword"></td>
		<td>성별</td>
		<td>
            <input type="checkbox" name="gender" value="남">남
            <input type="checkbox" name="gender" value="여">여
        </td>
		<td>종교</td>
		<td>
            <select name="religion">
	   			<option value=""></option>
	   			<option value="1">기독교</option>
	   			<option value="2">천주교</option>
	   			<option value="3">불교</option>
	   			<option value="4">이슬람</option>
	   			<option value="5">무교</option>
            </select>
        </td>
	</tr>
	<tr>
		<td>학력</td>
		<td>
    		<input type="checkbox" name="education" value="1">고졸
    		<input type="checkbox" name="education" value="2">전문대졸
    		<input type="checkbox" name="education" value="3">일반대졸
        </td>
		<td>기술</td>
		<td colspan="4">
    		<input type="checkbox" name="skill" value="1">Java
    		<input type="checkbox" name="skill" value="2">JSP
    		<input type="checkbox" name="skill" value="3">ASP
    		<input type="checkbox" name="skill" value="4">PHP
    		<input type="checkbox" name="skill" value="5">Delphi
        </td>
	</tr>
	<tr>
		<td>졸업일</td>
		<td colspan="5">
            <select name="graduateYearMin">
                <option value=""></option>
                <c:forEach var="i" begin="1960" end="2023">
                	<option value="${i}">${i}</option>
                </c:forEach>
            </select>년
            <select name="graduateMonthMin">
                <option value=""></option>
                <c:forEach var="i" begin="1" end="12">
					<c:choose>
						<c:when test="${i lt 10 }">
								<option value="0${i}">0${i}</option>
						</c:when>
						<c:otherwise>
								<option value="${i}">${i}</option>
						</c:otherwise>
					</c:choose>
                </c:forEach>
            </select>월
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="graduateYearMax">
                <option value=""></option>
                <c:forEach var="i" begin="1960" end="2023">
					<c:choose>
						<c:when test="${i lt 10 }">
								<option value="0${i}">0${i}</option>
						</c:when>
						<c:otherwise>
								<option value="${i}">${i}</option>
						</c:otherwise>
					</c:choose>
                </c:forEach>
            </select>년
            <select name="graduateMonthMax">
                <option value=""></option>
                <c:forEach var="i" begin="1" end="12">
					<c:choose>
						<c:when test="${i lt 10 }">
								<option value="0${i}">0${i}</option>
						</c:when>
						<c:otherwise>
								<option value="${i}">${i}</option>
						</c:otherwise>
					</c:choose>
                </c:forEach>
            </select>월
        </td>
	</tr>
</table>
<div style="height:9px"></div>
<div>
    <input type="button" value="검색" onclick="search()">
    <input type="button" value="전부검색" onclick="all_search()">
    <input type="button" value="초기화" onclick="del_btn()">
    <input type="button" value="등록" onclick="location.replace('/developer_input_form.do')">
</div>

<div style="height:9px"></div>
    <tr><td colspan="7" style="text-align:right; border:none;"><span class="searchResultCnt">검색건수: ${requestScope.devMap.searchResultCount }개</span>
    		<select name="rowCnt" onChange="search()">
			<option value="10">10
			<option value="15">15
			<option value="20">20
		</select>행보기
    </td>
	</tr>
<div style="height:9px"></div>
<table border="1" 
    cellpadding="7" 
    style="border-collapse:collapse"
    bordercolor="white" class="searchResult">
	    <tr class="header">
	    	<td>번호</td>
	    	<td>이름</td>
	    	<td>성별</td>
	    	<td>종교</td>
	    	<td>기술</td>
	    	<td>졸업일</td>
	    	<td></td>
	    </tr>
	    <c:forEach var="i" items="${requestScope.devMap.devList}" varStatus="vs">
	    <tr>
	    	<td class="result">${vs.index+1}</td>
	    	<td class="result">${i.DEVELOPER_NAME}</td>
	    	<td class="result">${i.GENDER}</td>
	    	<td class="result">${i.RELIGION}</td>
	    	<td class="result">${i.SKILL}</td> 
	    	<td class="result">${i.GRADUATE_DAY}</td>
	    	<td class="result"><input type="button" value="수정/삭제" onclick="goDevUpdelForm(${i.DEVELOPER_NO})"></td>
	    </tr>
	    </c:forEach>
</table>

</form>
		<div class="pageNos"> 
			<span style="cursor:pointer" onClick="pageNoClick(1)">[처음]</span>
			<span style="cursor:pointer" onClick="pageNoClick(${requestScope.devMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


			<c:forEach var="pageNo" begin="${requestScope.devMap.begin_pageNo}" end="${requestScope.devMap.end_pageNo}">
				<c:if test="${requestScope.devMap.selectPageNo==pageNo}">
					${pageNo}
				</c:if>
				<c:if test="${requestScope.devMap.selectPageNo!=pageNo}">
					<span style="cursor:pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
				</c:if>
			</c:forEach>

&nbsp;&nbsp;
			<span style="cursor:pointer" onClick="pageNoClick(${requestScope.devMap.selectPageNo}+1)">[다음]</span>
			<span style="cursor:pointer" onClick="pageNoClick(${requestScope.devMap.last_pageNo})">[마지막]</span>
		</div>

<form name="devUpdelForm" action="/developer_updel_form.do" post="post">
	<input type="hidden" name="developer_no">
</form>




</center>
</body>
</html>