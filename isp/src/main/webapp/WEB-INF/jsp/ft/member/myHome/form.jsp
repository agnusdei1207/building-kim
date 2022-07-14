<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
      
		<input type="hidden" name="id" id="id" value="${memberVO.meId }">     
		<input type="hidden" name="divn" id="divn" value="${searchVO.divn }">                 
		<input type="hidden" name="atchFileId" id="atchFileId" value="${searchVO.atchFileId }">       
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
							<input type="text" name="title" id="title" style="width: 100%;" class="text" maxlength="70" value="${searchVO.title }" />
						</td>
					</tr>
					<tr>      
						<th scope="row"><strong>내용</strong></th>     
						<td colspan="3">     
							<textarea name="cont" id="cont" class="txt_area w_100p" style="resize:none;" maxlength="3000" style="resize:none;" >${searchVO.cont}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${searchVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" frameborder="0" frTitle="파일 업로드 폼"></iframe>
						</td>        
					</tr>  
				</tbody>     
			</table>       
		</div>             
		<div class="tbl_btns c">    
			<a href="javascript:void(0)" class="btn btn_middle btn_purple" onclick="fncProcess('${searchVO.title}');" >${not empty searchVO.title ? '수정' : '등록'}</a>
			<a href="javascript:void(0)" onclick="fncPageBoard('list', 'myHomeFrm.do');" class="btn btn_middle btn_gray" >취소</a>
		</div>
       
         
<script type="text/javascript">     
  
<%-- 수정 및 등록 버튼 --%>
function fncProcess(title){      
	if(title == null || title == ""){   
		fncPageBoard("write", "insertProc.do");
	}else{
		$.ajax({
			method : "POST",
			url : "updateProc.do",
			dataType : "HTML", 
			data : $("#defaultFrm").serialize(),
			success : function(data){  
				$("#search_list").html(data);
				$(".tbl").html();
			},      
			complete : function(data){
				alert("수정이 완료되었습니다.");
			}
		});
	}
}
  
</script>

