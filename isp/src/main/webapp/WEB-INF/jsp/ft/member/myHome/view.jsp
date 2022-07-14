<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
         
		<input type="hidden" name="id" id="id" value="${memberVO.meId }">     
		<input type="hidden" name="divn" id="divn" value="${searchVO.divn }">                 
		<input type="hidden" name="atchFileId" id="atchFileId" value="${searchVO.atchFileId }">   
		<%-- 페이지 인덱스 --%>   
		<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }">      
		<div class="tbl_wrap">        
			<table class="tbl_row_type01">        
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>  
					<col style="width:20%;">  
					<col style="width:30%;">
					<col style="width:20%;">       
					<col style="width:30%;">
				</colgroup>        
				<tbody>
					<tr>         
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<c:out value="${searchVO.title }" /> 
						</td>
					</tr>
					<tr>        
						<th scope="row"><strong>내용</strong></th>         
						<td colspan="3">     
							<c:out value="${searchVO.cont}"/>
						</td> 
					</tr>
					<tr>                
						<th scope="row"><strong>첨부파일 </strong></th> 
						<td colspan="3">       
							<c:choose>    
								<c:when test="${empty searchVO.atchFileId }">   
									-
								</c:when>  
								<c:otherwise>
									<img src="/atch/getImage.do?atchFileId=${searchVO.atchFileId }&fileSn=0" alt="" onerror="/publish/ft/images/sample.png" style="max-width:500px;" >      
								</c:otherwise>
							</c:choose>
						</td>        
					</tr>      
				</tbody>         
			</table>             
		</div>                  
		<div class="tbl_btns c">           
			<a href="javascript:void(0)" class="btn btn_middle btn_purple" onclick="fncProcessForm('update');">수정</a>    
			<a href="javascript:void(0)" id="btn_del" class="btn btn_middle btn_red" onclick="fncProcessForm('delete');" >삭제</a>
			<a href="javascript:void(0)" onclick="fncList();" class="btn btn_middle btn_gray" >목록</a>
		</div> 
             
               
              
<script type="text/javascript"> 
  
<%-- 수정 및 삭제 버튼 --%>
function fncProcessForm(procType){   
	if(procType == "delete"){
		fncPageBoard("view", "deleteProc.do"); // 삭제 후 목록 
		return false;
	}else if(procType == "update"){ // 수정 후 view 
		$.ajax({                
			method : "POST",    
			url : "updateForm.do",
			dataType : "HTML",
			data : $("#defaultFrm").serialize(), 
			success : function(data){      
				$("#search_list").html(data);
			}
		});
	}             
}         

<%-- 목록 버튼 --%>
function fncList(){  
	fncPageBoard('list', 'myHomeFrm.do', '${searchVO.pageIndex}');
}

</script>

