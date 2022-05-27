<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<style type="text/css">
.file_thum li {float: none !important;display:inline-block !important;width:140px !important;}
.file_thum .file_img {height:100px !important;}
.file_thum .file_name {display:none !important;}
</style> 
      
<form id="defaultFrm" name="defaultFrm"  method="post" onsubmit="return false;">
	<input type="hidden" id="mapMngSn" name="mapMngSn" value="${maMapVO.mapMngSn }"/>
    <div class="tbl_top"> 
        <div class="tbl_left"><h3 class="md_tit">지도 기본 정보</h3></div>
        <div class="tbl_right"><a href="javascript:void(0);" class="btn btn_sml btn_reset" onclick="fncPopApi();return false;">API 관리</a></div>
    </div>
    <!-- board --> 
    <div class="tbl_wrap"> 
        <table class="board_row_type01">  
            <colgroup> 
                <col style="width:10%">
                <col style="width:28%">
                <col style="width:10%"> 
                <col style="width:28%">
                <col style="width:10%">
                <col style="width:14%">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><strong class="th_tit">지도 제목</strong></th>
                    <td colspan="">
                    	<input type="text" id="mapTtl" name="mapTtl" value="${maMapVO.mapTtl }" class="w100p" maxlength="30"/>
                    </td>
                    <th scope="row"><strong>컬러 설정</strong></th>
                    <td colspan="">
                    	<input type="color" id="mapLogoColr" name="mapLogoColr" class="cursor w35px" value="${maMapVO.mapLogoColr}" style="border:radius:15px;"/>
                    	<label for="mapLogoColr" class="cursor mar_r10">로고색상</label>
                    	<input type="color" id="mapBkgrColr" name="mapBkgrColr" class="cursor w35px" value="${maMapVO.mapBkgrColr}" style="border:radius:15px;"/>
                    	<label for="mapBkgrColr" class="cursor mar_r10">배경색상</label>
                    	<input type="color" id="mapBtnColr" name="mapBtnColr" class="cursor w35px" value="${maMapVO.mapBtnColr}" style="border:radius:15px;"/>
                    	<label for="mapBtnColr" class="cursor">버튼색상</label>
                    </td>
                    <th scope="rowgroup" rowspan="2"><strong>로고 이미지</strong></th>
                    <td rowspan="2">
                    	<div id="mapLogoImgUpload"></div>
                    	<input type="hidden" id="mapLogoImg" name="mapLogoImg" value="${maMapVO.mapLogoImg }"/>
                    </td>
                </tr>
                <tr>
                	<th scope="row"><strong class="th_tit">검색 기능</strong></th>
                    <td colspan="" id="td_search">
                    	<input type="checkbox" id="addrSrchUseYn" name="addrSrchUseYn" class="cursor" value="Y" ${maMapVO.addrSrchUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="addrSrchUseYn" class="cursor mar_r10">주소검색</label>
                    	<input type="checkbox" id="pthSrchUseYn" name="pthSrchUseYn" class="cursor" value="Y" ${maMapVO.pthSrchUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="pthSrchUseYn" class="cursor mar_r10">경로검색</label>
                    	<input type="checkbox" id="pthCnnUseYn" name="pthCnnUseYn" class="cursor" value="Y" ${maMapVO.pthCnnUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="pthCnnUseYn" class="cursor mar_r10">경로연결</label>
                    	<input type="checkbox" id="mrkrSrchUseYn" name="mrkrSrchUseYn" class="cursor" value="Y" ${maMapVO.mrkrSrchUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="mrkrSrchUseYn" class="cursor mar_r10">마커검색</label>
                    	<input type="checkbox" id="scopSrchUseYn" name="scopSrchUseYn" class="cursor" value="Y" ${maMapVO.scopSrchUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="scopSrchUseYn" class="cursor">범위검색</label>
                    </td>
                    <th scope="row"><strong>기타 기능</strong></th>
                    <td colspan="">
                    	<input type="checkbox" id="mrkrChcUseYn" name="mrkrChcUseYn" class="cursor" value="Y" ${maMapVO.mrkrChcUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="mrkrChcUseYn" class="cursor mar_r10">마커선택</label>
                    	<input type="checkbox" id="mapToolUseYn" name="mapToolUseYn" class="cursor" value="Y" ${maMapVO.mapToolUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="mapToolUseYn" class="cursor mar_r10">도구모음</label>
                    	<input type="checkbox" id="mapCordUseYn" name="mapCordUseYn" class="cursor" value="Y" ${maMapVO.mapCordUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="mapCordUseYn" class="cursor mar_r10">좌표</label>
                    	<input type="checkbox" id="mapLgndUseYn" name="mapLgndUseYn" class="cursor" value="Y" ${maMapVO.mapLgndUseYn eq 'Y' ? 'checked="checked"' : '' }/>
                    	<label for="mapLgndUseYn" class="cursor">범례</label>
                    </td>
                </tr>
                <tr>
                	
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tbl_top">
        <div class="tbl_left"><h3 class="md_tit">마커 정보</h3></div>
        <div class="tbl_right"><a href="javascript:void(0);" class="btn btn_sml btn_reset" onclick="fncAddMrkr();return false;">╊</a></div>
    </div>
    <!-- board -->
    <div class="tbl_wrap">
        <table id="table_mrkr" class="tbl_col_type01">
            <colgroup>
                <col style="width:5%">
                <col style="width:12%">
                <col style="width:16%">
                <col>
                <col style="width:10.5%">
                <col style="width:10%">
                <col style="width:6%">
                <col style="width:6%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><strong>번호</strong></th>
                    <th scope="col"><strong>코드</strong></th>
                    <th scope="col"><strong class="th_tit">마커명</strong></th>
                    <th scope="col"><strong class="th_tit">마커 설명</strong></th>
                    <th scope="col"><strong class="th_tit">마커 이미지</strong></th>
                    <th scope="col"><strong>사용여부</strong></th>
                    <th scope="col"><strong>순서</strong></th>
                    <th scope="col"><strong>삭제</strong></th>
                </tr>
            </thead>
            <tbody id="tbody_mrkr">
	            <c:choose>
	            	<c:when test="${fn:length(mapMrkrList) gt 0 }">
	            		<c:forEach var="list" items="${mapMrkrList }" varStatus="status">
			                <tr id="tr_mrkr_${status.count }">
			                	<td>
			                		<input type="hidden" id="seqo_${status.count }" name="voList[${status.count }].seqo" value="${status.count }"/>
									<span id="span_seqo_${status.count }">${status.count }</span>	
			                	</td>
			                	<td><span><c:out value="${list.mapMrkrSn }"/></span></td>
			                	<td class="l">
			                		<input type="hidden" id="mapMrkrSn_${status.count }" name="voList[${status.count }].mapMrkrSn" value="${list.mapMrkrSn }"/>
			                		<input type="text" id="mrkrNm_${status.count }" name="voList[${status.count }].mrkrNm" class="w100p" value="${list.mrkrNm }" maxlength="15"/>
			                	</td>
			                	<td class="l">
			                		<input type="text" id="mrkrExpl_${status.count }" name="voList[${status.count }].mrkrExpl" class="w100p" value="${list.mrkrExpl }" maxlength="40"/>
			                	</td>
			                	<td class="l">
			                		<div id="mrkrImgUpload_${status.count }" class="c"></div>
			                    	<input type="hidden" id="mrkrImg_${status.count }" name="voList[${status.count }].mrkrImg" value="${list.mrkrImg }"/>
			                	</td>
			                	<td>
			                		<input type="radio" id="useYn_Y_${status.count }" name="voList[${status.count }].useYn" class="cursor" value="Y" ${list.useYn eq 'Y' ? 'checked="checked"' : '' }/><label for="useYn_Y_${status.count }" class="cursor mar_r15">사용</label><input type="radio" id="useYn_N_${status.count }" name="voList[${status.count }].useYn" class="cursor" value="N" ${list.useYn eq 'N' ? 'checked="checked"' : '' }/><label for="useYn_N_${status.count }" class="cursor">미사용</label>
			                	</td>
			                	<td>
			                		<span class="code_btns" style="position: static;">
										 <a href="javascript:void(0);" class="mar_r15" onclick="fncSortAction(${status.count }, 'up');return false;">▲</a><a href="javascript:void(0);" onclick="fncSortAction(${status.count }, 'down');return false;">▼</a>
									</span>
			                	</td>
			                	<td>
			                		<button type="button" class="btn btn_i_del" onclick="fncDelMrkr(${status.count });return false;"><span>삭제</span></button>
			                	</td>
			                </tr>
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise>
		                <tr id="tr_mrkr_1">
		                	<td>
		                		<input type="hidden" id="seqo_1" name="voList[1].seqo" value="1"/>
								<span id="span_seqo_1">1</span>		                		
		                	</td>
		                	<td><span>-</span></td>
		                	<td class="l">
		                		<input type="text" id="mrkrNm_1" name="voList[1].mrkrNm" class="w100p" maxlength="15"/>
		                	</td>
		                	<td class="l">
		                		<input type="text" id="mrkrExpl_1" name="voList[1].mrkrExpl" class="w100p" maxlength="40"/>
		                	</td>
		                	<td class="l">
		                		<div id="mrkrImgUpload_1" class="c"></div>
		                    	<input type="hidden" id="mrkrImg_1" name="voList[1].mrkrImg"/>
		                	</td>
		                	<td>
		                		<input type="radio" id="useYn_Y_1" name="voList[1].useYn" class="cursor" value="Y" checked="checked"/><label for="useYn_Y_1" class="cursor mar_r15">사용</label><input type="radio" id="useYn_N_1" name="voList[1].useYn" class="cursor" value="N"/><label for="useYn_N_1" class="cursor">미사용</label>
		                	</td>
		                	<td>
		                		<span class="code_btns" style="position: static;">
									 <a href="javascript:void(0);" class="mar_r15" onclick="fncSortAction(1, 'up');return false;">▲</a><a href="javascript:void(0);" onclick="fncSortAction(1, 'down');return false;">▼</a>
								</span>
		                	</td>
		                	<td>
		                		<button type="button" class="btn btn_i_del" onclick="fncDelMrkr(1);return false;"><span>삭제</span></button>
		                	</td>
		                </tr>
	            	</c:otherwise>
	            </c:choose>
            </tbody>
        </table>
    </div>
    <div class="btn_area right">
    	<c:if test="${sessionScope.SECURITY_SESSION_WRITE_KEY eq 'W' || sessionScope.SECURITY_SESSION_WRITE_KEY eq 'M'}">
    		<c:choose>
	    		<c:when test="${not empty maMapVO.mapMngSn}">
	    			<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" onclick="fncBtnAction('update');return false;">수정</a>
	   				<a href="javascript:void(0);" class="btn btn_mdl btn_del" onclick="fncBtnAction('delete');return false;">삭제</a>		
	   			</c:when>
	   			<c:otherwise>
		    		<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" onclick="fncBtnAction('insert');return false;">등록</a>
	   			</c:otherwise>
    		</c:choose>
	    </c:if>
    	<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="fncBtnAction('list');return false;">취소</a>
    </div>
</form>
 
<script type="text/javascript">
$("document").ready(function(){
	<%-- 로고이미지 파일 처리 --%>
	$("#mapLogoImgUpload").html(setFileList("${maMapVO.mapLogoImg }", "mapLogoImg", "image", 1));
	
	<%-- 마커이미지 파일 처리 --%>
	<c:choose>
		<c:when test="${fn:length(mapMrkrList) gt 0 }">
			<c:forEach var="list" items="${mapMrkrList }" varStatus="status">
				$("#mrkrImgUpload_${status.count }").html(setFileList("${list.mrkrImg}", "mrkrImg_${status.count }", "image", 1));
			</c:forEach>
		</c:when>
		<c:otherwise>
			$("#mrkrImgUpload_1").html(setFileList("", "mrkrImg_1", "image", 1));
		</c:otherwise>
	</c:choose>
	
});

<%-- API관리 팝업 --%>
function fncPopApi(){
	fncAjax("popApi.do", {}, "HTML", true, "", function(data){
		modal_show("1200px","420px",data);
		return false;
	});
}

<%-- 마커 순서 변경 --%>
function fncSortAction(idx, divn){
	var sortVal = $("#seqo_"+idx).val();
	if(divn == "up" && sortVal == "1"){
		alert("첫번째 항목입니다");
		return false;
	}
	if(divn == "down" && sortVal == $("[id^='tr_mrkr_']").length){
		alert("마지막 항목입니다");
		return false;
	}
	var tempHtml = $("#tr_mrkr_"+idx).clone();
	var target = "";
	if(divn == "up"){
		target = $("#tr_mrkr_"+idx).prev();
		$("#tr_mrkr_"+idx).remove();
		target.before(tempHtml);
	}
	if(divn == "down"){
		target = $("#tr_mrkr_"+idx).next();
		$("#tr_mrkr_"+idx).remove();
		target.after(tempHtml);
	}
	fncSortMrkr();
}

<%-- 마커 순서 정리 --%>
function fncSortMrkr(){
	$("[id^='seqo_']").each(function(idx){
		$(this).val(idx+1);
		var mrkrIdx = $(this).attr("id").split("_")[1];
		$("#span_seqo_"+mrkrIdx).html(idx+1);
	});
}

<%-- 마커 삭제 --%>
function fncDelMrkr(idx){
	$("#tr_mrkr_"+idx).remove();	
	fncSortMrkr();
	if($("[id^='tr_mrkr_']").length == 0){
		fncAddMrkr();
	}
}

<%-- 마커 추가 --%>
var mrkrLength = "${empty mapMrkrList ? 1 : fn:length(mapMrkrList) }";
function fncAddMrkr(){
	mrkrLength++;
	
	var mrkrHtml = '<tr id="tr_mrkr_'+mrkrLength+'" class="cursor"><td><input type="hidden" id="seqo_'+mrkrLength+'" name="voList['+mrkrLength+'].seqo"/><span id="span_seqo_'+mrkrLength+'"></span></td>';
		mrkrHtml += '<td><span>-</span></td><td class="l"><input type="text" id="mrkrNm_'+mrkrLength+'" name="voList['+mrkrLength+'].mrkrNm" maxlength="15" style="width:100%;"/></td>';
    	mrkrHtml += '<td class="l"><input type="text" id="mrkrExpl_'+mrkrLength+'" name="voList['+mrkrLength+'].mrkrExpl" maxlength="40" style="width:100%;"/></td>';
    	mrkrHtml += '<td class="l"><div id="mrkrImgUpload_'+mrkrLength+'" class="c"></div><input type="hidden" id="mrkrImg_'+mrkrLength+'" name="voList['+mrkrLength+'].mrkrImg"/></td>';
    	mrkrHtml += '<td><input type="radio" id="useYn_Y_'+mrkrLength+'" name="voList['+mrkrLength+'].useYn" class="cursor" value="Y" checked="checked"/>';
    	mrkrHtml += '<label for="useYn_Y_'+mrkrLength+'" class="cursor" style="margin-right:15px;">사용</label>';
    	mrkrHtml += '<input type="radio" id="useYn_N_'+mrkrLength+'" name="voList['+mrkrLength+'].useYn" class="cursor" value="N"/><label for="useYn_N_'+mrkrLength+'" class="cursor">미사용</label></td>';
    	mrkrHtml += '<td><span class="code_btns" style="position: static;"><a href="javascript:void(0);" style="margin-right:15px;" onclick="fncSortAction('+mrkrLength+', \'up\');return false;">▲</a>';
    	mrkrHtml += '<a href="javascript:void(0);" onclick="fncSortAction('+mrkrLength+', \'down\');return false;">▼</a></span></td>';
    	mrkrHtml += '<td><button type="button" class="btn btn_i_del" onclick="fncDelMrkr('+mrkrLength+');return false;"><span>삭제</span></button></td></tr>';
		
	$("#table_mrkr").append(mrkrHtml);
	fncSortMrkr();
	$("#mrkrImgUpload_"+mrkrLength).html(setFileList("", "mrkrImg_"+mrkrLength, "image", 1));
}

<%-- 버튼 액션 분기 처리 --%>
function fncBtnAction(proc){
	
	if(proc == "list"){
		fncPageBoard('list','list.do');
	}else{
		
		var divn = "";
		
		if(proc == "insert" || proc == "update"){
			if(!fncSubmitChk()){
				return false;
			}else{
				divn = "submit";
			}
		}
		if(proc == "delete"){
			divn = "del";
		}
		
		fileFormSubmit("defaultFrm", proc, function () {
			if(proc == "delete"){
				alert("지도 관리 전체 데이터가 삭제됩니다");
			}
	    	fncPageBoard(divn, proc+"Proc.do");
	    });
	}
	return false;
}

<%-- 유효성 검사 --%>
function fncSubmitChk(){
	
	var submitChk = true;
	var focusId = "";

	<%-- 지도 기본정보 유효성 검사 --%>
	if(!$.trim($("#mapTtl").val())){
		alertMsg("mapTtl","red","지도 제목을 입력해주세요","B");
		submitChk = false;
		if(focusId == ""){focusId = "mapTtl"};
	}else{
		alertMsg("mapTtl");
	}
	
	var targetId = $("#td_search").children("input[type='checkbox']").eq(0).attr("id");
	if($("#td_search").children("input[type='checkbox']:checked").length == 0){
		alertMsg(targetId,"red","검색 기능을 하나 이상 선택해주세요","B");
		submitChk = false;
		if(focusId == ""){focusId = targetId};
	}else{
		alertMsg(targetId);
	}
	
	<%-- 마커 정보 유효성 검사 --%>
	if($("[id^='tr_mrkr_']").length <= 1 && !$.trim($("[id^='mrkrNm_']").first().val()) && !$.trim($("[id^='mrkrExpl_']").first().val()) && $("[id^='mrkrImgUpload_']").first().find(".totalFileCnt").val() == "0"){
		$("[id^='tr_mrkr_']").first().find("[id^='msg_']").remove();
	}else{
		$("[id^='tr_mrkr_']").each(function(idx){
			
			var mrkrIdx = $(this).attr("id").split("_")[2];
			
			if(!$.trim($("#mrkrNm_"+mrkrIdx).val())){
				alertMsg("mrkrNm_"+mrkrIdx,"red","마커명을 입력해주세요","B");
				submitChk = false;
				if(focusId == ""){focusId = "mrkrNm_"+mrkrIdx};
			}else{
				alertMsg("mrkrNm_"+mrkrIdx);
			}
			
			if(!$.trim($("#mrkrExpl_"+mrkrIdx).val())){
				alertMsg("mrkrExpl_"+mrkrIdx,"red","마커 설명을 입력해주세요","B");
				submitChk = false;
				if(focusId == ""){focusId = "mrkrExpl_"+mrkrIdx};
			}else{
				alertMsg("mrkrExpl_"+mrkrIdx);
			}
			
			if($("#mrkrImgUpload_"+mrkrIdx).find(".totalFileCnt").val() == "0"){
				alertMsg("mrkrImgUpload_"+mrkrIdx,"red","이미지를 올려주세요","B");
				submitChk = false;
				if(focusId == ""){focusId = "mrkrImgUpload_"+mrkrIdx};
			}else{
				alertMsg("mrkrImgUpload_"+mrkrIdx);
			}
		});
	}
	
	if(!submitChk){
		$("#"+focusId).focus();
	}
	return submitChk;
}
</script>