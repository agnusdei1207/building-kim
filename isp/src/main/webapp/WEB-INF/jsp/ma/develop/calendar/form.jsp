<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>


<style>
.font_red {color:#ff6565; font-weight:bold;}
</style>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="selectedYear" id="selectedYear" />
	<input type="hidden" name="selectedMonth" id="selectedMonth" />
	<input type="hidden" name="schYearMonth" id="schYearMonth"/>
	<input type="hidden" name="calSeq" id="calSeq" value="${caVO.calSeq }"/>
	<div class="content_box">
		<div class="tbl_wrap mar_t20">
			<table class="tbl_row_type01">
				<colgroup>
					<col width="20%">
					<col> 
				</colgroup>
				<tbody>
					<tr>
						<th>날짜 </th>
						<td>
							<span class="calendar_input"><form:input path="dataDate" id="dataDate" readonly="true" class="text"/></span>
							<label><input type="checkbox" name="holYn" id="holYn" value="Y" style="margin-left:20px;" <c:if test="${caVO.holYn eq 'Y' }">checked="checked"</c:if> />공휴일여부</label>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<input type="text" name="calCont" id="calCont" class="text w80p" maxlength="100" value="${caVO.calCont }"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="paging_wrap">
			<div class="btn_right">
				<c:choose>
					<c:when test="${caVO ne null }">
						<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncSubmit('update')">수정</a>
						<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncSubmit('delete')">삭제</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncSubmit('insert')">등록</a>	
					</c:otherwise>
				</c:choose>
				<a href="javascript:void(0);" class="btn btn_mdl btn_list" id="btn_list"><strong>목록</strong></a>
			</div>
		</div>
	</div>
</form:form>





<script type="text/javascript">
$(document).ready(function(){
	if('${searchVO.dataDate}' != ""){
		$("#dataDate").val('${searchVO.dataDate}'.replace(/\-/gi,'.'));	
	}
	fncDate('dataDate');
	var $input = $("#dataDate"); 
	$("#dataDate").bind('input', function() {
	    fncPageBoard("list",'form.do');
	});
});
(function ($) {
    var originalVal = $.fn.val;
    $.fn.val = function (value) {
        var res = originalVal.apply(this, arguments);
 
        if (this.is('input:text') && arguments.length >= 1) {
            this.trigger("input");
        } 
 
        return res;
    };
}(jQuery));

function fncSubmit(procType){
	var dataDate = $("#dataDate").val();
	dataDate = dataDate.replace(/\./g,'-');
	$("#dataDate").val(dataDate);
	if(procType == 'update' || procType == 'insert'){
		if($.trim($("#calCont").val())==""){
			alert("내용을 입력해주세요.");
			$("#calCont").focus();
			return false;
		}	
	}else if(procType == 'delete'){
		if(!confirm("일정을 삭제하시겠습니까?")){
			return false;
		}
	}
	fncPageBoard('submit',procType+'proc.do')
}
function fnc(){
	alert("123");
}
</script>