<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post"> 
		<input type="hidden" name="orSeq" id="orSeq" value="${ortVO.orSeq }">
		<input type="hidden" name="orAtchFileId" id="orAtchFileId">  
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
						<th scope="row"><strong class="th_tit">프로젝트 명</strong></th>
						<td colspan="3">
							<input type="text" title="프로젝트 명" name="orPjName" id="orPjName" class="text w100p" maxlength="40" value="${ortVO.orPjName }" />
						</td>
					</tr>
					<tr>  
						<th scope="row"><strong class="th_tit">클라이언트 이름</strong></th>
						<td>   
							<input type="text" title="프로젝트 명" name="orName" id="orName" class="text w100p" maxlength="7" value="${ortVO.orName }" />
						</td>
						<th scope="row"><strong class="th_tit">사업자 번호</strong></th>
						<td>
							<input type="text" title="사업자 번호" name="orBsNum" id="orBsNum" class="text w100p numOnly" maxlength="11" value="${ortVO.orBsNum }" placeholder="'-'빼고 숫자만 입력" />
						</td>
					</tr>   
					<tr>   
						<th scope="row"><strong class="th_tit">핸드폰 번호</strong></th>
						<td>
							<input type="text" title="핸드폰 번호" name="orHp" id="orHp" class="text w100p numOnly" maxlength="11" value="${ortVO.orHp }"  placeholder="'-'빼고 숫자만 입력" />
						</td> 
						<th scope="row"><strong class="th_tit">이메일</strong></th>        
						<td>   
							<input type="text" title="이메일" name="orMail" id="orMail_1" class="text" maxlength="15" value="${ortVO.orMail.split(',')[0] }" placeholder="Email" />
							@ 
							<input type="text" title="이메일" name="orMail" id="orMail_2" class="text" maxlength="15" value="${ortVO.orMail.split(',')[1] }" placeholder=" @example.com" />
						</td>
					</tr>               
					<tr>   
						<th scope="row"><strong class="th_tit">MBTI</strong></th>
						<td>    
							<select title="성격유형" name="orMbti" id="orMbti">  
								<option value="">성격유형 선택</option> 
								<option value="INTJ" ${ortVO.orMbti eq 'INTJ' ? 'selected="selected"' : '' }>INTJ</option> 
								<option value="INTP" ${ortVO.orMbti eq 'INTP' ? 'selected="selected"' : '' }>INTP</option>
								<option value="ENTJ" ${ortVO.orMbti eq 'ENTJ' ? 'selected="selected"' : '' }>ENTJ</option>
								<option value="ENTP" ${ortVO.orMbti eq 'ENTP' ? 'selected="selected"' : '' }>ENTP</option>
								<option value="INFJ" ${ortVO.orMbti eq 'INFJ' ? 'selected="selected"' : '' }>INFJ</option>
								<option value="INFP" ${ortVO.orMbti eq 'INFP' ? 'selected="selected"' : '' }>INFP</option>
								<option value="ENFJ" ${ortVO.orMbti eq 'ENFJ' ? 'selected="selected"' : '' }>ENFJ</option>
								<option value="ENFP" ${ortVO.orMbti eq 'ENFP' ? 'selected="selected"' : '' }>ENFP</option>
								<option value="ISTJ" ${ortVO.orMbti eq 'ISTJ' ? 'selected="selected"' : '' }>ISTJ</option>
								<option value="ISFJ" ${ortVO.orMbti eq 'ISFJ' ? 'selected="selected"' : '' }>ISFJ</option>
								<option value="ESTJ" ${ortVO.orMbti eq 'ESTJ' ? 'selected="selected"' : '' }>ESTJ</option>
								<option value="ESFJ" ${ortVO.orMbti eq 'ESFJ' ? 'selected="selected"' : '' }>ESFJ</option>
								<option value="ISTP" ${ortVO.orMbti eq 'ISTP' ? 'selected="selected"' : '' }>ISTP</option>
								<option value="ISFP" ${ortVO.orMbti eq 'ISFP' ? 'selected="selected"' : '' }>ISFP</option>
								<option value="ESTP" ${ortVO.orMbti eq 'ESTP' ? 'selected="selected"' : '' }>ESTP</option>
								<option value="ESFP" ${ortVO.orMbti eq 'ESFP' ? 'selected="selected"' : '' }>ESFP</option>
							</select>    
						</td>  
						<th scope="row"><strong class="th_tit">혈액형 ${ortVO.orBlood} </strong></th> 
						<td>
							<label>O</label><input type="radio" title="혈액형" name="orBlood" id="orBlood_1" value="O" ${ortVO.orBlood eq 'O' ? 'checked' : '' }>&nbsp;&nbsp;
							<label>A</label><input type="radio" title="혈액형" name="orBlood" id="orBlood_2" value="A" ${ortVO.orBlood eq 'A' ? 'checked' : '' }>&nbsp;&nbsp;
							<label>B</label><input type="radio" title="혈액형" name="orBlood" id="orBlood_3" value="B" ${ortVO.orBlood eq 'B' ? 'checked' : '' }>&nbsp;&nbsp;
							<label>AB</label><input type="radio" title="혈액형" name="orBlood" id="orBlood_4" value="AB" ${ortVO.orBlood eq 'AB' ? 'checked' : '' }>&nbsp;&nbsp;
						</td>
					</tr>   
					<tr>    
						<th scope="row"><strong>비밀 여부</strong></th>    
						<td>
							비밀 시 체크<input type="checkbox"  onclick="checkPw();" title="비밀글 사용 여부" id="check_pw" ${not empty ortVO.orPw ? 'checked' : '' }>
						</td>
						<th scope="row"><strong>프로젝트 일정</strong></th>   
						<td>  
							사용<input type="checkbox"  onclick="checkDate();" title="프로젝트 일정 사용 여부" id="check_date" ${not empty ortVO.orStaDate ? 'checked' : '' }>
						</td>
					</tr> 
					<tr id="tr_pw" style="display:none;">     
						<th scope="row"><strong class="th_tit">비밀번호</strong></th> 
						<td>
							<input type="password" title="비밀번호" name="orPw" id="orPw_1" class="text w100p numOnly" maxlength="4" placeholder="숫자 만 입력 (최대 4자리)"/>
						</td>   
						<th scope="row"><strong class="th_tit">비밀번호 확인</strong></th>
						<td>
							<input type="password" title="비밀번호 확인" id="orPw_2" class="text w100p numOnly" maxlength="4" placeholder="숫자 만 입력 (최대 4자리)" />
						</td>
					</tr> 
					<tr id="tr_date" style="display:none;">   
						<th scope="row"><strong id="notiDate" class="th_tit" >공지기간</strong></th>
						<td colspan="3"> 
							<span class="pick_input">
								<input name="orStaDate" id="orStaDate" class="text w100" maxlength="10" value="${ortVO.orStaDate }" readonly/>
							</span>
							<span class="pick_wave">~</span>
							<span class="pick_input"> 
								<input name="orEndDate" id="orEndDate" class="text w100"  maxlength="10" value="${ortVO.orEndDate }" readonly/>
							</span>
						</td> 
					</tr>   
					<tr> 
						<th scope="row"><strong>주소</strong></th>   
						<td colspan="3">
							<input type="text" name="orAddress" id="orAddress_1" value="${ortVO.orAddress.split(',')[0] }" maxlength="10" placeholder="우편번호">
	                  	    <button type="button" class="btn btn-dark" onclick="execDaumPostcode();">우편번호 찾기</button><br>
	                	    <input type="text" name="orAddress" id="orAddress_2" value="${ortVO.orAddress.split(',')[1] }" maxlength="15"  placeholder="도로명 주소">
	                  	    <input type="text" name="orAddress" id="orAddress_3" value="${ortVO.orAddress.split(',')[2] }" maxlength="25"  placeholder="상세주소">
						</td>    
					</tr>      
					<tr>     
						<th scope="row"><strong>프로젝트 설명</strong></th>  
						<td colspan="3">    
							<textarea name="orPjCont" id="orPjCont" class="txt_area w_100p" style="resize:none;" >${ortVO.orPjCont}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="orAtchFileIdFrame" id="orAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ortVO.orAtchFileId }&fileCnt=5&atchFileIdNm=orAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" orPjName="파일 업로드 폼"></iframe>
						</td>
					</tr>  
				</tbody>
			</table>   
		</div>
		<div class="btn_area">  
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${ortVO.orPjName}')" id="btn_submit">${not empty ortVO.orPjName ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="javascript:void(0)" onclick="fncPageBoard('view','view.do');" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form>
</div>



<script type="text/javascript">
var oEditors = [];
var regExp = /^[a-z0-9_]{4,20}$/;

function checkMsg(id ,msg){
	var html = '<strong><font color="red">'+msg+'</font></strong>';
	$(id).parent().children("strong").remove();
	$(id).after(html);
	$(id).focus();
	return false;
}	

function removeMsg(id){
	$(id).parent().children("strong").remove();
}
   
	<%-- 에디터 --%>
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "orPjCont",
    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});  
  
     
$(function(){ 
	checkPw();
	checkDate();
	$("#notiYn_N").click(function(){
		$("#notiDate").removeClass("th_tit");
		$("#orStaDate").removeAttr("required");
		$("#orEndDate").removeAttr("required");
	});
	$("#notiYn_Y").click(function(){
		$("#notiDate").addClass("th_tit");
		$("#orStaDate").attr("required","true");
		$("#orEndDate").attr("required","true");
	});
	
	fncSiteSelGet('siteClcd_sel','1','');
	fncDate('orStaDate','orEndDate');
}) 
     
function submit(title){
	  
	if($("#orPjName").val() == null || $("#orPjName").val() == "") {
		checkMsg("#orPjName", "프로젝트 이름을 입력하세요.");
		return false;
	}else{
		removeMsg("#orPjName");
	}
	if(!regExp.test($("#orId").val())){
		checkMsg("#orId", "숫자, 문자 4자리 이상 입력하세요.");
		return false;
	}else{
		removeMsg("#orId");
	}
	if($("#orName").val() == null || $("#orName").val() == ""){
		checkMsg("#orName", "클라이언트 이름을 입력하세요.");
		return false; 
	}else{
		removeMsg("#orName");
	}
	if($("#orBsNum").val() == null || $("#orBsNum").val() == ""){
		checkMsg("#orBsNum", "사업자 번호를 입력하세요.");
		return false; 
	}else{
		removeMsg("#orBsNum");
	}
	if($("#orHp").val() == null || $("#orHp").val() == ""){
		checkMsg("#orHp", "핸드폰 번호를 입력하세요.");
		return false; 
	}else{
		removeMsg("#orHp");
	}
	if($("#orMail_1").val() == null || $("#orMail_1").val() == ""){
		checkMsg("#orMail_1", "이메일 아이디를 입력하세요.");
		return false; 
	}else{
		removeMsg("#orMail_1");
	} 
	if($("#orMail_2").val() == null || $("#orMail_2").val() == ""){
		checkMsg("#orMail_2", "이메일 주소를 입력하세요.");
		return false; 
	}else{
		removeMsg("#orMail_2");
	}  
	if(!regExp.test($("#orMail_1").val())){
		checkMsg("#orMail_1", "형식이 올바르지 않습니다.");
		return false;  
	}else{
		removeMsg("#orMail_1");
	}  
	if(!regExp.test($("#orMail_2").val())){
		checkMsg("#orMail_2", "형식이 올바르지 않습니다.");
		return false; 
	}else{
		removeMsg("#orMail_2");
	}  
	if($("#orMbti").val() == null || $("#orMbti").val() == ""){
		checkMsg("#orMbti", "성격 유형을 선택하세요.");
		return false; 
	}else{
		removeMsg("#orMbti");
	}  
	if($("input[name=orBlood]").val() == null || $("input[name=orBlood]").val() == ""){
		checkMsg("#orBlood_4", "혈액형을 선택하세요.");
		return false; 
	}else{
		removeMsg("#orBlood_4");
	} 
	if($("#check_pw").is(":checked")){
		if($("#orPw_1").val() == null || $("#orPw_1").val() == ""){
			checkMsg("#orPw_1", "비밀번호를 입력하세요.");
			return false;
		}else{
			removeMsg("#orPw_1");
		} 
		if($("#orPw_2").val() == null || $("#orPw_2").val() == ""){
			checkMsg("#orPw_2", "비밀번호를 입력하세요.");
			return false;
		}else{
			removeMsg("#orPw_2");        
		} 
		if($("#orPw_1").val() != $("#orPw_2").val()){
			checkMsg("#orPw_2", "비밀번호가 서로 같지 않습니다.");
			return false;
		}else{
			removeMsg("#orPw_1");
			removeMsg("#orPw_2");
		} 
	}   
	
	if($("#check_date").prop("checked")){
		if($("#orStaDate").val() == "" || $("#orEndDate").val() == ""){
			checkMsg("#orStaDate", "시작 날짜를 입력하세요.");
			return false;
		}else{
			removeMsg("#orStaDate");
		} 
		if($("#orEndDate").val() == "" || $("#orEndDate").val() == ""){
			checkMsg("#orEndDate", "종료 날짜를 입력하세요.");
			return false;
		}else{
			removeMsg("#orEndDate");
		} 
		if($("#ntStaDate").val() > $("#ntEndDate").val()){       
			checkMsg("#ntStaDate", "날짜 형식이 올바르지 않습니다.");
			checkMsg("#ntEndDate", "날짜 형식이 올바르지 않습니다.");
			return false;
		}else{
			removeMsg("#ntStaDate");
			removeMsg("#ntEndDate");
		} 
	} 
	
	oEditors.getById["orPjCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		
	if(title == null || title == ""){
		fncPageBoard('submit','insertProc.do');
		return false;
	}else{
		fncPageBoard('update','updateProc.do');
		return false;
	} 
		   
}  
  
function checkPw(){
	if($("#check_pw").prop("checked")){
		$("#tr_pw").show();
		$("#orPw_1").prop("disabled", false);
		$("#orPw_2").prop("disabled", false);
	}else{
		$("#tr_pw").hide();
		$("#orPw_1").prop("disabled", true);
		$("#orPw_2").prop("disabled", true);
		$("#orPw_1").val("");
		$("#orPw_2").val("");
	} 
}  
function checkDate(){
	if($("#check_date").is(":checked")){
		$("#tr_date").show();
		$("#orStaDate").prop("disabled", false);
		$("#orEndDate").prop("disabled", false);
	}else{
		$("#tr_date").hide();
		$("#orStaDate").prop("disabled", true);
		$("#orEndDate").prop("disabled", true);
		$("#orStaDate").val("");
		$("#orEndDate").val("");
	}
}
/** 주소 검색  **/      
function execDaumPostcode() { 
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
              $("#orAddress_1").val(data.zonecode);
              $("#orAddress_2").val(data.roadAddress);
            }
        }).open();
    });
} 

</script>

