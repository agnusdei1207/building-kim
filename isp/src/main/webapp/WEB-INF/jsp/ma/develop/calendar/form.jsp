<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
               
<form name="defaultFrm" id="defaultFrm" method="post">             
	<div class="content_box">                  
		<input type="text" name="caDataDate" id="caDataDate" value="${searchVO.caDataDate }">
		<a href="javascript:void(0)" id="add_btn" class="btn btn_mdl btn_rewrite" onclick="fncAddFrm();">추가</a>  
			      
		<div class="tbl">      
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
	          
	fncPageBoard("addList", "addView.do");
	
	if($("[id^=tbl_wrap_").length > 3){
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
		html += 					'<th>공휴일 여부 '+num+' </th> '; 
		html += 					'<td>';
		html += 						'<input type="checkbox" name="caHolYn" id="caHolYn_'+num+'" value="Y" style="margin-left:20px;" />';
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
		html += 						'<input type="text" name="caSeq" id="caSeq_'+num+'" class="text w80p" maxlength="10" value="" />';
		html += 					'</td>';
		html += 				'</tr>';  
		html += 				'<tr>';          
		html += 					'<th>버튼</th>';           
		html += 					'<td>';              
		html += 						'<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncDelBtn('+num+');">삭제111</a>'; 
		html += 						'<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncInsertBtn('+num+');">등록</a>';
		html += 					'</td>';
		html += 				'</tr>';  
		html += 			'</tbody>';
		html += 		'</table>';        
		html += 	'</div>';  
		html += '</div>'; 
		                 
	$(".tbl").append(html);          
           
	if(num > 3){   
		$("#add_btn").hide();  
	}  
	return true;  
} 
          
           
           
function fncInsertBtn(num, seq){   
	   
	alert("num : "+ num); 
	alert("seq : "+ seq);  
	
	var caHolYn = "";   
	var toUrl = ""; 
	 
	if($("#caHolYn_"+num).is(":checked")){ 
		caHolYn = "Y"; 
	}   
	 
	if(typeof seq == "undefined"){
		toUrl = "insertProc.do"; 
	}else{ 
		toUrl = "updateProc.do";
	}
	            
	$.ajax({  
		method : "POST",  
		url : toUrl,
		data : {"caSeq" : seq, "caDataDate" : caDataDate.replace(/\./g,'-'), "caCont" : caCont = $('#caCont_'+num).val(), "caHolYn" : caHolYn},
		dataType : "JSON",
		success : function(data){    
			if(data.result == "success"){
				$.ajax({  
					method : "POST",  
					url : "addView.do",
					data : {"caDataDate" : caDataDate.replace(/\./g,'-')},
					dataType : "HTML",
					success : function(data){    
						$(".tbl").html(data);
					},
				})	
			}
		},
	})	   
}        
          
           
function fncDelBtn(num, seq){
	       
	alert("num : "+ num); 
	alert("seq : "+ seq);  
	
	if(!confirm("삭제하시겠습니까?")){    
		return false; 
	} 
	
	if(typeof seq == "undefined" || seq == null || seq == ""){
		$("#tbl_wrap_" + num).remove();
		return false;
	}
	       
	$.ajax({       
		method : "POST",    
		url : "deleteProc.do",
		data : {"caSeq" : seq},       
		dataType : "HTML", 
		succsess : function(data){    
			$("#tbl_wrap_" + num).remove();  
		}
	})   
	
	if($("[id^=tbl_wrap_]").length < 3){
		$("#add_btn").show(); 
	}
	$("#tbl_wrap_" + num).remove();
}







</script>