<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ft/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<head>
<title>달력게시판</title>   
</head>
<c:set var="nowDate" value="${util:getNowDate('yyyy-MM-dd') }" />
<c:set var="selectedDate" value="${searchVO.selectedYear}${searchVO.selectedMonth}${util:getNowDate('dd')}" />
<c:set var="firstWeekdayOfMonth" value='${util:getFirstWeekdayOfMonth(selectedDate, "yyyyMMdd")+1 }' />
<c:set var="lastDayOfMonth" value='${util:getLastDayOfMonth(selectedDate, "yyyyMMdd") }' />
<c:set var="prevYear" value='${fn:substring(util:addYearMonthDay(selectedDate, 0, -1, 0),0,4) }' />
<c:set var="prevMonth" value='${fn:substring(util:addYearMonthDay(selectedDate, 0, -1, 0),4,6) }' />
<c:set var="nextYear" value='${fn:substring(util:addYearMonthDay(selectedDate,  0, 1, 0),0,4) }' />
<c:set var="nextMonth" value='${fn:substring(util:addYearMonthDay(selectedDate, 0, 1, 0),4,6) }' />

<script type="text/javascript">
var fncGoMonth = function(year, month) {
	$("#selectedYear").val(year);
	$("#selectedMonth").val(month);
	$("#schYearMonth").val(year+month);
	$("#defaultFrm").attr({"action" : "list.do", "method" : "post", "target":"_self"}).submit();
};

function fncInsert(date){
	$("#dataDate").val(date);
	fncPageBoard('write','form.do');
}
</script>
<div class="content_box">
	<div class="wrap_cal marTy01">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
			<input type="hidden" name="selectedYear" id="selectedYear" />
			<input type="hidden" name="selectedMonth" id="selectedMonth" />
			<input type="hidden" name="schYearMonth" id="schYearMonth"/>
			<input type="hidden" name="dataDate" id="dataDate">
			<fieldset>
				<legend>달력 게시판</legend>
				<div class="cal_top">
					<div class="monthly">
						<a href="#" class="btn_prev_cal" onclick="fncGoMonth('${prevYear }','${prevMonth }');">&lt;<span class="hide">이전</span></a>
						<strong class="cal_tit"><span class="inlineBlock"><c:out value="${searchVO.selectedYear }" />년</span> 
						<span class="inlineBlock"><c:out value="${searchVO.selectedMonth }" />월</span></strong>
						<a href="#" class="btn_next_cal" onclick="fncGoMonth('${nextYear }','${nextMonth }');">&gt;<span class="hide">다음</span></a>
					</div>
				</div>
				<table class="table_cal" summary="일정 상세정보 달력입니다.">
					<caption></caption>
					<colgroup>
						<col style="width:12%;"  />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:13%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><span>일</span></th>
							<th scope="col"><span>월</span></th>
							<th scope="col"><span>화</span></th>
							<th scope="col"><span>수</span></th>
							<th scope="col"><span>목</span></th>
							<th scope="col"><span>금</span></th>
							<th scope="col"><span>토</span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%-- 한주 시작부터 첫째날 전까지 빈칸 삽입 시작 --%>
							<c:if test="${firstWeekdayOfMonth != 8 }">
								<%-- 일요일이 아닐 경우 빈칸 삽입 --%>
								<c:forEach var="headerBlank" begin="1" end="${firstWeekdayOfMonth-1 }" step="1">
									<td><div class="td_cont blank"><div class="day"></div></div></td>
								</c:forEach>
							</c:if>
							<%-- 한주 시작부터 첫째날 전까지 빈칸 삽입 끝 --%>
							<%-- 시작일부터 마지막 일자까지 달력 생성 --%>
							<c:forEach var="printDay" begin="1" end="${lastDayOfMonth }" step="1" varStatus="status">
								<%-- 헤더 공백포함 총 갯수 --%>
								<c:set var="k" value="${printDay + firstWeekdayOfMonth-1 }" />
								<c:set var="printDate" value="${searchVO.selectedYear }-${searchVO.selectedMonth }-${util:lpad(printDay, 2, '0') }" />
								<c:set var="prtDate" value="${searchVO.selectedYear }.${searchVO.selectedMonth }.${util:lpad(printDay, 2, '0') }" />
								<c:set var="detailDate" value="${searchVO.selectedYear }.${searchVO.selectedMonth }.${util:lpad(printDay, 2, '0') }"/>
								<td onclick="fncInsert('${detailDate }');">
									<div class="td_cont ${printDate eq nowDate ? 'today' : '' }">
										<div class="day">
											<c:if test="${printDate eq nowDate}"><span class="txt_today">today</span></c:if>
											<a><c:out value="${printDay }" /></a>
										</div>
										<c:forEach items="${resultList }" var="result" varStatus="status">
											<div>
												<c:if test="${result.dataDate eq prtDate }"><a href="#" class="cutText">
													<span class="<c:if test="${result.holYn eq 'Y' }">txt_holiday</c:if>">${result.calCont }</span></a>
												</c:if>
											</div>
										</c:forEach>
									</div>
								</td>
								<c:if test="${k % 7 == 0}">
									</tr>
									<tr>
								</c:if>
							</c:forEach>
							<%-- 마지막날부터 한주 끝까지  빈칸 삽입 시작 --%>
							<c:if test="${k % 7 != 0}">
								<%-- 일요일이 아닐 경우 빈칸 삽입 --%>
								<c:forEach var="footerBlank" begin="${k % 7}" end="6" step="1">
									<td>
										<div class="td_cont blank"><div class="day"></div></div>
									</td>
								</c:forEach>
							</c:if>
							<%-- 마지막날부터 한주 끝까지 빈칸 삽입 끝 --%>
						</tr>
					</tbody>
				</table>
				<br>
			</fieldset>
		</form:form>
	</div><%-- //wrap_cal --%>
</div>
<%-- popupList --%>
<%-- <c:if test="${not empty popList }">
	<div class="index_popup"  id="id_popup1" style="position:absolute;left:300px;top:200px; width:300px;height:300px;z-index:9999;">
		<div class="id_popup">
			<div class="id_pop_header">
				<h1 class="pop_tit">기념일 안내</h1>
				<a href="javascript:void(0);" onclick="id_view_hide(1); return false;" class="pop_close"></a>
			</div>
			<div class="id_pop_content">
				 <div class="pop_cont_text"><c:forEach items="${popList }" var="result"><p>${result.startTime}~${result.endTime}</p><p>&nbsp;&nbsp;- ${result.calCont }</p><br></c:forEach></div>
				 <div class="pop_close" style="margin-top:-10px"><input type="checkbox" onClick="closeMap('1');" style="margin-top:-1px;vertical-align: middle;">오늘 하루 동안 열지 않음</div>
			</div>
		</div>
	</div>
</c:if> --%>
<%-- popupList --%>