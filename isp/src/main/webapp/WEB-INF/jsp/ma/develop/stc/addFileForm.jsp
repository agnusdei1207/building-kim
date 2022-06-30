<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="pop_header">
   <h2>
   		전자파 민원 통계 데이터등록
   </h2>
   <a href="javascript:void(0);" onclick="view_hide(1);return false" class="pop_close"></a>
</div>
<div class="pop_content">
	<div class="pop_scl">
	    <div class="tbl_wrap">
			<form:form commandName="searchVO" name="popFrm" id="popFrm" method="post" onsubmit="return false;">
				<table class="tbl_row_type02"> 
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>   
					<tbody>
						<tr>
							<th>엑셀파일첨부</th>
							<td>
								<input type="hidden" id="fileNm" name="fileNm" />
								<iframe name="fileNmFrame" id="fileNmFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=1&atchFileIdNm=fileNm&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							</td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>
</div>
<div class="pop_footer">
    <a href="javascript:void(0);" title="등록" onclick="fncExcelUp();" class="btn btn_mdl btn_add">등록</a>
    <a href="javascript:void(0);" title="취소" onclick="view_hide(1);return false" class="btn btn_mdl btn_close">취소</a>
</div>
<script type="text/javascript">
function fncExcelUp(){
	if($("#fileNm").val() != null && $("#fileNm").val() != "" ){
		if(confirm("파일을 업로드 하시겠습니까?")){
			$.ajax({
				url : "saveExcel.json",
				dataType : "HTML",
				data : {"atchFileId":$("#fileNm").val()},
				success : function(data){
					if(data.error != "" && data.error != null){
						alert(data.error);			
					}else{
						alert("엑셀업로드가 완료되었습니다.");
						fncPageBoard('addList','addList.do',1);
						view_hide(1);	
					}
				},
				error : function(data){
					alert("오류가 발생하였습니다.\n잠시 후 다시 시도해 주시기 바랍니다.");
					fncLodingEnd();
				}
			});
		}
	}else{
		alert("첨부파일을 등록해주세요.");
		return false;
	}
}
</script>