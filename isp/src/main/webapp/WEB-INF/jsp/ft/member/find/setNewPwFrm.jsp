<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

 

<form name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="meId" value="${searchVO.meId }">
	<div>
	    <div class="pw_box">      
	        <div class="pw_bg">
	            <i><img src="http://opennote.co.kr/guide/images/sample/bg_pw.png" alt=""></i>  
	        </div>
	        <div class="pw_info">  
	            <p class="pw_txt">새로운 <span class="color_blue">비밀번호</span>를 설정합니다.</p>
	            <ul class="pw_set">
	                <li>
	                	<strong>아이디</strong> 
	                	${searchVO.meId }
	                </li>  
	                <li>
	                	<strong>새 비밀번호</strong> <input type="password" id="mePw_1" name="mePw" class="text">
	                </li>
	                <li>
	                    <strong>새 비밀번호 확인</strong>
	                    <input type="password" id="mePw_2" class="text">
	                </li>  
	            </ul>
	            <div class="btn_area"><a href="javascript:void(0)" onclick="updateNewPw();" class="btn btn_confirm">확인</a></div>
	        </div>
	    </div>
	</div>
</form>

<script>

var regExp = /^[a-z0-9_]{4,20}$/;  
 
function updateNewPw(){
	
	if($("#mePw_1").val() == "" || $("#mePw_2").val() == ""){
		checkMsg("#mePw_1", "비밀번호를 입력해주세요.");
		checkMsg("#mePw_2", "비밀번호를 입력해주세요.");
		return false;
	}   
	if($("#mePw_1").val() != $("#mePw_2").val()){
		checkMsg("#mePw_1", "비밀번호가 서로 다릅니다.");
		checkMsg("#mePw_2", "비밀번호가 서로 다릅니다.");
		return false; 
	}   
	if(!regExp.test($("#mePw_1").val()) || !regExp.test($("#mePw_2").val()) ){
		checkMsg("#mePw_1", "문자, 숫자 최소 4자 이상 입력하세요.");
		checkMsg("#mePw_2", "문자, 숫자 최소 4자 이상 입력하세요.");
		return false;
	}
	
	fncPageBoard("update", "updateNewPw.do");
	return true;
	

}
</script>




