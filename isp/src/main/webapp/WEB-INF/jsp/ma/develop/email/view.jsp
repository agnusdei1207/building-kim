<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">  
	<form name="defaultFrm" id="defaultFrm" method="post">  
		<input type="hidden" name="emSeq" id="emSeq" value="${emailVO.emSeq }" />
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
							${emailVO.emRgstId }
						</td> 
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${emailVO.emRgstDt }</td>
					</tr>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${emailVO.emTitle }
						</td> 
					</tr> 
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(emailVO.emCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>  
				</tbody>
			</table> 
		</div>
		
	<div class="btn_area">
		<a href="javascript:void(0);" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form>
</div>
