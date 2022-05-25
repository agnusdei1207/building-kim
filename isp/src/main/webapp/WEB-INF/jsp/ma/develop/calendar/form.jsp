<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
      
<form name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="caSelectedYear" id="caSelectedYear" />
	<input type="hidden" name="caSelectedMonth" id="caSelectedMonth" />
	<input type="hidden" name="caSchYearMonth" id="caSchYearMonth"/>
	<input type="hidden" name="caSeq" id="caSeq" value="${calendarVO.caSeq }"/>
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
							<span class="calendar_input"><input type="text" name="caDataDate" id="caDataDate" readonly class="text"/></span>
							<label><input type="checkbox" name="caHolYn" id="caHolYn" value="Y" style="margin-left:20px;" ${calendarVO.caHolYn eq 'Y' "selected='selected'" : "" } />공휴일여부</label>
						</td>
					</tr>
					<tr> 
						<th>내용</th> 
						<td>
							<input type="text" name="caCont" id="caCont" class="text w80p" maxlength="100" value="${calendarVO.caCont }"/>
						</td> 
					</tr> 
				</tbody> 
			</table> 
		</div>
		<div class="paging_wrap">
			<div class="btn_right">
				<c:choose>
					<c:when test="${calendarVO ne null }">
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
</form> 


      


<script type="text/javascript">
     
$(document).ready(function(){
	 
	if('${searchVO.caDataDate}' != ""){ 
		$("#caDataDate").val('${searchVO.caDataDate}'.replace(/\-/gi,'.'));	
	}   
	fncDate('caDataDate'); 
	var $input = $("#caDataDate"); 
	$("#caDataDate").on('input', function() {
	    fncPageBoard("list",'form.do');
	});
}); 
 
/* (function ($) {
    var originalVal = $.fn.val;
    $.fn.val = function (value) {
        var res = originalVal.apply(this, arguments);
 
        if (this.is('input:text') && arguments.length >= 1) {
            this.trigger("input");
        }
 
        return res;
    };
}(jQuery)); */


function fncSubmit(procType){ 
	var caDataDate = $("#caDataDate").val();
	caDataDate = caDataDate.replace(/\./g,'-');
	$("#caDataDate").val(caDataDate);
	if(procType == 'update' || procType == 'insert'){
		if($.trim($("#caCont").val())==""){
			alert("내용을 입력해주세요.");
			$("#caCont").focus(); 
			return false;
		}	    
	}else if(procType == 'delete'){
		if(!confirm("일정을 삭제하시겠습니까?")){
			return false;
		}
	}
	fncPageBoard('submit',procType+'proc.do')
}

</script>