<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post"> 
		<input type="hidden" name="ntSeq" id="ntSeq" value="${ntcVO.ntSeq }">
		<input type="hidden" name="ntAtchFileId" id="ntAtchFileId">  
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
							<input type="text" name="ntTitle" id="ntTitle" class="text w100p" maxlength="70" value="${ntcVO.ntTitle }" />
						</td>
					</tr>
					<tr>  
						<th scope="row"><strong class="th_tit">공지글</strong></th>
						<td colspan="3">  
							공지 유무<input type="checkbox" id="check_ntc" ${ntcVO.ntState eq 'Y' ? 'checked' : '' } onclick="checkBox();">
							<input type="hidden" name="ntState" id="ntState">
						</td>
					</tr> 
					<tr id="tr_date" style="display:none;">   
						<th scope="row"><strong class="th_tit">공지 시작일</strong></th>
						<td>
							<input type="date" name="ntStaDate" id="ntStaDate" value="${ntcVO.ntStaDate }">
						</td>
						<th scope="row"><strong class="th_tit">공지 종료일</strong></th>
						<td>
							<input type="date" name="ntEndDate" id="ntEndDate" value="${ntcVO.ntEndDate }">
						</td>
					</tr>
					<tr>    
						<th scope="row"><strong>내용</strong></th>  
						<td colspan="3">    
							<textarea name="ntCont" id="ntCont" class="txt_area w_100p" style="resize:none;" >${ntcVO.ntCont}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="ntAtchFileIdFrame" id="ntAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ntcVO.ntAtchFileId }&fileCnt=5&atchFileIdNm=ntAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" ntTitle="파일 업로드 폼"></iframe>
						</td>
					</tr>  
				</tbody>
			</table>   
		</div>
		<div class="btn_area">  
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${ntcVO.ntTitle}')" id="btn_submit">${not empty ntcVO.ntTitle ? '수정' : '등록'}</a>
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
    elPlaceHolder: "ntCont",
    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
}); 
  
     
function submit(title){
	  
	if($("#ntTitle").val() == null || $("#ntTitle").val() == "") {
		checkMsg("#ntTitle", "제목을 입력하세요.");
		return false;
	}  
	
	if($("#check_ntc").prop("checked")){
		if($("#ntStaDate").val() == "" || $("#ntEndDate").val() == ""){
			checkMsg("#ntStaDate", "날짜를 입력하세요.");
			return false;
		}
		if($("#ntStaDate").val() > $("#ntEndDate").val()){       
			checkMsg("#ntStaDate", "날짜를 입력하세요.");
			return false;
		}
	}
	
	if($("#check_ntc").prop("checked")){
		$("#ntState").val("Y");
	}else{
		$("#ntState").val("N");  
	}
	
	oEditors.getById["ntCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
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
	if($("#check_ntc").prop("checked")){
		$("#tr_date").show();
		$("#ntStaDate").prop("disabled", false);
		$("#ntEndDate").prop("disabled", false);
		$("#ntState").val("Y");
	}else{
		$("#tr_date").hide();
		$("#ntStaDate").prop("disabled", true);
		$("#ntEndDate").prop("disabled", true);
		$("#ntStaDate").val("");
		$("#ntEndDate").val("");
		$("#ntState").val("N"); 
	} 
}  

$(function(){
	if($("#check_ntc").prop("checked")){
		$("#tr_date").show();
		$("#ntStaDate").prop("disabled", false);
		$("#ntEndDate").prop("disabled", false);
		$("#ntState").val("Y");
	}else{
		$("#tr_date").hide();
		$("#ntStaDate").prop("disabled", true);
		$("#ntEndDate").prop("disabled", true);
		$("#ntStaDate").val("");
		$("#ntEndDate").val("");
		$("#ntState").val("N");
	}
})





</script>

