<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<form name="defaultFrm" id="defaultFrm" method="post"> 
	<input type="hidden" name="pass" id="pass" value="NO">
		<div class="join_wrap">
		    <div class="join_form">
		        <div class="terms_box">   
		            <div class="all_check js-all-check">
		                <span class="checkboxs">
		                    <input type="checkbox" name="" id="check_all" />
		                    <label for="check_all">전체동의</label>
		                </span>
		                <div>
		           		    2011년 7월부터 웹사이트 가입 조건인 개인정보의 제3자 제공에 동의하지 않더라도 회원가입을 할 수 있게 되었습니다.
							정보통신망법에 따르면 온라인 사업자는 개인정보 제3자 제공 동의, 개인정보 취급 위탁 동의를 개인정보 수집ㆍ이용 동의와 구분해서 받아야 합니다. 또한, 서비스 제공에 필수적이지 않은 개인정보의 제3자 제공(위탁)에는 동의하지 않아도 회원가입이 가능하도록 규정하고 있습니다. 즉, 서비스 제공에 반드시 필요하지 않은 개인정보 활용 동의에 대해서는 이용자가 선택할 수 있도록 자기정보 통제권을 강화한 것입니다.
		                </div>
		            </div> 
		        </div>
		    </div>
		    <div class="join_btns">
		        <a href="javascript:void(0)" onclick="agree();" class="btn btn_big btn_join">동의</a>
		        <a href="/ft/main/main.do" class="btn btn_big btn_cancel">취소</a>
		    </div>
		</div>   
</form>
     
<script> 
function agree(){
	if(!$("#check_all").prop("checked")){
		alert("약관에 동의해 주시기 바랍니다.");
		$("#pass").val("NO");
		return false;
	}else{
		$("#pass").val("YES");
	}
	
	fncPageBoard('view', '/ft/member/join/joinFrm.do');
	return true
}
</script>





