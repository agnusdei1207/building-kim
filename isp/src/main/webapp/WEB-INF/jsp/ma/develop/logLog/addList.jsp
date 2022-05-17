<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- tbl --%>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i> <span> 전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<c:if test="${searchVO.schEtc03 eq '4' }">
		<div class="tbl_right"> 
			<a href="javascript:void(0)" class="btn btn_sml btn_save" onclick="fncPageBoard('view', 'resetFailCnt.do')">실패횟수 초기화</a>
		</div>   
	</c:if>         
</div>     
                     
<c:if test="${searchVO.schEtc03 ne '4' }">
	<div class="tbl_wrap">   
		<table class="tbl_col_type01 no_hover" id="fixTable">
			<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
			<colgroup>
				<col style="width:5%;"> 
			<c:if test="${searchVO.schEtc03 ne '3' }">
				<col style="width:10%;">
				<col style="width:10%;">       
	            <col style="width:10%;">
	            <col style="width:20%;"> 
            </c:if>  
	            <col style="width:${searchVO.schEtc03 eq '3' ? '30%;':'15%;'}">
	            <col>
	            <c:if test="${searchVO.schEtc03 eq '2' }">
	            	<col style="width:8%;">
	            </c:if>
			</colgroup>
			<thead>  
				<tr>   
					<th scope="col">번호</th> 
				<c:if test="${searchVO.schEtc03 ne '3' }"> 
					<th scope="col">구분</th> 
					<th scope="col">ID</th>    
	                <th scope="col">${searchVO.schEtc03 ne '2' ? '접근 메뉴' :  searchVO.schEtc03 eq '2' ? '이름' : '접근 메뉴'}</th>  
	                <th scope="col">${searchVO.schEtc03 ne '2' ? 'URL' :  searchVO.schEtc03 eq '2' ? '시간' : 'URL'}</th>
				</c:if> 
	                <th scope="col">${searchVO.schEtc03 eq '1' or searchVO.schEtc03 eq '3' ? '접속시간':'최근 로그인'}</th>
					<th scope="col">클라이언트IP</th>
				<c:if test="${searchVO.schEtc03 eq '2' }">
					<th scope="col">접속횟수</th>
				</c:if>
				</tr>  
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(resultList) gt 0}">   
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr> 
								<td>${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}</td>
							<c:if test="${searchVO.schEtc03 ne '3' }">
								<td>${result.logDivn eq 'ft' ? '사용자' : '관리자' }</td>    
								<td>${result.logId }</td>  
								<td>${searchVO.schEtc03 ne '2' ? result.logMenuCd : searchVO.schEtc03 eq '2' ? result.logId : result.logMenuCd}</td>   
								<td>${searchVO.schEtc03 ne '2' ? result.logUrl : searchVO.schEtc03 eq '2' ? result.maxLogDt : result.logUrl}</td> 
							</c:if> 
								<td>${result.logDt }</td>
								<td>${result.logClientIp }</td>
								<c:if test="${searchVO.schEtc03 eq '2' }">
									<td><fmt:formatNumber value="${result.logCnt }" pattern="#,###"/></td>
								</c:if> 
							</tr>
						</c:forEach>   
					</c:when>  
					<c:otherwise>  
						<tr>
							<td colspan="${searchVO.schEtc03 eq '2' ? '8': searchVO.schEtc03 eq '3' ? '3': '7'}" class="no_data">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</c:if>

<c:if test="${searchVO.schEtc03 eq '4' }">
	<div class="tbl_wrap">
		<table class="tbl_col_type01 no_hover" id="fixTable">
			<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
			<colgroup>
				<col style="width:3%;">  
				<col style="width:5%;">
				<col style="width:10%;">  
				<col style="width:10%;">
	            <col style="width:20%;">  
	            <col style="width:15%;">  
	            <col style="width:8%;">        
			</colgroup>            
			<thead>       
				<tr>       
					<th scope="col"><input type="checkbox" onclick="allCheck();" id="all_checkbox"></th>
					<th scope="col">번호</th>
					<th scope="col">구분</th>
					<th scope="col">ID</th>
	                <th scope="col">최근 로그인</th>   
					<th scope="col">최근 접속 IP</th> 
					<th scope="col">로그인 실패 횟수</th> 
				</tr>          
			</thead>    
			<tbody>                       
				<c:choose>  
					<c:when test="${fn:length(resultList) gt 0}">  
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>         
								<td><input type="checkbox" name="col2" onclick="oneCheck(this, '${result.logDivn}_${result.logId }');" id="${result.logDivn}_${result.logId }" value="${result.logDivn}_${result.logId }" class="checkbox"></td>
								<td>${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}</td>
								<td>${result.logDivn eq 'ma' ? '관리자' : '사용자'}</td>
								<td>${result.logId }</td>
								<td>${result.logDt }</td>
								<td>${result.logClientIp }</td>  
								<td><fmt:formatNumber value="${result.failCnt }" pattern="#,###"/></td>
							</tr>
						</c:forEach>
					</c:when>     
					<c:otherwise>    
						<tr>
							<td colspan="7" class="no_data">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>   
			</tbody>
		</table>
	</div>
</c:if>
<%-- //tbl --%>   

<%-- paging --%>
<div class="paging_wrap"> 
   <div class="paging">
        <div class="paging"><ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" /></div>
    </div>  
</div>
<%-- //paging --%> 


<script> 
 
var chk_arr = [];
  
$(function(){
	
	if($("#all_checkbox").is(":checked")){
		$(".checkbox").prop("checked",true);
	}else{ 
		$(".checkbox").prop("checked",false);
	}  
	   
	chk_arr = Array.from(new Set($("#col1").val().split(",")));
	
	for(var i = 0; i < chk_arr.length; i++){
		$("#"+chk_arr[i]).prop("checked", true);
	} 
	       
	if($(".checkbox").prop("checked")){
		$("#all_checkbox").prop("checked", true);
	}
})         
              
function allCheck(){   
	if($("#all_checkbox").is(":checked")){   
		$(".checkbox").prop("checked",true);
		$(".checkbox").each(function(){ 
			if(!$("#col1").val().indexOf(this.value) != -1){
		        chk_arr.push(this.value);    
			}                
	   });             
		
	}else{
		$(".checkbox").prop("checked",false);  
		$(".checkbox").each(function(){ 
			if(chk_arr.indexOf(this.value) != -1){
				chk_arr.splice(chk_arr.indexOf(this.value),1);  
			}   
		});  
	}        
	       
	chk_arr = Array.from(new Set(chk_arr));
	$("#col1").val(chk_arr);   
}     
           
                
function oneCheck(e, gooboon){      
	var total = $(".checkbox").length;
	var checked = $("input[class=checkbox]:checked").length;
	 
	if($("#"+gooboon).is(":checked")){
		chk_arr.push($(e).val());    
	}else{        
		if(chk_arr.indexOf($(e).val()) != -1){
			chk_arr.splice(chk_arr.indexOf($(e).val()),1);  
		}
	} 
	 
	if(total != checked){     
		$("#all_checkbox").prop("checked",false);
	}else{
		$("#all_checkbox").prop("checked",true);
	}
	    
	$("#col1").val(chk_arr);
} 


</script>
