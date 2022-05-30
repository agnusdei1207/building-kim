<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/jquery-1.11.3.min.js"></script>     
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<link rel="stylesheet" type="text/css" href="/publish/ma/css/style.css">
<link rel="stylesheet" type="text/css" href="/publish/ma/css/jquery-ui-1.12.1.custom.css"/>
   
<%-- content --%> 
<div class="top_title clear">
	<h3 class="tit_page">주소록</h3>
</div>     
          
<div class="content_box">        
	<%-- search  --%>  
	<ul class="tab js-tab tab_menu">
	    <li class="btnP"><a href="javascript:void(0)" onclick="selectDivn('ft')">사용자</a></li>
	    <li class="btnA"><a href="javascript:void(0)" onclick="selectDivn('ma')">관리자</a></li>
	</ul>
	<div class="search_box">   
		<form name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="text" name="pageIndex" id="pageIndex" />
			<input type="text" name="mailSeq" id="mailSeq" >
			<input type="text" name="schEtc01" id="schEtc01" >
			<input type="text" name="mailVal" id="mailVal" />
			<input type="text" name="mailDataName" id="mailDataName" />
			<fieldset> 
				<legend>검색</legend>            
				<div class="search_basic"> 
					<strong class="tit">검색구분</strong>   
					<select name="searchCondition" id="searchCondition" title="구분 선택" class="w100"  >  
						<option value="0" >전체</option>
						<option value="1" >이름</option>  
						<option value="2" >이메일</option>
					</select>   
					<input type="text" name="searchKeyword" id="searchKeyword2" class="text w40p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search3">검색</button>
					</span>
				</div>
			</fieldset>
		</form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div> 
     
<script type="text/javaScript">  

$(function(){
	if($("#schEtc01").val() == null || $("#schEtc01").val() == ""){
		$("#schEtc01").val("ft");
		$(".btnP").addClass("current");
		$("#searchKeyword2").val("");
	}
	fncPageBoard("addList", "popList.do", $("#pageIndex").val());
	
	$("btn_search3").click(function(key){
		if(key.keyCode == 13){   
			fncPageBoard("addList", "popList.do", '1');
		}
	});   
});

<%-- ft/ma 구분 --%>
function selectDivn(num){
	$("#schEtc01").val(num);
	if(num == "ft"){
		$(".btnP").addClass("current");
		$(".btnA").removeClass("current");
	}else{
		$(".btnP").addClass("current");
		$(".btnA").removeClass("current");
	}    
	fncPageBoard("addList", "popList.do", '1');
}
















</script>
