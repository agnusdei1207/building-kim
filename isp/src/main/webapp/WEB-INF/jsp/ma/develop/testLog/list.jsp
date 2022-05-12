<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<%-- search --%>
<div class="content_box">
	<ul class="tab js-tab tab_menu">
	    <li class="current"><a href="javascript:void(0);" onclick="searchLog(0);">전체</a></li>
	    <li><a href="javascript:void(0);" onclick="searchLog(1);">업무시간 외 접속</a></li>
	    <li><a href="javascript:void(0);" onclick="searchLog(2);">과다 접속자관리</a></li>
	    <li><a href="javascript:void(0);" onclick="searchLog(3);">접속 지점이상</a></li>
	    <li><a href="javascript:void(0);" onclick="searchLog(4);">로그인 이상관리</a></li>
	</ul>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="logSeq" name="logSeq" />
			<input type="hidden" name="schEtc03" id="schEtc03" value="${searchVO.schEtc03 }"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<table class="type03">
						<colgroup>
							<col style="width:550px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td>
									<strong class="tit hideBtn1">구분</strong>
									<form:select path="schEtc02" id="schEtc02" class="text w150 hideBtn1">
										<form:option value="" label="선택"/>
										<form:option value="ma" label="관리자"/>
										<form:option value="ft" label="사용자"/>
									</form:select>
									<strong class="tit hideBtn2">기간</strong>
									<span class="calendar_input w150 hideBtn2" >
										<form:input path="searchStartDate" id="searchStartDate" cssClass="text w80p" readonly="true"/>
									</span>
									<span class="input_wave hideBtn2">~</span>
									<span class="calendar_input w150 hideBtn2" >
										<form:input path="searchEndDate" id="searchEndDate" cssClass="text w80p" readonly="true"/>
									</span>
									<strong class="tit hideBtn3">구분</strong>						
									<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="selec hideBtn3" cssStyle="width:132px;">  
										<form:option value="0" label="전체"/>
										<form:option value="1" label="ID"/>
										<form:option value="2" label="성명"/>
									</form:select>
									<form:input path="searchKeyword" id="searchKeyword" class="text w60p hideBtn3" /> 
								</td>
							</tr>		
						</tbody>
					</table>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%-- //search --%>
	<div class="tbl">
	</div>
</div>
	
<script type="text/javaScript">
$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
	fncDate('searchStartDate','searchEndDate');
	$(".hideBtn3").hide();
});

function searchLog(val){
	$(".hideBtn2").show();
	$(".hideBtn3").hide();	
	if(val == 0){
		<%-- 전체탭 클릭시 --%>
		$("#schEtc03").val("");
		$("#schEtc02").val("");
		$(".hideBtn1").show();
		fncPageBoard('addList','addList.do',1);
		return false;
	}else {
		<%-- 전체탭 이외 클릭시 --%>
		$("#schEtc03").val(val);
		$("#schEtc02").val("ma");		
		$(".hideBtn1").hide();			
		if(val == 4){
			$(".hideBtn2").hide();
			$(".hideBtn3").show();
		}
		fncPageBoard('addList','addList.do',1);
		return false;
	}
}
</script>