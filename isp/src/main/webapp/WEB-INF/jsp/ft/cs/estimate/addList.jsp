<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>

<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:5%">
			<col> 
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">상태</th>
				<th scope="col">비밀</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>   
		<tbody>  
			<c:choose>
				<c:when test="${fn:length(resultList) gt 0}">   
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="openModal('${result.eqSeq}', '${result.eqPw }')">
							<td>
								  ${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>   
							<td>    
								<c:choose>   
									<c:when test="${result.eqState eq 'A'}">
										신청
									</c:when>
									<c:when test="${result.eqState eq 'R'}">
										반려
									</c:when>
									<c:when test="${result.eqState eq 'T'}">
										재신청
									</c:when>
									<c:when test="${result.eqState eq 'P'}">
										승인
									</c:when>
									<c:otherwise>
										-    
									</c:otherwise>     
								</c:choose>  
							</td>    
							<td>   
								<c:choose>       
									<c:when test="${not empty result.eqPw }">
										비밀
									</c:when>
									<c:otherwise>        
										공개  
									</c:otherwise>   
								</c:choose>   
							</td>
							<td class="subject text_over l" >${result.eqTitle }</td>
							<td>${not empty result.eqAtchFileId ? '📬' : '📫' }</td>
							<td>${result.eqId }</td>
							<td>${result.eqDt }</td>
						</tr> 
					</c:forEach>      
				</c:when>  
				<c:otherwise>
					<tr><td colspan="7" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody> 
	</table>    
</div>    
<input type="hidden" id="box"> 
<%-- //tbl end --%>
<%-- paging start --%>    
<div class="paging_wrap">  
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>  
</div>
<%-- //paging end--%>
<div class="modal">
  <div class="modal_content"   
       title="클릭하면 창이 닫힙니다.">   
       비밀번호 <br>    
   		<input type="password" id="eqPW" maxlength="4">
   		<a href="javascript:void(0)" onclick="insertPw();" class="btn btn_middle btn_purple" >입력</a> 
			<a href="javascript:void(0)" onclick="closeModal();" class="btn btn_middle btn_red" >닫기</a>
  </div>
</div>      
     
<script>     
function openModal(seq, pw){
	
	if(pw == null || pw == ""){
		fncPageBoard('view','view.do', seq,'eqSeq');
		return true;
	}else{
		$("#box").val(seq);
		$(".modal").fadeIn();
	} 
}

function closeModal(){
	$(".modal").fadeOut(); 
} 

function insertPw(){
	  
	var seq = $("#box").val()
	
	$.ajax({         
		method : "POST",    
		url : "checkPw.do",
		data : {"eqSeq" : seq, "eqPw" : $("#eqPW").val()},
		dataType : "JSON",    
		success: function(data){ 
			if(data.result){  
				alert("비밀번호가 일치하여 게시글로 이동합니다.");
				closeModal();       
				fncPageBoard('view','view.do', seq,'eqSeq');
				return true;
			}else{       
				checkMsg("#eqPW", "비밀번호가 틀렸습니다.");
				$("#eqPW").val("");
				return false;
			}
		}    
	})   
}

function checkMsg(id ,msg){
	var html = '<strong><font color="red">'+msg+'</font></strong>';
	$(id).parent().children("strong").remove();
	$(id).after(html);
	$(id).focus();
	return false; 
}	


</script>

 





