<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
     
<div class="content_box">   
	<form name="defaultFrm" id="defaultFrm" method="post"> 
		<input type="hidden" name="ceSeq" id="ceSeq" value="${ceoVO.ceSeq }">
		<input type="hidden" name="ceAtchFileId" id="ceAtchFileId">  
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
						<th scope="row"><strong class="th_tit">대표자</strong></th>
						<td>
							<input type="text" name="ceName" id="ceName" class="text w100p" maxlength="8" value="${ceoVO.ceName }" />
						</td>
						<th scope="row"><strong class="th_tit">사업자 번호</strong></th>
						<td>  
							<input type="text" name="ceNum" id="ceNum" class="text w100p numOnly" maxlength="11" value="${ceoVO.ceNum }" />
						</td>      
					</tr>         
					<tr>                                
						<th scope="row"><strong class="th_tit">주소</strong></th>           
               			<td>            
	                     <input type="text" name="ceAdd" id="ceAdd1" value="${ceoVO.ceAdd.split(',')[0] }" placeholder="우편번호">
	                     <button type="button" class="btn btn-dark" onclick="execDaumPostcode();">우편번호 찾기</button><br>
	                      <input type="text" name="ceAdd" id="ceAdd2"  value="${ceoVO.ceAdd.split(',')[1] }"  placeholder="도로명 주소">
	                      <input type="text" name="ceAdd" id="ceAdd3"   value="${ceoVO.ceAdd.split(',')[2] }"  placeholder="상세주소">   
               			</td>    
						<th scope="row"><strong>핸드폰 번호</strong></th>  
						<td>    
							<input type="text" name="ceHp" id="ceHp" class="text w100p numOnly" maxlength="11" value="${ceoVO.ceHp }" />
						</td> 
					</tr> 
					<tr>
						<th scope="row"><strong>메인 이미지</strong></th>     
						<td colspan="3">
							<iframe name="ceAtchFileIdFrame" id="ceAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ceoVO.ceAtchFileId }&fileCnt=5&atchFileIdNm=ceAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" frTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>  
			</table> 
		</div>   
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${ceoVO.ceName}')" id="btn_submit">${not empty ceoVO.ceName ? '수정' : '등록'}</a>
		</div>
	</form>
</div>


<script type="text/javascript">
/** 주소 검색  **/      
function execDaumPostcode() { 
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
              $("#ceAdd1").val(data.zonecode);
              $("#ceAdd2").val(data.roadAddress);
            }
        }).open();
    });
} 
 

function submit(title){  
	var procType = ""; 
	
	if($("#ceName").val() == null || $("#ceName").val() == ""){
		checkMsg("#ceName", "이름을 입력해주세요.");
		return false;
	}  
	if($("#ceNum").val() == null || $("#ceNum").val() == ""){
		checkMsg("#ceNum", "사업자 번호를 입력해주세요.");
		return false;
	}  
	if($("#ceAdd3").val() == null || $("#ceAdd3").val() == ""){
		checkMsg("#ceAdd3", "상세주소를 입력해주세요.");
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

