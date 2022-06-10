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
				<th scope="col"><input type="checkbox" onclick="fncAllCheck(this);" id="all_check"></th>
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
								<input type="checkbox" onclick="fncOneCheck(this);" name="arr" id="${result.userDivn }_${result.emUserSeq}" class="checkbox" value="${result.userDivn }_${result.emUserSeq}&${result.emId}_${result.emMail}">
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
		<a class="btn btn_mdl btn_save" onclick="fncPopChoose();">선택</a>
	</div>    
</div>   
<%-- ,paging end--%>    
    
<script type="text/javascript">  

   
var checked = window.opener.checked;
                
$(function(){
	for(var i = 0; i < checked.length; i++){
		var id = checked[i].split("&")[0];     
		$("#" + id).prop("checked", true);
	}         
	fncCheckLength(); 
	return true;      
})           
    
<%-- 전체 체크 --%>  
function fncAllCheck(obj){      
	if(obj["checked"]){
		$(".checkbox").each(function(){ 
			<%-- 중복 방지 : 배열에 있는 값 지우기 --%>
			if($("#" + this.id).prop("checked")){
				checked.splice(checked.indexOf(this.value), 1);   
			}   
			<%-- 체크 --%>
			$("#" + this.id).prop("checked", true);
			<%-- 배열에 추가 --%>
			checked.push(this.value); 
		});        
	}else if(!obj["checked"]){
		$(".checkbox").each(function(){       
			$("#" + this.id).prop("checked",false);
			checked.splice(checked.indexOf(this.value), 1);
		});
	}  
	fncCheckLength();
	return true;
} 
 
<%-- 개별 체크 --%> 
function fncOneCheck(obj){
	if(obj["checked"]){
		checked.push(obj.value);
	}else{    
		$("#" + obj.id).prop("checked", false);
		checked.splice(checked.indexOf(obj.value), 1);
	}
	fncCheckLength();
	return true;    
}  


<%-- 체크 상태 체크 --%>    
function fncCheckLength(){
	var total = $(".checkbox").length;
	var check = $(".checkbox:checked").length;
	
	if(total==check){
		$("#all_check").prop("checked", true);
	}else{   
		$("#all_check").prop("checked", false);
	}
	return true;
}

<%-- 선택 버튼 --%>
function fncPopChoose(){
	var html = "";        
	for(var i = 0; i < checked.length; i++){  
		var id = checked[i].split("&")[0];           
		var mail = checked[i].split("&")[1];
		<%-- id 중복 방지를 위해 hyphen '-' 사용--%>
		html += '<li class="mail_select_obj" id="'+ id +'-">';     
		html += mail;                                              
		html += '<a class="mail_del btn_del cursor" onclick="fncUserDel(\''+ id +'\', \''+ checked[i] +'\');">x</a>';
		html += '</li>';
	}         
	<%-- 목록 생성 --%>  
	opener.$("#receiver").html(html);
	<%-- 리스트 닫기 --%>
	self.close();
	return true;
}


</script>