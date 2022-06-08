<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.popPageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>      
</div>     
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption> 
		<colgroup> 
			<col style="width:5%"> 
			<col style="width:10%">     
			<col style="width:10%">  
			<col>  
		</colgroup> 
		<thead>     
			<tr>            
				<th scope="col"><input type="checkbox" onclick="allCheck(this);" id="all_check"></th>
				<th scope="col">이름</th>  
				<th scope="col">아이디</th> 
				<th scope="col">이메일</th>    
			</tr> 
		</thead>
		<tbody>          
			<c:choose>   
				<c:when test="${fn:length(resultList) gt 0}">     
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">  
							<td>                          
								<input type="checkbox" onclick="oneCheck('${result.userDivn }', '${result.emUserSeq}');" name="arr" id="${result.userDivn }_${result.emUserSeq}" class="checkbox" value="${result.userDivn }_${result.emUserSeq}_${result.emId}_${result.emMail}">
							</td>        
							<td>${result.emName }</td>   
							<td>${result.emId }</td>
							<td>${result.emMail }</td>    
						</tr>  
					</c:forEach>      
				</c:when>   
				<c:otherwise>      
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose> 
		</tbody>
	</table>   
</div>    
<%-- ,tbl end --%>       
<%-- paging start --%>    
<div class="paging_wrap">      
	<div class="paging">        
		<ui:pagination paginationInfo="${paginationInfo}" type="pop" jsFunction="fncPageEtc" />  
	</div> 
	<div class="btn_right">          
		<a class="btn btn_mdl btn_save" onclick="fncChoose();">선택</a>
	</div>    
</div>     
<%-- ,paging end--%>    
    
<script type="text/javascript">    
              
function allCheck(obj){                 
	if(obj["checked"]){      
		$(".checkbox").each(function(){
			 $("#"+this.id).prop("checked", true);      
			 checked.add(this.value); 
		});       
	}else if(!obj["checked"]){           
		$(".checkbox").each(function(){
			 $("#"+this.id).prop("checked", false);    
			 checked.delete(this.value);      
		});                 
	}                             
	alert("전체 체크 클릭 상태 : " + checked.size);    
}	        
 
function oneCheck(divn, seq){
	 
}


</script>