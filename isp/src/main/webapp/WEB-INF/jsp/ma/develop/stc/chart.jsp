<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- 차트 --%>   
<div class="main_chart">        
	<h4 class="tit_page" style="font-size: 20px;">전자파 민원 통계 현황</h4>
	<br/>   
	<div class="chart_box">
		<div id="chart01" class="w100p" style="height:100%"></div>
	</div>
</div>
    
<%-- 엑셀 업로드 & 다운 --%>           
<div class="tbl_top mar_t15">         
	<div class="tbl_left"></div>      
	<div class="tbl_right">           
        <a href="javascript:void(0);" class="btn btn_excel btn_sml03" onclick="fncPageBoard('list','excelDown.do')"><span>엑셀 다운로드</span></a>  
        <a href="javascript:void(0);" class="btn btn_save btn_sml03" onclick="fncAddFileForm();" style="background-color:#308cde; border-color:#308cde;">데이터 등록</a>
    </div>																								
</div> 
  
<%-- 조회 목록 테이블 --%>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>   
		<colgroup>    
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">  
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>  
		<thead>    
			<tr>
				<th scope="col">연도</th> 
				<th scope="col">수도권</th>
				<th scope="col">경상권</th>
				<th scope="col">충청권</th>
				<th scope="col">전라권</th>
				<th scope="col">강원권</th>
				<th scope="col">제주권</th>
				<th scope="col">합계</th>    
			</tr>         
		</thead>              
		<tbody>       
			<c:choose>      
				<c:when test="${fn:length(resultList) gt 0}">            
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>      
							<td>${result.visitTime }</td>       
							<td class="r"><fmt:formatNumber  value="${result.area1}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','수도권');"> 건</a></td>     
							<td class="r"><fmt:formatNumber  value="${result.area2}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','경상권');"> 건</a></td> 
							<td class="r"><fmt:formatNumber  value="${result.area3}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','충청권');"> 건</a></td> 
							<td class="r"><fmt:formatNumber  value="${result.area4}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','전라권');"> 건</a></td> 
							<td class="r"><fmt:formatNumber  value="${result.area5}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','강원권');"> 건</a></td> 
							<td class="r"><fmt:formatNumber  value="${result.area6}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','제주권');"> 건</a></td> 
							<td class="r"><fmt:formatNumber  value="${result.total}" pattern="#,###" /><a href="javascript:void(0);" onclick="fncAddList('${result.visitDate}','기타');"> 건</a></td> 
						</tr>       
					</c:forEach>   
				</c:when>       
				<c:otherwise>    
					<tr><td colspan="8" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>    
</div> 

<script> 
<%-- 차트 배열 --%>
var arrData = new Array();
var arrCategory = new Array(); 
         
$(function(){       
	if("${fn:length(resultList)}" > 0){
		<c:forEach var="result" items="${resultList}">         
			<%-- 조회 결과 : 레코드 합계 --%>   
			arrData.push(Number('<c:out value='${result.area1 + result.area2 + result.area3 + result.area4 + result.area5 + result.area6}'/>'));  
			arrCategory.push('<c:out value='${result.visitTime }'/>');  
		</c:forEach>    
	}    
});   

<%-- 하이차트 --%>
Highcharts.chart('chart01', {
    chart: {  
        type: 'column'  
    },
    title: false,
    navigation: {
       buttonOptions: {
         y: -1000 //차트 다운버튼 화면에서 숨김
       }
    },   
    credits: {
       enabled: false //하단 하이차트 주소 숨김
    },  
    yAxis: {
        title: false,   
        labels : {
            format: '{value:,.0f}'
        }
    },
    xAxis: {
     categories: arrCategory
    },
    plotOptions: {
        line: {
          dataLabels: {
            enabled: true  
          }
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span>',
        pointFormat: '<table><tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:,.0f}건</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },  
    series: [{ 
		name: '민원합계',
		data: arrData,  
		color:'#308cde',  
		pointWidth: 40,
		dataLabels: {
		    enabled: true, // 차트(막대) 안의 데이터 표기 여부 (true : 표기, false : 미표기)
		    rotation: 0, // 차트(막대) 안의 데이터 텍스트 각도 
		    color: '#FFFFFF', // 차트(막대) 안의 데이터 텍스트 색상
		    align: 'right', // 정렬
		    format: '{point.y:,.0f}', // one decimal
		    style: {    
		      fontSize: '13px',
		      fontFamily: 'Verdana, sans-serif'
		    }
		  }
    }] 
});
Highcharts.setOptions({
    lang : {
       thousandsSep:',' 
    }
}); 

<%-- 파일 업로드 modal 열기 --%>
function fncAddFileForm(){
	$.ajax({
	    method: "POST",
	    url: "addFileForm.do",	    
	    dataType: "HTML",  
	    success: function(data) { 
	    	$("#display_view1").html(data);
	    	view_show(1);
	    }
	});	
}  

<%-- 목록 클릭 시 조회 --%>  
function fncAddList(schEtc05, schEtc06){
	$("#schEtc05").val(schEtc05); // 방문일
	$("#schEtc06").val(schEtc06); // 권역
	fncPageBoard('addList','addList.do','1');
}
</script>