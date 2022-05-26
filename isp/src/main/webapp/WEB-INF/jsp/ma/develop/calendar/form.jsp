<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
               
<form name="defaultFrm" id="defaultFrm" method="post">            
	<div class="content_box">           
		<a href="javascript:void(0)" id="add_btn" class="btn btn_mdl btn_rewrite" onclick="fncAddFrm();">추가</a>
		<c:if test="${fn:length(resultList) gt 0 }"> 
			<c:forEach var="result" items="${resultList }" varStatus="status">
				<div id="tbl_wrap_${status.count }">
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
										<span class="calendar_input">
											<input type="text" name="caDataDate" id="caDataDate_${status.count }" readonly value="${result.caDataDate }"/>
										</span>    
										 <input type="checkbox" name="caHolYn" id="caHolYn_${status.count }" value="Y" ${result.caHolYn eq 'Y' ? "checked" : "" } style="margin-left:20px;" /> 공휴일여부
									</td>     
								</tr>           
								<tr>       
									<th>내용</th>                    
									<td>   
										<input type="text" name="caCont" id="caCont_${status.count }" class="text w70p" maxlength="100" value="${result.caCont }"/>
									</td>             
								</tr>   
								<tr style="display:none">            
									<th>SEQ</th>                      
									<td>     
										<input type="text" name="caSeq" id="caSeq_${status.count }" class="text w70p" maxlength="11" value="${result.caSeq }"/>
									</td>  
								</tr>     
								<tr>      
									<th>버튼</th>    
									<td> 
										<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncDelBtn(${status.count }, ${result.caSeq});">삭제</a>
										<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncInsertBtn(${status.count });">등록 </a>
									</td>
								</tr> 
							</tbody>            
						</table>      
					</div>    
				</div>        
			</c:forEach>         
		</c:if>     
		<div class="add_point">      
		</div>       
		<div class="paging_wrap">        
			<div class="btn_right">     
				<a href="javascript:void(0);" class="btn btn_mdl btn_list" id="btn_list"><strong>목록</strong></a>
			</div>   
		</div> 
	</div>    
</form>   
        

           
          
        
<script type="text/javascript">  
    
var caDataDate = "${searchVO.caDataDate}";
     
$(document).ready(function(){  
	if("${fn.length(resultList)}" < 1){
		fncAddFrm();   
	}else if($("[id^=tbl_wrap_").length > 3){
		$("#add_btn").hide();
	}else{
		$("#add_btn").show();   
	}
});                
                
function fncAddFrm(){      
	   
	var num = $("[id^=tbl_wrap_").length + 1;   
	
	if(num > 3){   
		alert("3개를 초과할 수 없습니다."); 
		return false;   
	}   
	                   
	var html = '';  
		html = 	'<div id="tbl_wrap_'+num+'">';  
		html += 	'<div class="tbl_wrap mar_t20">'; 
		html += 		'<table class="tbl_row_type01">';
		html += 			'<colgroup>';
		html += 				'<col width="20%">';          
		html += 				'<col>'; 
		html += 			'</colgroup>';      
		html += 			'<tbody>';
		html += 				'<tr>'; 
		html += 					'<th>날짜 </th> '; 
		html += 					'<td>';
		html += 						'<span class="calendar_input"><input type="text" name="caDataDate" id="caDataDate_'+num+'" readonly class="text" value="'+caDataDate+'"/></span>';
		html += 						'<input type="checkbox" name="caHolYn" id="caHolYn_'+num+'" value="Y" style="margin-left:20px;" /> 공휴일여부';
		html += 					'</td>';  
		html += 				'</tr>';   
		html += 				'<tr>'; 
		html += 					'<th>내용</th>';          
		html += 					'<td>'; 
		html += 						'<input type="text" name="caCont" id="caCont_'+num+'" class="text w80p" maxlength="100" />';
		html += 					'</td>';
		html += 				'<tr style="display:none">';
		html += 					'<th>seq</th>';          
		html += 					'<td>';           
		html += 						'<input type="text" name="caSeq" id="caSeq_'+num+'" class="text w80p" maxlength="10" value="N" />';
		html += 					'</td>';
		html += 				'</tr>';  
		html += 				'<tr>';          
		html += 					'<th>버튼</th>';           
		html += 					'<td>';              
		html += 						'<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncDelBtn('+num+');">삭제</a>'; 
		html += 						'<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncInsertBtn('+num+');">등록</a>';
		html += 					'</td>';
		html += 				'</tr>';  
		html += 			'</tbody>';
		html += 		'</table>';        
		html += 	'</div>';  
		html += '</div>';
		 
	$(".add_point").after(html); 
         
	if(num >= 3){   
		$("#add_btn").hide();
	} 
	        
	
	return true; 
} 
  
  
function fncSubmit(){   
	var caDataDate = $("#caDataDate").val();
	caDataDate = caDataDate.replace(/\./g,'-');
	$("#caDataDate").val(caDataDate);
}
 
function fncInsertBtn(num){
	           			
	var caHolYn = "";  
	var caCont = ""; 
	 
	if(!$("#caHolYn_"+num).is(":checked")){
		caHolYn = "N";
	}  
	   
	caCont = $('#caCont_'+num).val();
	
	$.ajax({
		method : "POST",
		url : "insertContents.do",
		data : {"caDataDate" : caDataDate, "caHolYn" : caHolYn, "caCont" : caCont},
		dataType : "HTML", 
		succsess : function(data){
			alert("입력 성공 : " + data);
			 
		}
	})    
}
      
function fncDelBtn(num, seq){
	      
	if(!confirm("삭제하시겠습니까?")){   
		return false;
	}             
		                           
	alert($("#tbl_wrap_" + num));
	if(typeof seq == "undefined" || seq == null || seq == ""){
		$("#tbl_wrap_" + num).remove();
		if($("[id^=tbl_wrap_]").length < 1){  
			fncAddFrm();
		}         
	}else{              
		$.ajax({      
			method : "POST",  
			url : "deleteContents.do",
			data : {"caSeq" : seq},
			dataType : "HTML",
			succsess : function(data){
				alert("삭제 성공 : " + data);
				$("#tbl_wrap_" + num).remove();
				if($("[id^=tbl_wrap_]").length < 1){  
					fncAddFrm();
				}    
			} 
		})
	}      
}







</script>