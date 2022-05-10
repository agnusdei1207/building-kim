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
		
	<div class="btn_area">
		<a href="javascript:void(0)" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0)" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0)" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	
	
	
	
	<div class="tbl_wrap">
		<h3 class="tit_page">관리자 답글</h3>
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
						<th scope="row"><strong>내용</strong></th>  
						<td colspan="3">  
							<textarea name="eqCmt" id="eqCmt" class="txt_area w_100p" style="resize:none;" maxlength="3000" >${estQstVO.eqCmt}</textarea>
						</td>
					</tr>   
					<tr>  
						<th scope="row"><strong">진행 상태</strong></th>  
						<td colspan="3">  
							<select name="eqState" id="eqState"> 
								<option value="" ${estQstVO.eqState eq '' ? 'selected="selected"' : '' } >진행 상태</option>
								<option value="A" ${estQstVO.eqState eq 'A' ? 'selected="selected"' : '' } >신청</option>
								<option value="R" ${estQstVO.eqState eq 'R' ? 'selected="selected"' : '' } >반려</option>
								<option value="T" ${estQstVO.eqState eq 'T' ? 'selected="selected"' : '' } >재신청</option>
								<option value="P" ${estQstVO.eqState eq 'P' ? 'selected="selected"' : '' } >승인</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_area">
				<a href="javascript:void(0)" onclick="updateCmt('${estQstVO.eqSeq}');" class="btn btn_mdl btn_rewrite" >${empty estQstVO.eqCmt ? '답글 등록' : '답글 수정'}</a> 
			</div>	
		</div>
	</form>
</div>

           
<script>    
function updateCmt(seq){
	
	if($("#eqState").val() == null || $("#eqState") == ""){
		checkMsg("#eqState", "진행 상태를 선택해주세요.");
		return false;
	}
	
	fncPageBoard('update', 'updateCmtProc.do', seq, 'eqSeq' );
	return false;
}
     
</script>
