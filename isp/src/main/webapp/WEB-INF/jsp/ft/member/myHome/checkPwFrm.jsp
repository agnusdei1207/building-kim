<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<form name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="meId" value="${memberVO.meId }">
	<div>
	    <div class="pw_box">  
	        <div class="pw_bg">  
	            <i><img src="http://opennote.co.kr/guide/images/sample/bg_pw.png" alt=""></i>  
	        </div>  
	        <div class="pw_info"> 
	            <p class="pw_txt">마이홈 입장을 위해 <span class="color_blue">비밀번호</span>를 입력해 주세요.</p>
	            <ul class="pw_set">
	                <li> 
	                	<strong>아이디</strong> 
	                	${memberVO.meId }
	                </li>
	               	 <li>
	               	 	<strong>비밀번호</strong> <input type="password" id="mePw" name="mePw" class="text">
	                </li>  
	            </ul>  
	            <div class="btn_area"><a href="javascript:void(0)" onclick="checkPw();" class="btn btn_confirm">확인</a></div>
	        </div>
	    </div>
	</div> 
</form>        
    
<script>
  
var regExp = /^[a-z0-9_]{4,20}$/;  
 
function checkPw(){
	
	if( $("#mePw").val() == null || $("#mePw").val() == ""){
		checkMsg("#mePw_1", "비밀번호를 입력해주세요.");
		return false;
	}   
	if(!regExp.test($("#mePw").val())){
		checkMsg("#mePw", "문자, 숫자 최소 4자 이상 입력하세요.");
		return false;
	}  
	 
	fncPageBoard("update", "checkPw.do");
	return true;
	
}
</script>




