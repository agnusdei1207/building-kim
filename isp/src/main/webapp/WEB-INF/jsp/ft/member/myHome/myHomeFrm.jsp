<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
     
<form name="defaultFrm" id="defaultFrm" method="post"> 
	<div class="join2_wrap">             
	    <div class="join2_form">               
	    <h2>MyHOME</h2>  <div>비밀번호 변경여부    <input type="checkbox" id="check_Box" onclick="checkBox();">
		               		</div>  
	        <ul class="join2 js-join2">  
		            <li>  
		                <div class="input_box">
		                    <span class="i_em">아이디</span><input type="text" readonly style="width:81%;" class="text js-text" value="${memberVO.meId }" maxlength="15" id="meId" name="meId" placeholder="아이디" />
		                </div>
		            </li>
		            <li class="li_pw" style="display:none;">  
		                <div class="input_box">
		                    <span class="i_pw">비밀번호</span><input type="password" class="text js-text"  maxlength="20" id="mePw_1" name="mePw" placeholder="비밀번호(4자리 이상)" />
		                </div>     
		            </li>          
		            <li class="li_pw"  style="display:none;">      
		                <div class="input_box">
		                    <span class="i_pwr">비밀번호확인</span><input type="password" class="text js-text"  maxlength="20" id="mePw_2" placeholder="비밀번호 확인" />
		                </div>
		            </li>
		            <li>
		                <div class="input_box">
		                    <span class="i_nm">이름</span><input type="text" class="text js-text" maxlength="7" value="${memberVO.meName }" id="meName" name="meName" placeholder="이름" />
		                </div>
		            </li>
		            <li class="last">
		                <div class="input_box">
		                    <span class="i_ph">핸드폰번호</span><input type="text" class="text js-text" maxlength="11" value="${memberVO.meHp }" id="meHp" name="meHp" placeholder="휴대폰 번호" />
		                </div>
		            </li> 
		            <li class="last">   
		                <div class="input_box">
		                    <span class="i_ph">이메일</span><input type="text" class="text js-text" maxlength="30" id="meMail" value="${memberVO.meMail }" name="meMail" placeholder="이메일" />
		                </div>
		            </li>
	            </ul>  
		    </div>
	    <div class="join2_btns">
	        <a href="javascript:void(0)" onclick="updateHome();" class="btn btn_big btn_join2">마이홈 업데이트</a>
	        <a href="/ft/main/main.do" class="btn btn_big btn_cancel">취소</a>
	    </div> 
	</div>  
</form>
	   

<script>

var regExp = /^[a-z0-9_]{4,20}$/;
   
function updateHome(){ 
	   
	if($("#check_Box").prop("checked")){	
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
		if(!regExp.test($("#mePw_1").val()) || !regExp.test($("#mePw_2").val())){
			checkMsg("#mePw", "문자, 숫자 최소 4자리를 입력하세요.");
			checkMsg("#mePw_2", "문자, 숫자 최소 4자리를 입력하세요.");
			return false;  
		}   
	}else{     
		$("#mePw_1").val("");
	}  
	
	if($("#meName").val() == null || $("#meName").val() == ""){
		checkMsg("#meName", "이름을 확인하세요.");
		return false;
	}
	if($("#meHp").val() == null || $("#meHp").val() == ""){
		checkMsg("#meHp", "핸드폰 번호를 확인하세요.");
		return false; 
	}
	if($("#meMail").val() == null || $("#meMail").val() == ""){
		checkMsg("#meMail", "메일을 확인하세요.");
		return false;
	}     
	  
	fncPageBoard('update', 'updateMyHomeProess.do');
	return true
}	  
  
  
function checkBox(){
	if($("#check_Box").prop("checked")){
		$(".li_pw").show();
		$("#mePw_1").prop("disabled", false);
		$("#mePw_2").prop("disabled", false);
	}else{
		$(".li_pw").hide();
		$("#mePw_1").prop("disabled", true);
		$("#mePw_2").prop("disabled", true);
		$("#mePw_1").val("");
		$("#mePw_2").val("");
	} 
}        
          
$(function(){
	if($("#check_Box").prop("checked")){
		$(".li_pw").show();
		$("#mePw_1").prop("disabled", false);
		$("#mePw_2").prop("disabled", false);
	}else{       
		$(".li_pw").hide();
		$("#mePw_1").prop("disabled", true);
		$("#mePw_2").prop("disabled", true);
		$("#mePw_1").val("");
		$("#mePw_2").val("");
	}
}) 


</script>



