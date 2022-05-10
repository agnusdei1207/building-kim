<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post"> 
		<input type="hidden" name="eqSeq" id="eqSeq" value="${estQstVO.eqSeq }">
		<input type="hidden" name="eqId" id="eqId" value="${loginMgrId }">
		<input type="hidden" name="eqAtchFileId" id="eqAtchFileId">    
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
							<input type="text" name="eqTitle" id="eqTitle" class="text w100p" maxlength="70" value="${estQstVO.eqTitle }" />
						</td>
					</tr>   
					<tr>  
						<th scope="row"><strong class="th_tit">비밀 여부</strong></th>
						<td colspan="3">
							비밀 시 체크<input type="checkbox" id="check_pw" onclick="checkBox();">
						</td>
					</tr>       
					<tr id="tr_pw" style="display:none;">   
						<th scope="row"><strong class="th_tit">비밀번호</strong></th>
						<td>
							<input type="password" name="eqPw" id="eqPw_1" maxlength="4" value="${ntcVO.eqPw }">
						</td>  
						<th scope="row"><strong class="th_tit">비밀번호 확인</strong></th>
						<td>
							<input type="password"  id="eqPw_2" maxlength="4" value="${ntcVO.eqPw }">
						</td>
					</tr>      
					<tr>       
						<th scope="row"><strong>내용</strong></th>  
						<td colspan="3">    
							<textarea name="eqCont" id="eqCont" class="txt_area w_100p" style="resize:none;" >${estQstVO.eqCont}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="eqAtchFileIdFrame" id="eqAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${estQstVO.eqAtchFileId }&fileCnt=5&atchFileIdNm=eqAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" eqTitle="파일 업로드 폼"></iframe>
						</td>
					</tr>  
				</tbody>   
			</table> 
		</div>  
		<div class="btn_area">  
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${estQstVO.eqTitle}')" id="btn_submit">${not empty estQstVO.eqTitle ? '수정' : '등록'}</a>
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
    elPlaceHolder: "eqCont",
    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
}); 
  
   
function submit(title){
	  
	if($("#eqTitle").val() == null || $("#eqTitle").val() == "") {
		checkMsg("#eqTitle", "제목을 입력하세요.");
		return false;
	}  
	   
	if($("#check_pw").prop("checked")){
		if($("#eqPw_1").val() == "" || $("#eqPw_2").val() == ""){
			checkMsg("#eqPw_1", "비밀번호를 확인하세요.");
			checkMsg("#eqPw_2", "비밀번호를 확인하세요.");
			return false;
		}
		if($("#eqPw_1").val() != $("#eqPw_2").val()){
			checkMsg("#eqPw_1", "비밀번호가 서로 다릅니다.");
			checkMsg("#eqPw_2", "비밀번호가 서로 다릅니다.");
			return false;
		}     
	}    
	
	oEditors.getById["eqCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if(title == null || title == ""){
		fncPageBoard('write', "insertProc.do");
		return true;
	}else{
		fncPageBoard('update', "updateProc.do");
		return true;
	}
	
		 
} 
  
$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
});



 
function checkBox(){
	if($("#check_pw").prop("checked")){
		$("#tr_pw").show();
		$("#eqPw_1").prop("disabled", false);
		$("#eqPw_2").prop("disabled", false);
	}else{
		$("#tr_pw").hide();
		$("#eqPw_1").prop("disabled", true);
		$("#eqPw_2").prop("disabled", true);
		$("#eqPw_1").val("");
		$("#eqPw_2").val("");
	}
}  

$(function(){
	if($("#check_pw").prop("checked")){
		$("#tr_pw").show();
		$("#eqPw_1").prop("disabled", false);
		$("#eqPw_2").prop("disabled", false);
	}else{
		$("#tr_pw").hide();
		$("#eqPw_1").prop("disabled", true);
		$("#eqPw_2").prop("disabled", true);
		$("#eqPw_1").val("");
		$("#eqPw_2").val("");
	}
})

</script>

