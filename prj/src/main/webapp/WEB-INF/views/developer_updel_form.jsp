<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>

<script>

$(function(){init();});

function init(){
	var obj = $("[name='updelForm']");
	obj.find("[name='id']").val('${requestScope.devUpdel.DEVELOPER_NAME}');
	obj.find("[name='jumin1']").val('${requestScope.devUpdel.JUMIN_NO}'.substr( 0, 6 ));
	obj.find("[name='jumin2']").val('${requestScope.devUpdel.JUMIN_NO}'.substr( 6, 7 ));
	obj.find("[name='religion']").val(${requestScope.devUpdel.RELIGION_CODE});
	obj.find("[name='education']").eq(${requestScope.devUpdel.SCHOOL_CODE}-1).attr("checked", true);
	var dev_skill = ${requestScope.devUpdel.devSkillList};
	var skill_length = dev_skill.length;
	for(var i=0; i<skill_length; i++)
		obj.find("[name='skill']").eq(dev_skill[i]-1).attr("checked", true);
	obj.find("[name='graduateYear']").val('${requestScope.devUpdel.GRADUATE_DAY}'.substr( 0, 4 ));
	obj.find("[name='graduateMonth']").val('${requestScope.devUpdel.GRADUATE_DAY}'.substr( 4, 2 ));
	obj.find("[name='graduateDay']").val('${requestScope.devUpdel.GRADUATE_DAY}'.substr( 6, 2 ));
}

function updateBtn(){
	if( confirm("정말 수정하시겠습니까?")==false ) { return; }
	
	ajax(
			"/devUpdateProc.do"
			,"post"
			,$("[name='updelForm']")
			,function(responseJson){
				if(responseJson["updelCnt"]==1){
					alert("수정 성공!");
					document.devSearchForm.submit();
				}
				else if(responseJson["updelCnt"]==0)
					alert("수정 실패!");
				else
					alert("수정 실패. 관리자에게 문의 바랍니다.");
			}
	)
}

function deleteBtn(){
	if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
	
	ajax(
			"/devDeleteProc.do"
			,"post"
			,$("[name='updelForm']")
			,function(deleteDevCnt){
				if(deleteDevCnt==1){
					alert("삭제 성공!");
					goSearch();
				}
				else if(deleteDevCnt==0)
					alert("삭제 실패!");
				else
					alert("삭제 실패. 관리자에게 문의 바랍니다.");
			}
	)
}
function goSearch(){
	location.replace('/developer_search_form.do');
}
</script>


</head>
<body>
<form name="updelForm">
    <center>
        <table border="1" 
        cellpadding="7" 
        style="border-collapse:collapse"
        bordercolor="#c3c3c3">
        <tr>
            <th colspan="6" class="header">사원 정보 수정</td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="id"></td>
            <td>주민번호</td>
            <td>
                <input type="text" name="jumin1"> - 
                <input type="password" name="jumin2">
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
    <div>
<div style="height:9px"></div>
        <input type="button" value="수정" onclick="updateBtn()">
        <input type="button" value="삭제" onclick="deleteBtn()">
        <input type="button" value="검색화면으로" onclick="goSearch()">
    </div>
    	<input type="hidden" name="developer_no" value="${requestScope.devUpdel.DEVELOPER_NO}">
    </center>
</form>
<form name="devSearchForm" method="post" action="developer_search_form.do"> 
</form>
</body>
</html>