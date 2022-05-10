<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">   
		<input type="hidden" name="eqSeq" id="eqSeq" value="${estQstVO.eqSeq }">
		<input type="hidden" name="eqAtchFileId" id="eqAtchFileId">
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap"> 
			<table class="tbl_row_type01">  
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody> 
					<tr> 
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${estQstVO.eqId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${estQstVO.eqDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${estQstVO.eqTitle }
						</td> 
					</tr> 
					<tr>
						<th scope="row"><strong>비밀 여부</strong></th>
						<td>
							<c:choose>
								<c:when test="${not empty estQstVO.eqPw }">
									비밀
								</c:when>
								<c:otherwise>    
									공개
								</c:otherwise>   
							</c:choose>
						</td>
	                    <th scope="row"><strong>진행 상태</strong></th>
						<td>
							<c:choose>
								<c:when test="${estQstVO.eqState eq 'A'}">
									신청
								</c:when>
								<c:when test="${estQstVO.eqState eq 'R'}">
									반려
								</c:when>
								<c:when test="${estQstVO.eqState eq 'T'}">
									재신청
								</c:when>
								<c:when test="${estQstVO.eqState eq 'P'}">
									승인
								</c:when>    
								<c:otherwise>
									-
								</c:otherwise>     
							</c:choose> 
						</td>  
					</tr>  
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(estQstVO.eqCont)}" escapeXml="false"/>
							</div>
						</td>  
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="eqAtchFileIdFrame" id="eqAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${estQstVO.eqAtchFileId }&fileCnt=5&atchFileIdNm=eqAtchFileId&updateType=view" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>  
				</tbody>   
			</table> 
		</div>       
		       
	<div class="tbl_btns c">    
		<c:if test="${memberVO.meId eq estQstVO.eqId && estQstVO.eqState ne 'P'}">
			<a href="javascript:void(0)" id="btn_update" class="btn btn_middle btn_purple" >수정</a> 
			<a href="javascript:void(0)" id="btn_del" class="btn btn_middle btn_red" >삭제</a>
		</c:if>
			<a href="javascript:void(0)" id="btn_list" class="btn btn_middle btn_gray" >목록</a>
	</div>	
	  
	 
	<c:if test="${not empty estQstVO.eqCmt}"> 
		<div class="tbl_wrap">           
			<h3 class="tit_page">관리자 답글</h3>
				<table class="tbl_row_type01"> 
					<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">  
					</colgroup>                   
					<tbody>
						<tr>  
							<th scope="row"><strong>내용</strong></th>  
							<td colspan="3">  
								${estQstVO.eqCmt}
							</td>   
						</tr>       
					</tbody>
				</table>
			</div>
	</c:if>	
		
	</form>
</div>

