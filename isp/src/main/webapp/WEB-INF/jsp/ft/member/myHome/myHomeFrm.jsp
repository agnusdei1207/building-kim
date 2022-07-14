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
<a href="#search_list" id="scrollDown">아래로</a>   
	<%-- 게시판 구분 --%>                   
	<input type="hidden" name="schEtc02" id="schEtc02" value="${searchVO.schEtc02 }"> 
	<%-- 페이지 인덱스  --%>               
	<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
	<%-- 검색어 --%>    
	<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchVO.searchKeyword }">  
	<%-- 검색 조건 --%>
	<input type="hidden" name="searchCondition" id="searchCondition" value="${searchVO.searchCondition }">  
	<%-- 게시글 seq --%>
	<input type="hidden" name="seq" id="seq">   
	
	<div class="join2_wrap">                         
	    <div class="join2_form">                          
	    <h2>MyHOME</h2>                                  
	    <div>                 
	    	<label class="cursor">                      
	    	<strong style="font-size:15px;">비밀번호 변경</strong>                 
	    	<input type="checkbox" id="check_Box" class="cursor" onclick="checkBox();">                          
	    	</label>           
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
	        <a href="javascript:void(0)" onclick="fncUpdateHome();" class="btn btn_big btn_join2"><strong>수정</strong></a>
	        <a href="/ft/main/main.do" class="btn btn_big btn_cancel"><strong>취소</strong></a>
	    </div>    
	  </div>   
	                           
 <%-- 게시판 --%>                  
	 <div class="content_box">                  
	  	<ul class="lnb">                        
		    <li id="menu" class="active"><a href="javascript:void(0);" onclick="fncClickTap(this); fncMenuTap('free');">자유게시판</a></li>
		    <li id="menu1"><a href="javascript:void(0);" onclick="fncClickTap(this); fncMenuTap('estQst');">견적게시판</a></li> 
		</ul>       
	
	 <div id="search_list">         
		</div>  
		<%-- 붙이는 곳 --%>
	     <div class="tbl">  
	     </div>      
	</div>
</form>    
	   
    
<script>
  
var regExp = /^[a-z0-9_]{4,20}$/; 
     
<%-- 페이지 로드 --%>        
$(function(){            
	
	$("#scrollDown").click();
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
	};         
	                            
	<%-- 선택했던 게시판 종류 기억 --%>  
   	if($("#schEtc02").val() == "estQst"){ 
   		$("#menu1").siblings().removeClass("active");
   		$("#menu1").addClass("active");     
   		fncMenuTap("estQst");   
   		return false;                                  
   	}else if($("#schEtc02").val() == "free" || $("#schEtc02").val() == ""){      
   		$("#menu").siblings().removeClass("active");     
   		$("#men").addClass("active"); 
   		fncMenuTap("free");
   		return false;   
   	};   
	     
	$.ajax({                 
		method : "POST",       
		url : "list.do", 
		dataType : "HTML",
		data : $("#defaultFrm").serialize(),
		success : function(data){    
			$("#search_list").html(data);
		}, 
		
	});  
	return false;
})    
  
<%-- 개인정보 수정 --%>
function fncUpdateHome(){ 
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
  
<%-- 비밀번호 변경 여부 체크 --%>
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
       
<%-- 메뉴 클릭 CSS --%>    
function fncClickTap(obj){      
	$(obj).parent().addClass("active");     
	$(obj).parent().siblings().removeClass("active");
}            
                
<%-- 메뉴 클릭 --%>                                                    
function fncMenuTap(divn){                  
	// 클릭한 메뉴 구분값
	$("#schEtc02").val(divn);                
	$.ajax({              
		method : "POST",          
		url : "list.do",   
		dataType : "HTML",   
		data : $("#defaultFrm").serialize(),
		success : function(data){    
			$("#search_list").html(data);
		}, 
	});  
}    

</script>



