<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

	<!-- board -->
<div class="tbl_wrap">   
	<table class="tbl_col_type01">
		<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption> 
		<colgroup>   
			<col style="width:7%">  
			<col style="width:15%">  
			<col>                    
			<col style="width:15%">       
		</colgroup>      
		<thead>  
			<tr>          
				<th scope="col" class="m_hid">번호</th>     
				<th scope="col">제목</th>   
				<th scope="col">내용</th>             
				<th scope="col">작성일</th>        
			</tr>                        
		</thead>                                  
		<tbody>                
			<c:choose>                       
				<c:when test="${fn:length(resultList) gt 0}">                         
					<c:forEach var="result" items="${resultList}" varStatus="status">              
						<tr class="cursor" onclick="fncView('${result.divn}', '${result.seq }')">
							<td>${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index)}</td>
							<td class="text_over"><c:out value="${result.title }" ></c:out></td>   
							<td class="text_over l" style="padding-left:10px;"><c:out value="${result.cont }"></c:out></td>   
							<td><c:out value="${result.rgstDt }"></c:out></td>     
						</tr> 
					</c:forEach>          
				</c:when>    
				<c:otherwise>        
					<tr class="no_data">
						<td colspan="4">등록된 글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>  
		</tbody>
	</table>
</div>         
	<!-- //board -->           
<!-- paging -->            
<div class="paging_wrap">      
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="tbl_btns c">        
		<a href="javascript:void(0)" class="btn btn_middle btn_purple" onclick="fncSubmit();" style="position:relative;float:right;bottom:3px;cursor:default;">등록</a>
	</div>
</div>      
       
<!-- //paging -->
<script type="text/javaScript">
  
       
     
<%-- view --%>  
function fncView(divn, seq){ 
	
	<%-- SEQ 셋팅 --%>    
	$("#seq").val(seq);       
	$.ajax({    
		method : "POST",                
		url : "view.do",  
		dataType : "HTML",  
		data : $("#defaultFrm").serialize(),    
		success : function(data){
			$("#search_list").html(data); 
			$(".tbl").html("");  
		},
	});
}      
   
<%-- 등록 form 버튼 --%>          
function fncSubmit(){
	$.ajax({  
		method : "POST",              
		url : "insertForm.do",
		dataType : "HTML",  
		data : $("#defaultFrm").serialize(),    
		success : function(data){
			$("#search_list").html(data); 
			$(".tbl").html("");  
		},
	});
}

</script>

