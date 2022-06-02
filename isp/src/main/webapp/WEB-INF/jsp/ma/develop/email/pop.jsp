<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
   
<%-- content --%>    
<div class="top_title clear">
	<h3 class="tit_page">주소록</h3>
</div>     
                         
<div class="content_box">                               
	<%-- search  --%>       
	<ul class="tab js-tab tab_menu">   
	    <li class="btnP"><a onclick="selectDivn('ft')">사용자</a></li>
	    <li class="btnA"><a onclick="selectDivn('ma')">관리자</a></li>
	</ul>  
	<div class="search_box">             
		<form name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="text" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />      
			<input type="text" name="schEtc01" id="schEtc01" value="${searchVO.schEtc01 }" >
			<%-- 체크 상태 감지를 위한 값 --%>    
			<input type="text" name="col1" id="col1" class="text w100p" />
			<fieldset>  
				<legend>검색</legend>            
				<div class="search_basic"> 
					<strong class="tit">검색구분</strong>   
					<select name="searchCondition" id="searchCondition" title="구분 선택" class="w100"  >  
						<option value="0" >전체</option>
						<option value="1" >이름</option>  
						<option value="2" >이메일</option>
					</select>       
					<input type="text" name="searchKeyword" id="searchKeyword" class="text w40p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" onclick="fncPageBoard('addList','popList.do','1');">검색</button>
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
		$("#searchKeyword").val("");
	}
	     
	fncPageBoard("addList", "popList.do", $("#pageIndex").val());
	   
	$("#searchCondition").on("change", function(){
		fncPageBoard("addList", "popList.do", '1');
	})
	
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
