<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
  
<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">     
		<input type="hidden" name="frSeq" id="frSeq" value="${freeVO.frSeq }">
		<input type="hidden" name="frId" id="frId" value="${memberVO.meId }">
		<input type="hidden" name="frAtchFileId" id="frAtchFileId">  
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
							<input type="text" name="frTitle" id="frTitle" style="width: 100%;" class="text" maxlength="70" value="${freeVO.frTitle }" />
						</td>
					</tr>
					<tr>    
						<th scope="row"><strong>내용</strong></th>  
						<td colspan="3">     
							<textarea name="frCont" id="frCont" class="txt_area w_100p" style="resize:none;" maxlength="3000" style="resize:none;" >${freeVO.frCont}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="frAtchFileIdFrame" id="frAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${freeVO.frAtchFileId }&fileCnt=5&atchFileIdNm=frAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" frTitle="파일 업로드 폼"></iframe>
						</td>
					</tr>  
				</tbody>
			</table>
		</div>       
		<div class="tbl_btns c">    
			<a href="javascript:void(0)" class="btn btn_middle btn_purple" onclick="submit('${freeVO.frTitle}')" id="btn_submit">${not empty freeVO.frTitle ? '수정' : '등록'}</a>
			<a href="javascript:void(0)" onclick="fncPageBoard('list', 'list.do');" class="btn btn_middle btn_gray" >취소</a>
		</div>
	</form> 
</div> 
 


<script type="text/javascript">
  
     
function submit(title){   
	  
	if($("#frTitle").val() == null || $("#frTitle").val() == "") {
		checkMsg("#frTitle", "제목을 입력해주세요.");
		return false; 
	}  
		
	if(title == null || title == ""){
		fncPageBoard('write','insertProc.do');
		return false;
	}else{
		fncPageBoard('update','updateProc.do');
		return false;
	}
		 
} 
  
  
  
</script>

