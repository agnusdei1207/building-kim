<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<%-- content --%>
<div class="content_box">
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${searchVO.pageIndex }"/>"/>
	<input type="hidden" id="pageUnit" name="pageUnit" value="<c:out value="${searchVO.pageUnit lt 10 ? 10 : searchVO.pageUnit }"/>"/>
	<input type="hidden" id="schEtc01" name="schEtc01"/>
	<input type="hidden" id="schEtc05" name="schEtc05"/>
	<input type="hidden" id="schEtc06" name="schEtc06"/>
	<ul class="tab js-tab tab_menu">
	    <li class="btn_tap current"><a href="javascript:void(0)" onclick="fncSelTab('Y')">년도별</a></li>
	    <li class="btn_tap"><a href="javascript:void(0)" onclick="fncSelTab('M')">월별</a></li>
	</ul>
	<%-- search  --%>
	<div class="search_box">
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit hideBtn3">년도</strong>	
					<select id="schEtc02" name="schEtc02" class="selec w10p sel_year" title="구분 선택">
					</select>
					<strong class="tit hideBtn3">권역</strong>		
					<select id="schEtc03" name="schEtc03" class="selec w10p" title="구분 선택">  
					 	<option value="">전체</option>
						<option value="수도권" >수도권</option>
						<option value="경상권" >경상권</option>
						<option value="전라권" >전라권</option>
						<option value="충청권" >충청권</option>
						<option value="강원권" >강원권</option>
						<option value="제주권" >제주권</option>										
						<!-- <option value="기타" >기타</option> -->
					</select>				
					<strong class="tit hideBtn3">통신사</strong>	
					<select id="schEtc04" name="schEtc04" class="selec w10p" title="구분 선택">  
						<option value="">전체</option>
						<option value="SKT">SKT</option>
						<option value="KT">KT</option>
						<option value="LGU+">LGU+</option>
						<option value="기타">기타</option>
					</select>
					<strong class="tit">검색구분</strong>
					<select id="searchCondition" name="searchCondition" class="selec w100" title="구분 선택">
						<option value="0">주소</option>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword" class="text w40p">
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_ciapSearch">검색</button>
					</span>
				</div>
			</fieldset>
	</div>
	<%--// search  --%>
	<div class="tbl_total">
	</div>
	<br/>
	<div class="tbl">
	</div>
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	fncSelTab('${empty searchVO.schEtc01 ? "Y" : searchVO.schEtc01 }');
});
$("#searchKeyword").keydown(function(e){
	 if (e.keyCode == 13) { 
		fncTotalData();
		fncPageBoard('addList','addList.do','1');
	 }
});
$("#btn_ciapSearch").click(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
$("#schEtc02").change(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
$("#schEtc03").change(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
$("#schEtc04").change(function(){
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
});
function fncColLength(){
	$("colgroup").each(function(index){
		$(this).nextAll('tbody:first').find(".no_data").attr("colspan", $(this).children("col").length);
	});
}
function fncSelTab(divn){
	if(divn == "Y"){
		var selHtml = '<option value="" class="sel_year_option">전체</option>';
		<c:forEach var="list" items="${yearList }" varStatus="status">
			selHtml += '<option value="${list.year }">${list.year }</option>';
		</c:forEach>
		$(".sel_year").html(selHtml);
	}
	if(divn == "M"){
		$(".sel_year_option").remove();
	}
	$("#schEtc01").val(divn);
	$("#schEtc05").val("");
	$("#schEtc06").val("");
	fncTotalData();
	fncPageBoard('addList','addList.do','1');
}

function fncTotalData(){
	fncLodingStart();
	$.ajax({
		method : "POST",
		url : "totalData.do",
		data : $("#defaultFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".tbl_total").html(data);
		},error : function(req, text){
		},complete : function(){
			fncLodingEnd();
		}
	});
}
</script>