<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
  
<div class="search_box">                 
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
							<strong class="tit hideBtn3" style="margin-left:-20px;font-size: 15px;">검색</strong>						
							<select title="구분 선택" id="searchSelect" class="selec hideBtn3" style="width:132px;">  
								<option value="0" >전체</option>
								<option value="1" >제목</option> 
								<option value="2" >내용</option>      
							</select>               
							<input type="text" id="searchWord" class="text w85p hideBtn3" style="width:633px;" /> 
						</td>            
					</tr>		     
				</tbody>        
			</table>       
			<span class="search_btns">      
				<button type="button" class="btn btn_search" onclick="search();">검색</button>
			</span>
		</div> 
	</fieldset>     
</div>    
  
  
<script type="text/javaScript">               
                                 
$(function(){     
	     
	<%-- 목록 버튼 누를 시 검색햤던 조회 기록 유지 --%>        
	$("#searchWord").val($("#searchKeyword").val());
	if($("#searchCondition").val()){
		$("#searchSelect").val($("#searchCondition").val()).prop("selected", true);
	}
	fncPageBoard('addList','addList.do', '${searchVO.pageIndex}'); 
});       
      
<%-- 검색 버튼 엔터 감지 --%>                           
$("#searchWord").keypress(function(e){      
	if (e.keyCode == 13) { 
		$("#searchCondition").val($("#searchSelect").val());  
		$("#searchKeyword").val($("#searchWord").val());
		fncPageBoard('addList','addList.do', '1');   
	 }
});         
<%-- 검색 버튼 --%>
function search(){     
	$("#searchCondition").val($("#searchSelect").val());
	$("#searchKeyword").val($("#searchWord").val());
	fncPageBoard('addList','addList.do', '1');
} 
        
</script>