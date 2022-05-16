<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
  
<div class="content_box"> 
	<form name="defaultFrm" id="defaultFrm" method="post">     
		<input type="hidden" name="ipSeq" id="ipSeq" value="${ipLogVO.ipSeq }">
		<input type="hidden" name="ipRgstId" id="ipRgstId" value="${loginMgrId }">
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
						<th scope="row"><strong class="th_tit">차단 IP</strong></th>
						<td colspan="3">
							<input type="text" name="ipClientIp" id="ipClientIp" style="width: 100%;" class="text" maxlength="70" value="${ipLogVO.ipClientIp }" />
						</td>
					</tr> 
				</tbody>
			</table>  
		</div>           
		<div class="btn_area">    
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${ipLogVO.ipClientIp}')" id="btn_submit">${not empty ipLogVO.ipClientIp ? '수정' : '등록'}</a>
			<a href="javascript:void(0)" onclick="fncPageBoard('list', 'list.do');" class="btn btn_middle btn_gray" >취소</a>
		</div> 
	</form>  
</div>  
 
  
 
<script type="text/javascript">

function submit(ipClientIp){   
	  
	if($("#ipClientIp").val() == null || $("#ipClientIp").val() == "") {
		checkMsg("#ipClientIp", "차단할 IP를 입력해주세요.");
		return false; 
	}   
	if(ipClientIp == null || ipClientIp == ""){
		fncPageBoard('write','insertProc.do');
		return false;
	}else{
		fncPageBoard('update','updateProc.do');
		return false;
	}
} 

</script>

