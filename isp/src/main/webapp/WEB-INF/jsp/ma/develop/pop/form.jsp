<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>


<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">
		<input type="hidden" name="poSeq" id="poSeq" value="${popVO.poSeq }"/>
		<input type="hidden" name="poAtchFileId" id="poAtchFileId"/>
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
							<input type="text" name="poTitle" id="poTitle" class="text w100p"  required="required"  maxlength="50" value="${popVO.poTitle }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>내용</strong></th>  
						<td colspan="3">
							<textarea name="poCont" id="poCont" class="txt_area w_100p" >${util:unEscape(popVO.poCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="poAtchFileIdFrame" id="poAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${popVO.poAtchFileId }&fileCnt=5&atchFileIdNm=poAtchFileId&updateType=upload" style="width: 100%;"  frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody> 
			</table>
		</div>
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType ==  'update'}">
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div> 
	</form>
</div>


 
<script type="text/javascript">
var oEditors = [];
	
<%-- 에디터 --%>
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "poCont",
    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
}); 

$("#btn_submit").bind("click", function(){
	
	if($("#poTitle").val() == "" || $("#poTitle").val() == null) {
		checkMsg("#poTitle", "제목을 입력해주세요");
		return false;
	}
	
	oEditors.getById["poCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	     
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
});

$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
});

</script>