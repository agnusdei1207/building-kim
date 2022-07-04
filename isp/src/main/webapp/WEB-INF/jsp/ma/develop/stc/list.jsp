<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<%-- content --%>   
<div class="content_box">  
	<ul class="tab js-tab tab_menu">
	    <li class="btn_tap current"><a href="javascript:void(0)" onclick="fncClickTab('Y')">년도별</a></li>
	    <li class="btn_tap"><a href="javascript:void(0)" onclick="fncClickTab('M')">월별</a></li>
	</ul>     
	<%-- search  --%>             
	<div class="search_box">     
		<form name="defaultFrm" id="defaultFrm" method="post"> 
			<input type="hidden" id="seq" name="seq"/>       
			<input type="hidden" id="pageIndex" name="pageIndex"/> 
			<input type="hidden" name="schEtc01" id="schEtc01" value="<c:out value='${searchVO.schEtc01}'/>"/>
			<fieldset>       
				<legend>검색</legend>        
				<div class="search_basic">   
					<strong class="tit">연도</strong>    
					<select name="schEtc02" id="schEtc02" title="구분 선택" class="w100">    
						<option value="">전체</option>     
						<c:if test="${fn:length(yearsList) gt 0 }">
							<c:forEach var="year" items="${yearsList }">
								<option value="${year.visitDate }">${year.visitDate }</option>    
							</c:forEach>  
						</c:if>         
					</select>        
					<strong class="tit">통신사</strong>    
					<select name="schEtc03" id="schEtc03" title="구분 선택" class="w100">  
						<option value="">전체</option>  
						<c:if test="${fn:length(comList) gt 0 }">
							<c:forEach var="com" items="${comList }"> 
								<option value="${com.com }">${com.com }</option>
							</c:forEach>
						</c:if>
					</select>     
					<strong class="tit">권역</strong>    
					<select name="schEtc04" id="schEtc04" title="구분 선택" class="w100">  
						<option value="">전체</option>  
						<c:if test="${fn:length(areaList) gt 0 }">
							<c:forEach var="area" items="${areaList }">
								<option value="${area.area }">${area.area }</option>
							</c:forEach>       
						</c:if>
					</select>          
					<strong class="tit">검색구분</strong>
					<select id="searchCondition" name="searchCondition" class="selec w100" title="구분 선택">
						<option value="0">주소</option>
					</select>  
					<input type="text" name="searchKeyword" id="searchKeyword" class="text w50p" />
					<span class="search_btns">  
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span> 
				</div>   
			</fieldset>  
		</form>  
	</div>        
	<%--// search  --%>     
	<div class="chartTbl">   
	</div>   
	<div class="tbl">
	</div>
</div>         
 
<script type="text/javaScript">  
  
$(function(){    
	<%-- 목록 --%> 
	if("${searchVO.schEtc01}" == ""){   
		$("#schEtc01").val("Y");
	}    
	fncPageBoard('addList','addList.do',1);   
	chart();
	return false;      
});
   
<%-- 차트 --%>            
function chart(){       
	var url = "chart.do"; 
	fncLodingStart();   
	$.ajax({      
		method: "POST",      
		url: url,
		data : $("#defaultFrm").serialize(),
		dataType: "HTML",
		success: function(data) {
		 	$(".chartTbl").html(data);
		 	fncLodingEnd();  
		}     
	});
};  
     
<%-- 연도 / 월별 선택 --%>
function fncClickTab(divn){    
	$("#schEtc01").val(divn);    
	fncPageBoard('addList','addList.do',1);  
	chart();
	return false;
};  
   
<%-- 구분 값 검색 --%>  
$("[id^=schEtc]").change(function(){
	fncPageBoard('addList','addList.do',1); 
	chart();
	return false;
});  
     
<%--검색 Enter 감지 --%>     
$("#searchKeyword").focus(function(events){
	if(events.keyCode == "13"){
		fncPageBoard('addList','addList.do',1);
		chart();
	}
	return false;
});

</script>