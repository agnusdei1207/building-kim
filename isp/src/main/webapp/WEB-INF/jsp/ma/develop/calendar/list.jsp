<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<head>    
<title>달력게시판</title>      
</head>    
<c:set var="nowDate" value="${util:getNowDate('yyyy-MM-dd') }" /> 
<c:set var="selectedDate" value="${searchVO.caSelectedYear}${searchVO.caSelectedMonth}${util:getNowDate('dd')}" />
    
<c:set var="firstWeekdayOfMonth" value='${util:getFirstWeekdayOfMonth(selectedDate, "yyyyMMdd")+1 }' /> 
<c:set var="lastDayOfMonth" value='${util:getLastDayOfMonth(selectedDate, "yyyyMMdd") }' /> 
<c:set var="prevYear" value='${fn:substring(util:addYearMonthDay(selectedDate, 0, -1, 0),0,4) }' /> 
<c:set var="prevMonth" value='${fn:substring(util:addYearMonthDay(selectedDate, 0, -1, 0),4,6) }' />
<c:set var="nextYear" value='${fn:substring(util:addYearMonthDay(selectedDate,  0, 1, 0),0,4) }' /> 
<c:set var="nextMonth" value='${fn:substring(util:addYearMonthDay(selectedDate, 0, 1, 0),4,6) }' />                
                                             
<div class="content_box">           
	<div class="wrap_cal marTy01">       
		<form name="defaultFrm" id="defaultFrm" method="post">
			<input type="hidden" name="caSelectedYear" id="caSelectedYear" value="${searchVO.caSelectedYear }" />
			<input type="hidden" name="caSelectedMonth" id="caSelectedMonth" value="${searchVO.caSelectedMonth }"/>
			<input type="hidden" name="caSchYearMonth" id="caSchYearMonth" value="${searchVO.caSchYearMonth }"/> 
			<input type="hidden" name="caDataDate" id="caDataDate">   
			<fieldset> 
				<legend>달력 게시판</legend>
				<div class="cal_top">
					<div class="monthly"> 
						<a href="javascript:void(0)" class="btn_prev_cal" onclick="fncGoMonth('${prevYear }','${prevMonth }');">&lt;<span class="hide">이전</span></a>
						<strong class="cal_tit"><span class="inlineBlock"><c:out value="${searchVO.caSelectedYear }" />년</span> 
						<span class="inlineBlock"><c:out value="${searchVO.caSelectedMonth }" />월</span></strong>
						<a href="javascript:void(0)" class="btn_next_cal" onclick="fncGoMonth('${nextYear }','${nextMonth }');">&gt;<span class="hide">다음</span></a>
					</div>
				</div> 
				<table class="table_cal" summary="일정 상세정보 달력입니다.">
					<caption></caption>
					<colgroup>  
						<col style="width:12%;" />
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
								<c:set var="printDate" value="${searchVO.caSelectedYear }-${searchVO.caSelectedMonth }-${util:lpad(printDay, 2, '0') }" />
								<c:set var="prtDate" value="${searchVO.caSelectedYear }.${searchVO.caSelectedMonth }.${util:lpad(printDay, 2, '0') }" />
								<c:set var="detailDate" value="${searchVO.caSelectedYear }.${searchVO.caSelectedMonth }.${util:lpad(printDay, 2, '0') }"/>
								<td onclick="fncInsert('${detailDate }');">
									<div class="td_cont ${printDate eq nowDate ? 'today' : '' }">
										<div class="day">
											<c:if test="${printDate eq nowDate}"><span class="txt_today">today</span></c:if>
											<a><c:out value="${printDay }" /></a>     
										</div>   
										<c:forEach var="result" items="${resultList }">
											<div>   
												<c:if test="${result.caDataDate eq prtDate }"><a href="#" class="cutText">
													<span class="<c:if test="${result.caHolYn eq 'Y' }">txt_holiday</c:if>">${result.caCont }</span></a>
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
		</form> 
	</div><%-- //wrap_cal --%>
</div>
    
   
<script type="text/javascript"> 
    
function fncGoMonth(year, month) {
	$("#caSelectedYear").val(year);
	$("#caSelectedMonth").val(month);
	$("#caSchYearMonth").val(year+month);
	$("#defaultFrm").attr({"action" : "list.do", "method" : "post", "target":"_self"}).submit();
};
 
function fncInsert(date){
	$("#caDataDate").val(date);
	fncPageBoard('write','form.do');
}

</script>


