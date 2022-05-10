<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<form name="defaultFrm" id="defaultFrm" method="post">
	<div class="join_wrap">  
	    <div class="join_form"> 
	    <h2>회원가입</h2>    
	        <ul class="join js-join">
		            <li>   
		                <div class="input_box">
		                    <span class="i_em">아이디</span><input type="text" style="width: 63%;" class="text js-text" maxlength="15" id="meId" name="meId" placeholder="아이디" />
		                    <a href="javascript:void(0)" onclick="duplicateId();" class="btn btn_big btn_join">아이디 중복체크</a>
		                </div>
		            </li>
		            <li>
		                <div class="input_box">
		                    <span class="i_pw">비밀번호</span><input type="password" class="text js-text" maxlength="20" id="mePw_1" name="mePw" placeholder="비밀번호(4자리 이상)" />
		                </div>
		            </li>
		            <li> 
		                <div class="input_box">
		                    <span class="i_pwr">비밀번호확인</span><input type="password" class="text js-text" maxlength="20" id="mePw_2" name="" placeholder="비밀번호 확인" />
		                </div>
		            </li>
		            <li>
		                <div class="input_box">
		                    <span class="i_nm">이름</span><input type="text" class="text js-text" maxlength="7" id="meName" name="meName" placeholder="이름" />
		                </div>
		            </li>
		            <li class="last">
		                <div class="input_box">
		                    <span class="i_ph">핸드폰번호</span><input type="text" class="text js-text" maxlength="11" id="meHp" name="meHp" placeholder="휴대폰 번호" />
		                </div>
		            </li> 
		            <li class="last">   
		                <div class="input_box">
		                    <span class="i_ph">이메일</span><input type="text" class="text js-text" maxlength="30" id="meMail" name="meMail" placeholder="이메일" />
		                </div>
		            </li>
	            </ul>
		    </div>
	    <div class="join_btns">
	        <a href="javascript:void(0)" onclick="join();" class="btn btn_big btn_join">회원가입</a>
	        <a href="/ft/main/main.do" class="btn btn_big btn_cancel">취소</a>
	    </div> 
	</div>
</form>
	 

<script>

var regExp = /^[a-z0-9_]{4,20}$/;
var chk = false;
 
function join(){
	if($("#meId").val() == null || $("#meId").val() == ""){
		checkMsg("#meId", "아이디를 입력해주세요.");
		return false;
	}
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
		checkMsg("#mePw_1", "문자, 숫자 최소 4자이상 입력하세요.");
		checkMsg("#mePw_2", "문자, 숫자 최소 4자이상 입력하세요.");
		return false;    
	}
	if($("#meName").val() == null || $("#meName").val() == ""){
		checkMsg("#meName", "이름을 입력해주세요.");
		return false;
	}
	if($("#meHp").val() == null || $("#meHp").val() == ""){
		checkMsg("#meHp", "핸드폰 번호를 입력해주세요.");
		return false; 
	}
	if($("#meMail").val() == null || $("#meMail").val() == ""){
		checkMsg("#meMail", "메일을 입력해주세요.");
		return false;
	}      
	if(!chk){   
		alert("아이디 중복체크를 해주세요.");    
		return false; 
	} 
	fncPageBoard('update', 'insertProc.do');
	return true
	
}	  
 
$("#meId").on("change", function(){
	chk = false;
})

function duplicateId(){
	
	if($("#meId").val() == null || $("#meId").val() == ""){
		checkMsg("#meId", "아이디를 입력해주세요.");
		return false;  
	}
	
	$.ajax({
		method : "POST",
		url : "duplicateId.do",
		data : {"meId" : $("#meId").val()},
		dataType : "JSON",
		success: function(data){
			if(data.result){
				alert("이미 존재하는 아이디입니다.");
				chk = false;
				return false;
			}else{
				alert("가입 가능한 아이디입니다.");
				chk = true;
				return true;
			}
		}
		
	})
}




</script>



