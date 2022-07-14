<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<style>
/* 약관 동의 및 회원 가입 폼  */

* {box-sizing:border-box;}
.btn1 {display: inline-block;font-weight: normal;text-align: center;vertical-align: middle;cursor: pointer;
border:1px solid transparent;
border-color: rgba(0, 0, 0, 0);
white-space: nowrap;
font-size: 12px;
color:#fff;
line-height: 1; 
border-radius: 2px;    
-webkit-user-select: none;
-moz-user-select: none;    
-ms-user-select: none;
user-select: none;}
.btn_big {width:150px;height:50px;line-height:50px;}
.btn_cancel {color:#000;background:#fff;border-color:#000;}
.btn_join {color:#fff;background:#308cde;}
.btn_join2 {color:#fff;background:#308cde;}

.mar_t5 {margin-top: 5px !important;}
.mar_l134 {margin-left: 134px !important;}
    
.btn1 {display: inline-block;font-weight: normal;text-align: center;vertical-align: middle;cursor: pointer;border:1px solid transparent;border-color: rgba(0, 0, 0, 0); white-space: nowrap;font-size: 15px;color:#fff;border-radius: 5px;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}
.btn_area {position: relative;margin-top: 25px;text-align: right;}
.refer {padding-left:21px;color:#666666;background: url(http://opennote.co.kr/guide/images/sample/i_info.png) no-repeat 0 0;font-size:14px;}
 
.pw_box {position:relative;display:table; width:100%;border: 1px solid #e3e3e3;border-top:0;}
.pw_bg {position:relative;display:table-cell;width:498px;padding:70px 0;vertical-align: middle;text-align:center;color:#666;font-size:16px;border-top: 5px solid #cccccc;background:url(http://opennote.co.kr/guide/images/sample/bg_login001.png) repeat-y 100% 0;}
.pw_bg i {display:block;}
.pw_bg p strong {color:#000000;font-size:24px;font-weight:400;}
.pw_info {position:relative;display:table-cell;padding:70px 100px;border-top: 5px solid #0c53c7; width:50%;}
.pw_txt {text-align: center;color:#333;font-size:20px; font-weight:400; line-height:1.5;}
.pw_txt .color_blue {color:#0152fb;vertical-align:baseline;}
.pw_set {margin-top:40px;}
.pw_set li {margin-top:10px;font-size:20px;}             
.pw_set li:first-child {margin-top:0;}
.pw_set li:after {content:'';display:table;clear:both;}
.pw_set strong {width:134px;color:#999999;font-weight:400;font-size:18px;}
.pw_set li .text {height:40px;width:calc(100% - 138px);}
.pw_info .btn_confirm {width: 150px;height: 45px;background: #0c53c7;line-height: 45px;}
.pw_info .btn_cancel {width: 150px;height: 45px;background: #a1a1a1;line-height: 45px;}
</style>
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





