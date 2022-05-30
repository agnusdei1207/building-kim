<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
        
<%-- search --%> 
<div class="content_box">     
	<ul class="tab js-tab tab_menu">          
	    <li id="menu"><a href="javascript:void(0);" onclick="searchLog(0);">전체</a></li>
	    <li id="menu1"><a href="javascript:void(0);" onclick="searchLog(1);">업무시간 외 접속</a></li>
	    <li id="menu2"><a href="javascript:void(0);" onclick="searchLog(2);">과다 접속자관리</a></li>
	    <li id="menu3"><a href="javascript:void(0);" onclick="searchLog(3);">접속 지점이상</a></li>
	    <li id="menu4"><a href="javascript:void(0);" onclick="searchLog(4);">로그인 이상관리</a></li> 
	</ul> 
	<div class="search_box">    
		<form name="defaultFrm" id="defaultFrm" method="post">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
			<input type="hidden" id="logSeq" name="logSeq" />
			<input type="hidden" name="schEtc03" id="schEtc03" value="${searchVO.schEtc03 }"/>
			<input type="hidden" id="col1" class="text w100p" name="col1"/> 
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
									<select name="schEtc02" id="schEtc02" class="text w150 hideBtn1">
										<option value="">선택</option>
										<option value="ma">관리자</option>  
										<option value="ft">사용자</option>
									</select>
									<strong class="tit hideBtn2">기간</strong> 
									<span class="calendar_input w150 hideBtn2" >
										<input type="text" name="searchStartDate" id="searchStartDate" class="text w80p" value="${searchVO.searchStartDate }" readonly/>
									</span>   
									<span class="input_wave hideBtn2">~</span>
									<span class="calendar_input w150 hideBtn2" >
										<input type="text" name="searchEndDate" id="searchEndDate" class="text w80p" value="${searchVO.searchEndDate }" readonly/>
									</span>
									<strong class="tit hideBtn3">검색</strong>						
									<select title="구분 선택" name="searchCondition" id="searchCondition"  class="selec hideBtn3" style="width:132px;">  
										<option value="0" >전체</option>
										<option value="1" >ID</option> 
										<option value="2" >IP</option>     
									</select>
									<input type="text" name="searchKeyword" id="searchKeyword" class="text w60p hideBtn3" /> 
								</td>            
							</tr>		 
						</tbody>      
					</table>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form>
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
	 
	$("[id^=schEtc]").on("change", function(){
		fncPageBoard('addList','addList.do', '1');
	});
	              
	$("#menu"+$("#schEtc03").val()).addClass("current");
	searchLog($("#schEtc03").val());
	  	  
});
  
// 검색 구분 값 숨김 및 보여주기 
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