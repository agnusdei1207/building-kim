<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<form name="defaultFrm" id="defaultFrm" method="post">
	<div class="find_box clear">
	        <div class="find_id">
	            <h2>아이디찾기</h2>
	            <ul class="find">
	                <li><span class="i_name">성명</span><input type="text" class="text" id="meName_1" maxlength="7" placeholder="이름" /></li>
	                <li><span class="i_phone">휴대폰번호</span><input type="text" class="text " id="meHp_1" maxlength="11"  placeholder="휴대폰번호(-없이 입력하세요)" /></li>
	                <li class="last"><button type="button" onclick="findId();" class="btn_find">찾기</button></li>
	            </ul>
	        </div>
	        <div class="find_pdw">     
	            <h2>비밀번호 찾기</h2>
	            <ul class="find"> 
	                <li><span class="i_name">성명</span><input type="text" class="text "  name="meId" id="meId" maxlength="15" placeholder="아이디" /></li>
	                <li><span class="i_mail">메일</span><input type="text" class="text " name="meName" id="meName" maxlength="7"  placeholder="이름" /></li>
	                <li><span class="i_phone">휴대폰번호</span><input type="text" class="text "  name="meHp" id="meHp" maxlength="11" placeholder="휴대폰번호(-없이 입력하세요)" /></li>
	                <li class="last"><button type="button" onclick="findPw()" class="btn_find">찾기</button></li>
	            </ul>
	        </div>    
	    </div>  
   </form>
    
<script>

function findId(){
	
	if($("#meName_1").val() == null || $("#meName_1").val() == ""){
		checkMsg("#meName_1", "이름을 입력해주세요.");
		return false;
	}
	if($("#meHp_1").val() == null || $("#meHp_1").val() == ""){
		checkMsg("#meHp_1", "번호를 입력해주세요.");
		return false;
	}
	
	$.ajax({      
		method : "POST",
		url : "findId.do",
		data : {"meName" : $("#meName_1").val(), "meHp" : $("#meHp_1").val()},
		dataType : "JSON",   
		success: function(data){ 
			if(data.result != ''){ 
				alert("당신의 아이디는  '" + data.result + "'  입니다.");
				return false;
			}else{
				alert("아이디를 찾을 수 없습니다.");
				return true;
			}
		}
		
	})
}


function findPw(){
	
	if($("#meId").val() == null || $("#meId").val() == ""){
		checkMsg("#meId", "아이디를 입력해주세요.");
		return false;
	}
	if($("#meName").val() == null || $("#meName").val() == ""){
		checkMsg("#meName", "이름을 입력해주세요.");
		return false;
	}
	if($("#meHp").val() == null || $("#meHp").val() == ""){
		checkMsg("#meHp", "번호를 입력해주세요.");
		return false;
	}
	  
	     
	$.ajax({     
		method : "POST",   
		url : "findPw.do",
		data : {"meName" : $("#meName").val(), "meHp" : $("#meHp").val(), "meId" : $("#meId").val()},
		dataType : "JSON",   
		success: function(data){  
			if(data.result != ''){    
				alert("비밀번호 설정 페이지로 이동합니다.");
				fncPageBoard("update", 'setNewPwFrm.do');
				return false; 
			}else{
				alert("일치하는 정보를 찾을 수 없습니다.");
				return true;
			}
		}
		
	})
}

</script>
   
   
   
   
   
   