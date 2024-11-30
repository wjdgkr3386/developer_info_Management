<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<title>사원 정보 등록</title>
<script>
	
	
	$(function(){init();});
	
	function init(){		
		$("[name='id']").val("김정학");
		$("[name='jumin1']").val("970706");
		$("[name='jumin2']").val("1411518");
		$("[name='religion']").val("1");
		$("[name='education'][value='2']").prop("checked", true);
	    const defaultSkills = ["1", "2"];
	    defaultSkills.forEach(skill => {
	        $("[name='skill'][value='" + skill + "']").prop("checked", true);
	    });
	    $("[name='graduateYear']").val("2020");
	    $("[name='graduateMonth']").val("06");
	    $("[name='graduateDay']").val("15");
	}
	
	function saveBtn(){
		if(checkContent()==false){ return; }
		ajax(
				"/inputProc.do"
				,"post"
				,$("[name='inputForm']")
				,function(responseJson){
					var devRegCnt = responseJson["devRegCnt"];
					if(devRegCnt==-10){ alert("주민번호가 중복되었습니다."); return; }
					if(devRegCnt>=1){
						alert("등록 성공");
						goSearch();
					}else{
						alert("등록 실패");
					}
				}
		)
	}
	
	function InitBtn(){
		var obj = $("[name='inputForm']");
		obj.find("[name='id']").val("");
		obj.find("[name='jumin1']").val("");
		obj.find("[name='jumin2']").val("");
		obj.find("[name='religion']").val("");
		obj.find("[name='education']").attr("checked", false);
		obj.find("[name='skill']").attr("checked", false);
		obj.find("[name='graduateYear']").val("");
		obj.find("[name='graduateMonth']").val("");
		obj.find("[name='graduateDay']").val("");
	}


	function checkContent(){//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ유효성 체크함수 시작
		var obj = $("[name='inputForm']");
		var idObj = obj.find("[name='id']");
		var jumin1Obj = obj.find("[name='jumin1']");
		var jumin2Obj = obj.find("[name='jumin2']");
		var religionObj = obj.find("[name='religion']");
		var educationObj = obj.find("[name='education']");
		var skillObj = obj.find("[name='skill']");
		var graduateYearObj = obj.find("[name='graduateYear']");
		var graduateMonthObj = obj.find("[name='graduateMonth']");
		var graduateDayObj = obj.find("[name='graduateDay']");
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		if(idObj.val()==""){ alert("이름을 입력해주세요."); idObj.focus(); return false;}
		if(jumin1Obj.val()==""){ alert("주민번호 앞자리를 입력해주세요."); jumin1Obj.focus(); return false;}
		if(jumin2Obj.val()==""){ alert("주민번호 뒷자리를 입력해주세요."); jumin2Obj.focus(); return false;}
		if(religionObj.val()==""){ alert("종교를 선택해주세요."); religionObj.focus(); return false;}
		if(educationObj.filter(":checked").length==0){ alert("학력을 선택해주세요."); educationObj.focus(); return false;}
		if(skillObj.filter(":checked").length==0){ alert("기술을 선택해주세요."); skillObj.focus(); return false;}
		if(graduateYearObj.val()==""){ alert("년도를 선택해주세요."); graduateYearObj.focus(); return false;}
		if(graduateMonthObj.val()==""){ alert("월을 선택해주세요."); graduateMonthObj.focus(); return false;}
		if(graduateDayObj.val()==""){ alert("일을 선택해주세요."); graduateDayObj.focus(); return false;}
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        if(checkVal(
         		idObj
                 ,"이름을 한글 또는 영어로만 입력해주세요."
                 ,/(^[가-힣]{2,5}$)|(^[a-zA-Z]{3,15}$)/
              )==false){
         		idObj.focus();
                return false;
        }
		{ var xxx = new RegExp( /^[0-9]{6}$/ );
        var ooo = new RegExp( /(^[1-4]{1})([0-9]{6}$)/ );
		if(xxx.test(jumin1Obj.val())==false||ooo.test(jumin2Obj.val())==false){
			alert("주민등록번호를 정확히 입력해주세요.");
			jumin1Obj.focus();
			return false;
		}}
        if(checkChecked(
        		educationObj
                 ,"학력을 선택해주세요."
                 ,1
                 ,1
              )==false){
        	educationObj.focus();
            return false;
        }
        if(checkChecked(
        		skillObj
                 ,"기술을 선택해주세요."
                 ,1
                 ,5
              )==false){
        	skillObj.focus();
            return false;
        }
	}//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ유효성 체크함수 끝
	function goSearch(){
		location.replace('/developer_search_form.do');
	}
</script>
</head>
<body>
<center>
<form name="inputForm">
<table border="1" 
    cellpadding="7" 
    style="border-collapse:collapse"
    bordercolor="#c3c3c3">
    
    <tr>
    	<th colspan="6" class="header">사원 정보 등록</td>
    </tr>
    <tr>
    	<td>이름</td>
    	<td><input type="text" name="id" maxlength="7"></td>
    	<td>주민번호</td>
            <td>
                <input type="text" name="jumin1" maxlength="6"> - 
                <input type="password" name="jumin2" maxlength="7">
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
    		<input type="radio" name="education" value="1">고졸
    		<input type="radio" name="education" value="2">전문대졸
    		<input type="radio" name="education" value="3">일반대졸
    	</td>
    	<td>기술</td>
    	<td colspan="3">
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
            <select name="graduateYear">
                <option value=""></option>
                <c:forEach var="i" begin="1960" end="2023">
					<option value="${i}">${i}</option>
                </c:forEach>
            </select>년
            <select name="graduateMonth">
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
            <select name="graduateDay">
                <option value=""></option>
                <c:forEach var="i" begin="1" end="31">
					<c:choose>
					<c:when test="${i lt 10 }">
							<option value="0${i}">0${i}</option>
					</c:when>
					<c:otherwise>
							<option value="${i}">${i}</option>
					</c:otherwise>
				</c:choose>
                </c:forEach>
            </select>일
    	</td>
    </tr>
</table>
</form>
<div>
	<input type="button" value="등록" onclick="saveBtn()">
	<input type="button" value="초기화" onclick="InitBtn()">
	<input type="button" value="검색화면으로" onclick="goSearch()">
</div>
</center>
</body>
</html>