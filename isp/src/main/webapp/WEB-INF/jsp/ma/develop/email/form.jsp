<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">
		<input type="hidden" name="seq" id="seq" />
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
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
							<input type="text" name="emTitle" id="emTitle" class="text w100p" maxlength="30" value="${util:unEscape(emailVO.emTitle) }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="emCont" id="emCont" class="txt_area w_100p" >${util:unEscape(emailVO.emCont)}</textarea>
						</td> 
					</tr>
				</tbody>
			</table>
		</div>     
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" onclick="fncPageBoard('view','view.do');">취소</a>
			</c:if> 
			<c:if test="${searchVO.procType ne  'update'}">  
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form>
</div> 




<script type="text/javascript">
 
function submit(){
	
	if($("#emTitle").val() == "" || $("#emTitle").val() == null) {
		checkMsg("emTitle", "제목을 입력해주세요.");
		return false;
	}
		
	
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
};


</script>