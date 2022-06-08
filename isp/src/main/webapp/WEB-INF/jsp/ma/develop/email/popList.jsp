<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.popPageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>      
</div>     
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%"> 
			<col style="width:10%">     
			<col style="width:10%">  
			<col>  
		</colgroup> 
		<thead>     
			<tr>            
				<th scope="col"><input type="checkbox" onclick="allCheck(this);" id="all_check"></th>
				<th scope="col">이름</th>  
				<th scope="col">아이디</th> 
				<th scope="col">이메일</th>    
			</tr> 
		</thead>
		<tbody>     
			<c:choose>   
				<c:when test="${fn:length(resultList) gt 0}">     
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">  
							<td>                          
								<input type="checkbox" onclick="oneCheck('${result.userDivn }', '${result.emUserSeq}', this);" name="arr" id="${result.userDivn }_${result.emUserSeq}" class="checkbox" value="${result.userDivn }_${result.emUserSeq}_${result.emId}_${result.emMail}">
							</td>      
							<td>${result.emName }</td>   
							<td>${result.emId }</td>
							<td>${result.emMail }</td>    
						</tr>  
					</c:forEach>      
				</c:when>   
				<c:otherwise>      
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose> 
		</tbody>
	</table>   
</div>    
<%-- ,tbl end --%>       
<%-- paging start --%>    
<div class="paging_wrap">      
	<div class="paging">        
		<ui:pagination paginationInfo="${paginationInfo}" type="pop" jsFunction="fncPageEtc" />
	</div> 
	<div class="btn_right">   
		<a class="btn btn_mdl btn_save" onclick="fncChoose();">선택</a>
	</div>    
</div> 
<%-- ,paging end--%>    
    
<script type="text/javascript"> 
             
$(function(){ 
	    
	var arr = $("#col1").val().split(",");   
	               
	<%-- 문자열 확인 후 체크하기 --%>      
	$(".checkbox").each(function(){   
		if(arr.indexOf(this.value) > -1){     
			 $("#"+this.id).prop("checked", true);
		}     
	}); 
	        
	<%-- 체크된 길이 확인 후 전체 체크박스 체크 --%> 
	var total = $(".checkbox").length; 
	var checked = $(".checkbox:checked").length;
	       
	if(total == checked){ 
		$("#all_check").prop("checked", true);
	}else{
		$("#all_check").prop("checked", false);
	}       
	  
	return true;
});             
             
<%-- 전체 선택 --%>  
function allCheck(obj){   
	         
	var text = $("#col1").val();
	     
	if($("#"+obj.id).prop("checked")){
		$(".checkbox").each(function(){   
			$(".checkbox").prop("checked", true); 
			text = text.replace(","+this.value, "");
		});     
		<%-- 개별 체크 상태에서 전체 체크를 눌렀을 경우를 대비 --%>
		$(".checkbox").each(function(){    
			text += "," + this.value; 
		});          
                  		   
	}else if(!$("#"+obj.id).prop("checked")){   
		$(".checkbox").prop("checked", false);   
		$(".checkbox").each(function(){   
			text = text.replace("," + this.value, "");
		});  
	}         
	$("#col1").val(text); 
	return true;
}    
 

<%-- 한 개 선택 --%> 
function oneCheck(divn, userSeq, obj){ 
	          
	var total = $(".checkbox").length; 
	var checked = $(".checkbox:checked").length;
	 
	var text = $("#col1").val(); 
	var val = $("#" + divn + "_" + userSeq).val();                   
	                                            
	            
	if($("#" + divn + "_" + userSeq).prop("checked")){       
		text += "," + val;     
	}else{                 
		text = text.replace("," + val, ""); 
	}                
     	 
	if(total == checked){ 
		$("#all_check").prop("checked", true);     
	}else{
		$("#all_check").prop("checked", false);
	} 
	 
	$("#col1").val(text); 
	return true;
}                 
    
<%-- 선택 버튼 & 목록 전송 --%>
function fncChoose(){    
	              
  	var arr = $("#col1").val().split(","); 
	var html = '';          
		             
		for(var i = 1; i < arr.length; i++){      
			var divn = arr[i].split("_")[0]; 
			var seq = arr[i].split("_")[1]; 
			var id = arr[i].split("_")[2];	     
			var mail = arr[i].split("_")[3];           
			     
			html += fncDrawList(divn, seq, id, mail);
		}                      
	         
	opener.$("#receiver").html(html); 
	opener.$("#checkedArray").val(arr);     
	self.close();                  
	return true;  
}            
                      
<%-- 선택된 목록 그리기 --%> 
function fncDrawList(divn, seq, id, mail){
	
	var info = divn + '_' + seq + '_' + id + '_' + mail;
	var id = divn + '_' + seq;
	  
	var html = "";     
		html += '<li class="mail_select_obj" data-info="'+ info +'" id="'+ id +'">';
		html += mail;                                  
		html += '<a class="mail_del btn_del cursor" onclick="fncUserDel(\''+ id +'\', \''+ info +'\');">x</a>';
		html += '</li>';
		     
	return html;
}    



</script>