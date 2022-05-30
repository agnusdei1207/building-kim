<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="content_box"> 
	<form name="defaultFrm" id="defaultFrm" method="post">  
		<input type="hidden" name="emSeq" id="emSeq" value="${emailVO.emSeq }"/>
		<input type="text" id="selectMember">
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
						<th scope="row"><strong class="th_tit">받는사람</strong></th>
						<td colspan="3">
							<ul id="receiver" class="mail_select_list">
								
							</ul>
							<a href="javascript:void(0);" class="btn btn_sml btn_ok" onclick="fncAddressBook();">주소록</a>
						</td>
					</tr>
					<tr>       
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3"> 
							<input type="text" name="emTitle" id="emTitle" class="text w100p" maxlength="30" value="${util:unEscape(emailVO.emTitle) }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">  
							<textarea name="emCont" id="emCont" class="txt_area w_100p" style="resize: none;" >${util:unEscape(emailVO.emCont)}</textarea>
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>양식</strong></th>    
						<td colspan="3">    
							A type <input type="radio" name="emDsgn" id="emDsgn_A" value="A" ${emailVO.emDsgn eq 'A' ? 'checked="checked"' : '' } style="margin-left:5px; margin-right:5px;"> 
							B type <input type="radio" name="emDsgn" id="emDsgn_B" value="B" ${emailVO.emDsgn eq 'B' ? 'checked="checked"' : '' } style="margin-left:5px; margin-right:5px;"> 
							C type <input type="radio" name="emDsgn" id="emDsgn_C" value="C" ${emailVO.emDsgn eq 'C' ? 'checked="checked"' : '' } style="margin-left:5px; margin-right:5px;"> 
							D type <input type="radio" name="emDsgn" id="emDsgn_D" value="D" ${emailVO.emDsgn eq 'D' ? 'checked="checked"' : '' } style="margin-left:5px; margin-right:5px;"> 
						</td>           
					</tr>
				</tbody>    
			</table>
		</div>      
		<div class="btn_area">          
			<a href="javascript:void(0)" class="btn btn_mdl btn_save" onclick="submit();">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}"> 
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="fncPageBoard('view','view.do');">취소</a>
			</c:if> 
			<c:if test="${searchVO.procType ne  'update'}">  
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form>
</div>  
 

<script type="text/javascript"> 
      
function submit(){ 
	<%-- 제목 유효성 --%>
	if($("#emTitle").val() == "" || $("#emTitle").val() == null) {
		checkMsg("#emTitle", "제목을 입력해주세요.");
		return false;
	}  
  	
	<%-- 디자인 유형 선택--%>
	if(!$("input[name=emDsgn]").is(":checked")){
		$("#emDsgn_A").prop("checked", true);
	} 
  	   
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
};   
   
function fncAddressBook(){  
	var selectMember = '';
	$("input[name='arrUserSeq']").each(function(i){
		selectMember += '//' + $(this).attr("data-nameEmail");	
		alert("i : " + i);
		alert("selectMember : " + selectMember);
	}); 
	$("#selectMember").val(selectMember);
	fncPageBoard("pop", "pop.do", "", "", "1000", "500");
	
}


</script>