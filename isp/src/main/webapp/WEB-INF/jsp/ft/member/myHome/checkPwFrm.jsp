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
	               	 	<strong style="width: 128px;">비밀번호</strong><input type="password" id="mePw" name="mePw" class="text">
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

$("#mePw").keydown(function(e){
	 if (e.keyCode == 13) { 
		 fncPageBoard("update", "checkPw.do");
	 }
	 return true;
});
</script>




