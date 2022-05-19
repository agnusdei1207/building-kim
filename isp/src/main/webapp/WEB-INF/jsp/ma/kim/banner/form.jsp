<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post"> 
		<input type="hidden" name="baSeq" id="baSeq" value="${bannerVO.baSeq }">
		<input type="hidden" name="baAtchFileId" id="baAtchFileId">  
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
							<input type="text" name="baTitle" id="baTitle" class="text w100p" maxlength="70" value="${bannerVO.baTitle }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>URL</strong></th>
						<td>
							<input type="text" name="baUrl" id="baUrl" class="text w100p" maxlength="120" value="${bannerVO.baUrl}" />
						</td> 
						<th scope="row"><strong>새창 유무</strong></th>  
						<td>
							사용 <input type="checkbox" id="check_window" ${bannerVO.baWindow eq 'Y' ? 'checked' : '' } onclick="checkBox();">
							<input type="hidden" name="baWindow" id="baWindow">
						</td>      
					</tr>  
					<tr>           
						<th scope="row"><strong>내용</strong></th>        
						<td colspan="3">    
							<textarea name="baCont" id="baCont" class="txt_area w_100p" style="resize:none;" >${util:unEscape(bannerVO.baCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="baAtchFileIdFrame" id="baAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" baTitle="파일 업로드 폼"></iframe>
						</td>
					</tr>   
				</tbody>
			</table>
		</div>
		<div class="btn_area">  
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${bannerVO.baTitle}')" id="btn_submit">${not empty bannerVO.baTitle ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
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
    elPlaceHolder: "baCont",
    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
}); 
  
   
function submit(title){
	  
	if($("#baTitle").val() == null || $("#baTitle").val() == "") {
		checkMsg("#baTitle", "제목을 입력해주세요.");
		return false;
	}  
	
	if($("#baUrl").val() == null || $("#baUrl").val() == ""){
		checkMsg("#baUrl", "URL을 입력해주세요.");
		return false;
	}
	 
	   
	if($("#check_window").prop("checked")){
		$("#baWindow").val("Y");
	}else{
		$("#baWindow").val("N");
	}
	   
	oEditors.getById["baCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if(title == null || title == ""){
		fncPageBoard('submit','insertProc.do');
		return false;   
	}else{
		fncPageBoard('update','updateProc.do');
		return false;
	}   
		 
} 
  
$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
});

 
function checkBox(){
	if($("#check_window").prop("checked")){
		$("#baWindow").val("Y");
	}else{
		$("#baWindow").val("N");
	}
}




</script>

