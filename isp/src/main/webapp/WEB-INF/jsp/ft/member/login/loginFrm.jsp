<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

        
	<form name="defaultFrm" id="defaultFrm" method="post">
		<div class="login2_wrap">
		    <h1>LOGIN</h1>   
		    <div class="login2_box">
		        <div class="login2">
		            <fieldset>  
		                <legend>로그인폼</legend>
		                <div class="login2_input"> 
		                    <ul>
		                        <li><input type="text" title="아이디를 입력하세요" placeholder="아이디" name="meId" id="meId" class="text" /></li>
		                        <li><input type="password" title="비밀번호를 입력하세요" placeholder="비밀번호" name="mePw" id="mePw" class="text" /></li>
		                    </ul>   
		                    <button type="button" class="btn_login2" onclick="login();">로그인</button>     
		                </div>   
		            </fieldset>  
		            <div class="login2_link">
		                <ul>
		                    <li>아직 회원이 아니신가요? <a href="/ft/member/join/agreeFrm.do" class="btn_link">회원가입</a></li>
		                    <li>아이디 또는 비밀번호를 분실하셨나요? <a href="/ft/member/find/findFrm.do" class="btn_link">아이디/비밀번호 찾기</a></li>
		                </ul>
		            </div>
		        </div>
		    </div>    
		</div> 
	 </form>                
                
                 
                  
<script>  

var regExp = /^[a-z0-9_]{4,20}$/;

function login(){        
	
	if($("#meId").val() == null || $("#meId").val() == ""){
		checkMsg("#meId", "아이디를 입력해주세요.");
		return false;
	}
	if($("#mePw").val() == null || $("#mePw").val() == ""){
		checkMsg("#mePw", "비밀번호를 입력해주세요.");
		return false;
	}      
	if(!regExp.test($("#meId").val())){
		checkMsg("#meId", "문자, 숫자 최소 4자 이상 입력하세요.");
		return false;
	}
	if(!regExp.test($("#mePw").val())){
		checkMsg("#mePw", "최소 4자 이상 입력하세요.");
		return false;
	}
	
	fncPageBoard("update", "loginProcess.do");
	return true;
}

</script>