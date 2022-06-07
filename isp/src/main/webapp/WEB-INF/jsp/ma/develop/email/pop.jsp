<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>  


<div class="pop_header">
	<a href="javascript:void(0);" class="pop_close"></a>
</div>
          
<div class="pop_content">
		<%-- search  --%>       
		<ul class="tab js-tab tab_menu">    
		    <li class="cursor current"><a onclick="selectDivn(this,'ft')">사용자</a></li>
		    <li class="cursor"><a onclick="selectDivn(this,'ma')">관리자</a></li>
		</ul>         
		<div class="search_box">                 
			<form name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;"> 
				<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />      
				<input type="hidden" name="schEtc01" id="schEtc01" value="${searchVO.schEtc01 }" />      
				<input type="hidden" name="schEtc03" id="schEtc03" value="${searchVO.schEtc03 }" />      
				<%-- 체크 상태 저장 --%>    
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
	});
	
	return false;
});           
         
<%-- ft/ma 구분 --%>   
function selectDivn(obj,divn){   
	$("#schEtc01").val(divn);
	$(obj).parent('li').siblings().removeClass("current");
	$(obj).parent('li').addClass("current");
	     
	fncPageBoard("addList", "popList.do", '1');  
	return false;
}


</script>
