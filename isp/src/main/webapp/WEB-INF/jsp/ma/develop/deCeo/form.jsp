<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
     
<div class="content_box">   
	<form name="defaultFrm" id="defaultFrm" method="post"> 
		<input type="hidden" name="ceSeq" id="ceSeq" value="${ceoVO.ceSeq }">
		<input type="hidden" name="ceAtchFileId" id="ceAtchFileId">  
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="tbl_row_type01">  
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption> 
				<colgroup>
					<col style="width:20%;"> 
					<col style="width:30%;"> 
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup>  
				<tbody>     
					<tr>  
						<th scope="row"><strong class="th_tit">대표자</strong></th>
						<td>
							<input type="text" name="ceName" id="ceName" class="text w100p" maxlength="8" value="${ceoVO.ceName }" />
						</td>
						<th scope="row"><strong class="th_tit">사업자 번호</strong></th>
						<td>  
							<input type="text" name="ceNum" id="ceNum" class="text w100p numOnly" maxlength="11" value="${ceoVO.ceNum }" />
						</td>      
					</tr>         
					<tr>                                
						<th scope="row"><strong class="th_tit">주소</strong></th>           
               			<td>            
	                     <input type="text" name="ceAdd" id="ceAdd1" value="${ceoVO.ceAdd.split(',')[0] }" placeholder="우편번호">
	                     <button type="button" class="btn btn-dark" onclick="execDaumPostcode();">우편번호 찾기</button><br>
	                      <input type="text" name="ceAdd" id="ceAdd2"  value="${ceoVO.ceAdd.split(',')[1] }"  placeholder="도로명 주소">
	                      <input type="text" name="ceAdd" id="ceAdd3"   value="${ceoVO.ceAdd.split(',')[2] }"  placeholder="상세주소">   
               			</td>    
						<th scope="row"><strong>핸드폰 번호</strong></th>  
						<td>    
							<input type="text" name="ceHp" id="ceHp" class="text w100p numOnly" maxlength="11" value="${ceoVO.ceHp }" />
						</td> 
					</tr>   
					<tr>
						<th scope="row"><strong>메인 이미지</strong></th>     
						<td colspan="3">
							<iframe name="ceAtchFileIdFrame" id="ceAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ceoVO.ceAtchFileId }&fileCnt=5&atchFileIdNm=ceAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" frTitle="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>      
			</table>      
		</div>                          
		 
		                
	 	<div class="tbl_wrap">                                                             
			<h3 class="tit_page">상단 배너  <a href="javascript:void(0)" onclick="fncAddUpBanner();" class="btn btn_mdl btn_rewrite"> 추가</a> </h3> 
			<c:if test="${fn:length(upBannerList) gt 0 }"> 
			 	<c:forEach var="bannerVO" items="${upBannerList}" varStatus="status">      
					 <div id="divUp_${status.count}"> 
							 <table class="tbl_row_type01">
								 <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption> 
								 <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>  
							 <colgroup>    
								 <col style="width:20%"> 
								 <col style="width:30%"> 
								 <col style="width:20%">    
								 <col style="width:30%">  
							 </colgroup>                  
							 <tbody>              
							 	<tr style="display:none;">    
									 <th scope="row"><strong>정보</strong></th>
									 <td colspan="3">    
										<input type="hidden" name="baSeq" id="baSeq_${status.count }" value="${bannerVO.baSeq} " /> 
										<input type="hidden" name="baPosition" id="baPosition_${status.count }" value="U" />
									 </td>                    
								 </tr> 
								 <tr> 
									 <th scope="row"><strong class="th_tit">제목</strong></th>    
									 <td colspan="3"> 
										<input type="text" name="baTitle" id="baTitle_${status.count }" class="text w80p" maxlength="70" value="${bannerVO.baTitle}" />
									 	<a href="javascript:void(0)" onclick="fncDelBanner(${status.count }, ${bannerVO.baSeq} )" id="btn_del_${status.count }" class="btn btn_mdl btn_del btn_cnt" style="margin-left:39px" >삭제</a>
									 </td>                     
								 </tr>            
								 <tr>       
									 <th scope="row"><strong>URL</strong></th>           
									 <td>  
										 <input type="text" name="baUrl" id="baUrl_${status.count }" class="text w100p" maxlength="120" value="${bannerVO.baUrl}" />
									 </td>
									 <th scope="row"><strong>새창 유무</strong></th>      
									 <td>        
										 사용 <input type="radio" name="newWindow_${bannerVO.baSeq }" onchange="fncChangeWindow('${status.count }', this);" id="radio_window_Y${status.count }" ${bannerVO.baWindow eq "Y" ? "checked" : "" } value="Y">
										 미사용 <input type="radio" name="newWindow_${bannerVO.baSeq }" onchange="fncChangeWindow('${status.count }', this);" id="radio_window_M${status.count }" ${bannerVO.baWindow eq "N" ? "checked" : "" } value="N">
									 <input type="hidden" name="baWindow" id="baWindow_${status.count }" value="${bannerVO.baWindow }">     
									 </td>     
								 </tr>                                  
								 <tr>                        
								 <th scope="row"><strong>전시 순서</strong></th>                  
								 <td>              
									 <select name="baOrderNum" id="baOrderNum_${status.count }" onfocus="fncFocusSave(${status.count });" onchange="fncSelectChange(${status.count });">             
										 <option value="">순서 선택</option>                                
										 <c:forEach var="num" items="${upBannerList}" varStatus="inner">               
											 <option value="${inner.count}" ${bannerVO.baOrderNum eq inner.count ? "selected" : ""}>${inner.count}</option>
										 </c:forEach>       
									 </select>                      
								 </td>                                 
								 <th scope="row"><strong>전시 유무 </strong></th>                              
									 <td>              
										 전시 <input type="radio" name="showYn_${status.count }" onchange="fncChangeExpose('${status.count }',this);" id="radio_baExposeY_${status.count }" ${bannerVO.baExposeYn eq "Y" ? "checked" : ""} value="Y">
										 미전시 <input type="radio" name="showYn_${status.count }" onchange="fncChangeExpose('${status.count }', this);" id="radio_baExposeN_${status.count }" ${bannerVO.baExposeYn eq "N" ? "checked" : ""} value="N">
									 	<input type="hidden" name="baExposeYn" id="baExposeYn_${status.count }" value="${bannerVO.baExposeYn }">
									 </td>    
								 </tr>       
								 <tr>           
									 <th scope="row"><strong>내용</strong></th>                       
									 <td colspan="3">            
										 <input type="text" name="baCont" id="baCont_${status.count }" class="text w100p" maxlength="50" value="${bannerVO.baCont }"/>
									 </td>      
								 </tr>            
								 <tr>                                  
									 <th scope="row"><strong>첨부파일</strong></th>                   					  
									 <td colspan="3">    
									 	 <iframe name="baAtchFileId_${status.count }Frame" id="baAtchFileId_${status.count }Frame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId_${status.count }&updateType=upload" style="width:100%" frameborder="0"></iframe>
									 	 <input type="hidden" name="baAtchFileId" id="baAtchFileId_${status.count }" value="${bannerVO.baAtchFileId }">
									 </td>            
								 </tr>   
							 </tbody>                        
						 </table>            
					 </div> 
			 </c:forEach>        
		</c:if>       
	</div>
	<div class="addPlaceUpbanner">   
 	  </div>  
   
  		        
		<div class="tbl_wrap">                                                                
			<h3 class="tit_page">하단 배너  <a href="javascript:void(0)" onclick="fncAddDownBanner();" class="btn btn_mdl btn_rewrite"> 추가</a> </h3> 
			<c:if test="${fn:length(downBannerList) gt 0 }">    
			 	<c:forEach var="downBannerVO" items="${downBannerList}" varStatus="status">      
					 <div id="divDown_${status.count}"> 
							 <table class="tbl_row_type01">
								 <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
								 <caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>  
							 <colgroup>   
								 <col style="width:20%">        
								 <col style="width:30%"> 
								 <col style="width:20%">      
								 <col style="width:30%">   
							 </colgroup>                  
							 <tbody>              
							 	<tr style="display:none;">       
									 <th scope="row"><strong>정보</strong></th>      
									 <td colspan="3">      
										<input type="hidden" name="baSeq" id="baSeqDown_${status.count }" value="${downBannerVO.baSeq} " /> 
										<input type="hidden" name="baPostion" id="baPostion_${status.count }" value="D" />
									 </td>                    
								 </tr>   
								 <tr>   
									 <th scope="row"><strong class="th_tit">제목</strong></th>    
									 <td colspan="3"> 
										<input type="text" name="baTitle" id="baTitleDown_${status.count }" class="text w80p" maxlength="70" value="${downBannerVO.baTitle}" />
									 	<a href="javascript:void(0)" onclick="fncDelDownBanner(${status.count }, ${downBannerVO.baSeq} )" id="btn_del_${status.count }" class="btn btn_mdl btn_del btn_cnt" style="margin-left:39px" >삭제</a>
									 </td>                      
								 </tr>            
								 <tr>       
									 <th scope="row"><strong>URL</strong></th>           
									 <td>  
										 <input type="text" name="baUrl" id="baUrlDown_${status.count }" class="text w100p" maxlength="120" value="${downBannerVO.baUrl}" />
									 </td>
									 <th scope="row"><strong>새창 유무</strong></th>      
									 <td>        
										 사용 <input type="radio" name="newWindow_${downBannerVO.baSeq }" onchange="fncChangeWindow('${status.count }', this);" id="radio_windowDown_Y${status.count }" ${downBannerVO.baWindow eq "Y" ? "checked" : "" } value="Y">
										 미사용 <input type="radio" name="newWindow_${downBannerVO.baSeq }" onchange="fncChangeWindow('${status.count }', this);" id="radio_windowDown_M${status.count }" ${downBannerVO.baWindow eq "N" ? "checked" : "" } value="N">
									 <input type="hidden" name="baWindow" id="baWindowDown_${status.count }" value="${downBannerVO.baWindow }">     
									 </td>     
								 </tr>                                   
								 <tr>                              
								 <th scope="row"><strong>전시 순서</strong></th>                   
								 <td>      
									 <select name="baOrderNum" id="baOrderNumDown_${status.count }" onfocus="fncFocusSaveDown(${status.count });" onchange="fncSelectChange(${status.count });">             
										 <option value="">순서 선택</option>                                
										 <c:forEach var="num" items="${downBannerList}" varStatus="inner">               
											 <option value="${inner.count}" ${downBannerVO.baOrderNum eq inner.count ? "selected" : ""}>${inner.count}</option>
										 </c:forEach>        
									 </select>                        
								 </td>                                  
								 <th scope="row"><strong>전시 유무 </strong></th>                              
									 <td>              
										 전시 <input type="radio" name="showYn_${status.count }" onchange="fncChangeExpose('${status.count }',this);" id="radio_baExposeYDown_${status.count }" ${downBannerVO.baExposeYn eq "Y" ? "checked" : ""} value="Y">
										 미전시 <input type="radio" name="showYn_${status.count }" onchange="fncChangeExpose('${status.count }', this);" id="radio_baExposeNDown_${status.count }" ${downBannerVO.baExposeYn eq "N" ? "checked" : ""} value="N">
									 	<input type="hidden" name="baExposeYn" id="baExposeYnDown_${status.count }" value="${downBannerVO.baExposeYn }">
									 </td>    
								 </tr>        
								 <tr>            
									 <th scope="row"><strong>내용</strong></th>                       
									 <td colspan="3">            
										 <input type="text" name="baCont" id="baContDown_${status.count }" class="text w100p" maxlength="50" value="${downBannerVO.baCont }"/>
									 </td>      
								 </tr>              
								 <tr>                                  
									 <th scope="row"><strong>첨부파일</strong></th>                   					  
									 <td colspan="3">    
									 	 <iframe name="baAtchFileIdDown_${status.count }Frame" id="baAtchFileIdDown_${status.count }Frame" src="/atch/fileUpload.do?atchFileId=${downBannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileIdDown_${status.count }&updateType=upload" style="width:100%" frameborder="0"></iframe>
									 	 <input type="hidden" name="baAtchFileId" id="baAtchFileIdDown_${status.count }" value="${downBannerVO.baAtchFileId }">
									 </td>            
								 </tr>   
							 </tbody>                        
						 </table>              
					 </div>  
			 </c:forEach>          
		</c:if>         
		 	  <div class="addPlaceDownBanner">  
		 	  </div>     
		</div>              
	  	<div class="btn_area">  
			<a href="javascript:void(0)" class="btn btn_mdl btn_save" onclick="fncSubmit('${ceoVO.ceName}')" id="btn_submit">등록</a>
		</div> 
	</form>                
</div>	                 
	                
<script type="text/javascript">

         
$(function(){  
	if($("[id^=divUp_]").length < 1){
		fncAddUpBanner();
	} 
	if($("[id^=divDown_]").length < 1){
		fncAddDownBanner();  
	}      
});        
 
  
var previous;     
   
function fncSelectChange(num){   
	if($("select[id^=baOrderNum_] option:selected[value='" + $("#baOrderNum_" + num).val() + "']").length > 1){
		$("#baOrderNum_" + num).val(previous).prop("selected", true);
	 	alert("순서가 중복되었습니다.");      
	 	return false;    
	}          
	
	previous = $("#baOrderNum_" + num).val();
}          
      
function fncFocusSave(num){                  
	previous = $("#baOrderNum_" + num).val();                                 
} 
        
   
function fncChangeExpose(num, obj){ 
	var text = $("input[name="+obj.name+"]:checked").val()
	$("#baExposeYn_"+num).val(text);
	return true; 
}             
           
function fncChangeWindow(num, obj){
	var text = $("input[name="+obj.name+"]:checked").val()
	$("#baWindow_"+num).val(text);
	return true;  
} 
     
<%-- 주소 API --%>
function execDaumPostcode() { 
    daum.postcode.load(function(){ 
        new daum.Postcode({
            oncomplete: function(data) {
              $("#ceAdd1").val(data.zonecode);
              $("#ceAdd2").val(data.roadAddress);
            }
        }).open();  
    });   
}         
         

function fncSetOptionNumUpBanner(){   
	var leng = $("[id^=baOrderNum_]").length;        
	         
	$("[id^=baOrderNum_]").each(function(){
		var val = $("#" + this.id + " option:selected").val();  
		var html = '<option value="">순서 선택</option>'; 
		for(var i = 1; i <= leng; i++){
			var selected = ""; 
			if(i == val){            
				selected = " selected";    
			}                    
			html += '<option value="'+i+'"' + selected + '>' + i + '</option>';
		}
		$(this).html(html);
	})           
}            
 
              					   
function fncAddUpBanner(){  
	var num = $("[id^=baOrderNum_]").length + 1;    
	alert("상단 배너가 추가되었습니다.");     
	var html = '';                            
	 	html += '<div id="divUp_'+ num +'">';     
		html += '<input type="hidden" name="baSeq" id="baSeq_'+num+'" value="N">';   
		html += '<input type="hidden" name="baPosition" id="baPosition_'+num+'" value="U"/>';
		html += '<table class="tbl_row_type01">';
		html += 		'<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>';
		html += 		'<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>';
		html += 	'<colgroup>';            
		html += 		'<col style="width:20%;">';       
		html += 		'<col style="width:30%;">';              
		html += 		'<col style="width:20%;">';
		html += 		'<col style="width:30%;">';         
		html += 	'</colgroup>';      
		html += 	'<tbody>';                
		html += 		'<tr>';                                 
		html += 			'<th scope="row"><strong class="th_tit">제목</strong></th>';     
		html += 			'<td colspan="3">'; 
		html += 				'<input type="text" name="baTitle" id="baTitle_'+num+'" class="text w80p" maxlength="70"/>';
		html += 				'<a href="javascript:void(0)" onclick="fncDelBanner('+num+');" id="btn_del_'+num+'" class="btn btn_mdl btn_del btn_cnt" style="margin-left:42px;" >삭제</a>';
		html +=				'</td>';                  
		html += 		'</tr>';                 
		html += 		'<tr>';           
		html += 			'<th scope="row"><strong>URL</strong></th>';    
		html += 			'<td>';  
		html += 				'<input type="text" name="baUrl" id="baUrl_'+num+'" class="text w100p" maxlength="120"/>';
		html += 			'</td>';    
		html += 			'<th scope="row"><strong>새창 유무</strong></th>';      
		html += 			'<td>';     
		html += 				'사용 <input type="radio" name="newWindow" onchange="fncChangeWindow('+num+', this);" id="radio_window_'+num+'" ${bannerVO.baWindow eq "Y" ? "checked" : "" } value="Y">';
		html += 				'미사용 <input type="radio" name="newWindow" onchange="fncChangeWindow('+num+', this);" id="radio_window_'+num+'" ${bannerVO.baWindow eq "N" ? "checked" : "" } value="N">';
		html += 				'<input type="hidden" name="baWindow" id="baWindow_'+num+'">';	   
		html += 			'</td>';            
		html += 		'</tr>';               
		html += 		'<tr>';    
		html += 			'<th scope="row"><strong>전시 순서</strong></th>';             
		html += 			'<td>';       
		html += 				'<select name="baOrderNum" id="baOrderNum_'+num+'" onfocus="fncFocusSave('+num+');"  onchange="fncSelectChange('+num+');">';  
		html += 				'</select>';         
		html += 			'</td>';            
		html += 			'<th scope="row"><strong>전시 유무</strong></th>';                 
		html += 			'<td>';  
		html += 				'전시 <input type="radio" name="showYn" onchange="fncChangeExpose('+num+', this);" id="radio_baExposeYn_'+num+'" ${bannerVO.baExposeYn eq "Y" ? "checked" : ""} value="Y">';
		html += 				'미전시 <input type="radio" name="showYn" onchange="fncChangeExpose('+num+', this);" id="radio_baExposeYn_'+num+'" ${bannerVO.baExposeYn eq "N" ? "checked" : ""} value="N">';
		html += 				'<input type="hidden" name="baExposeYn" id="baExposeYn_'+num+'">';   
		html += 			'</td>';           
		html += 		'</tr>';           
		html += 		'<tr>';    
		html += 			'<th scope="row"><strong>내용</strong></th>';  
		html += 			'<td colspan="3">';     
		html += 				'<input type="text" name="baCont" id="baCont_'+num+'" class="text w100p" maxlength="50"/>';
		html += 			'</td>';   
		html += 		'</tr>';          
		html += 		'<tr>';                         
		html += 			'<th scope="row"><strong>첨부파일</strong></th>';    
		html += 			'<td colspan="3">';
		html += 				'<iframe name="baAtchFileId_'+num+'Frame" id="baAtchFileId_'+num+'Frame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId_'+num+'&updateType=upload" style="width:100%" frameborder="0"></iframe>';
		html += 				'<input type="hidden" name="baAtchFileId" id="baAtchFileId_'+num+'">'; 
		html += 			'</td>';                 
		html += 		'</tr>';    
		html += 	'</tbody>';        
		html += '</table>';           
		html += '</div>';         
	 	                
	$(".addPlaceUpbanner").before(html);       
	fncSetOptionNumUpBanner();
}   
 
function fncDelBanner(cnt, seq){ 
	   
	if(confirm("삭제하시겠습니까?")){   
		if(typeof seq == "undefined"){
			$("#divUp_"+cnt).remove();    
			if($("[id^=divUp_]").length < 1){  
				fncAddUpBanner();
			}          
		}else{                              
			$.ajax({   
				method : "POST",        
				url : "delBanner.do",          
				data : {"baSeq" : seq},
				success : function(data){  
					$("#divUp_"+cnt).remove();
					if($("[id^=divUp_]").length < 1){  
						fncAddUpBanner();
					}     
				} 
			})             
		}           
	}         
}
 
 
<%-- 하단 배너 --%>

var previousDown;           
   
function fncSelectChangeDown(num){ 
	if($("select[id^=baOrderNumDown_] option:selected[value='" + $("#baOrderNumDown_" + num).val() + "']").length > 1){
		$("#baOrderNumDown_" + num).val(previousDown).prop("selected", true);
	 	alert("순서가 중복되었습니다.");            
	 	return false;    
	}  
	previousDown = $("#baOrderNumDown_" + num).val();
}      
    
function fncFocusSaveDown(value){   
	previousDown = value;      
}   
 
function fncSetOptionNumDownBanner(){   
	var leng = $("[id^=baOrderNumDown_]").length;        
	           
	$("[id^=baOrderNumDown_]").each(function(){
		var val = $("#" + this.id + " option:selected").val();  
		var html = '<option value="">순서 선택</option>'; 
		for(var i = 1; i <= leng; i++){
			var selected = ""; 
			if(i == val){             
				selected = " selected";    
			}                    
			html += '<option value="'+i+'"' + selected + '>' + i + '</option>';
		}
		$(this).html(html);
	})           
}  

function fncChangeExposeDown(num, obj){ 
	var text = $("input[name="+obj.name+"]:checked").val()
	$("#baExposeYnDown_"+num).val(text);
	return true;       
}                  
           
function fncChangeWindowDown(num, obj){
	var text = $("input[name="+obj.name+"]:checked").val()
	$("#baWindowDown_"+num).val(text);
	return true;  
}
   
          
function fncAddDownBanner(){                       
	  
	var num = $("[id^=baOrderNumDown_]").length + 1;                
	alert("하단 배너가 추가되었습니다.");      
	var html = '';                              
	 	html += '<div id="divDown_'+ num +'">';       
		html += '<input type="hidden" name="baSeq" id="baSeqDown_'+num+'" value="N">';    
		html += '<input type="hidden" name="baPosition" id="baPositionDown_'+num+'" value="D"/>';
		html += '<table class="tbl_row_type01">';     
		html += 		'<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>';   
		html += 		'<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>'; 
		html += 	'<colgroup>';         
		html += 		'<col style="width:20%;">';       
		html += 		'<col style="width:30%;">';            
		html += 		'<col style="width:20%;">';
		html += 		'<col style="width:30%;">';        
		html += 	'</colgroup>';      
		html += 	'<tbody>';                
		html += 		'<tr>';                                   
		html += 			'<th scope="row"><strong class="th_tit">제목</strong></th>';     
		html += 			'<td colspan="3">'; 
		html += 				'<input type="text" name="baTitle" id="baTitleDown_'+num+'" class="text w80p" maxlength="70"/>';
		html += 				'<a href="javascript:void(0)" onclick="fncDelDownBanner('+num+');" id="btn_del_'+num+'" class="btn btn_mdl btn_del btn_cnt" style="margin-left:42px;" >삭제</a>';
		html +=				'</td>';                  
		html += 		'</tr>';                   
		html += 		'<tr>';           
		html += 			'<th scope="row"><strong>URL</strong></th>';    
		html += 			'<td>';  
		html += 				'<input type="text" name="baUrl" id="baUrlDown_'+num+'" class="text w100p" maxlength="120"/>';
		html += 			'</td>';    
		html += 			'<th scope="row"><strong>새창 유무</strong></th>';         
		html += 			'<td>';     
		html += 				'사용 <input type="radio" name="newWindow" onchange="fncChangeWindowDown('+num+', this);" id="radio_windowDown_'+num+'" ${bannerVO.baWindow eq "Y" ? "checked" : "" } value="Y">';
		html += 				'미사용 <input type="radio" name="newWindow" onchange="fncChangeWindowDown('+num+', this);" id="radio_windowDown_'+num+'" ${bannerVO.baWindow eq "N" ? "checked" : "" } value="N">';
		html += 				'<input type="hidden" name="baWindow" id="baWindowDown_'+num+'">';	   
		html += 			'</td>';            
		html += 		'</tr>';                   
		html += 		'<tr>';    
		html += 			'<th scope="row"><strong>전시 순서</strong></th>';                
		html += 			'<td>';        
		html += 				'<select name="baOrderNum" id="baOrderNumDown_'+num+'" onfocus="fncFocusSaveDown('+num+');"  onchange="fncSelectChange('+num+');">';  
		html += 				'</select>';         
		html += 			'</td>';            
		html += 			'<th scope="row"><strong>전시 유무</strong></th>';                 
		html += 			'<td>';  
		html += 				'전시 <input type="radio" name="showYn" onchange="fncChangeExposeDown('+num+', this);" id="radio_baExposeYnDown_'+num+'" ${bannerVO.baExposeYn eq "Y" ? "checked" : ""} value="Y">';
		html += 				'미전시 <input type="radio" name="showYn" onchange="fncChangeExposeDown('+num+', this);" id="radio_baExposeYnDown_'+num+'" ${bannerVO.baExposeYn eq "N" ? "checked" : ""} value="N">';
		html += 				'<input type="hidden" name="baExposeYn" id="baExposeYnDown_'+num+'">';   
		html += 			'</td>';           
		html += 		'</tr>';           
		html += 		'<tr>';     
		html += 			'<th scope="row"><strong>내용</strong></th>';  
		html += 			'<td colspan="3">';     
		html += 				'<input type="text" name="baCont" id="baContDown_'+num+'" class="text w100p" maxlength="50"/>';
		html += 			'</td>';   
		html += 		'</tr>';          
		html += 		'<tr>';                         
		html += 			'<th scope="row"><strong>첨부파일</strong></th>';    
		html += 			'<td colspan="3">';
		html += 				'<iframe name="baAtchFileIdDown_'+num+'Frame" id="baAtchFileIdDown_'+num+'Frame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileIdDown_'+num+'&updateType=upload" style="width:100%" frameborder="0"></iframe>';
		html += 				'<input type="hidden" name="baAtchFileId" id="baAtchFileIdDown_'+num+'">'; 
		html += 			'</td>';                 
		html += 		'</tr>';   
		html += 	'</tbody>';        
		html += '</table>';           
		html += '</div>';    
	 	                        
	$(".addPlaceDownBanner").after(html);       
	fncSetOptionNumDownBanner();
}          
    
function fncDelDownBanner(cnt, seq){ 
	      
	if(confirm("삭제하시겠습니까?")){   
		if(typeof seq == "undefined"){
			$("#divDown_"+cnt).remove();    
			if($("[id^=divDown_]").length < 1){  
				fncAddDownBanner();
			}          
		}else{                                   
			$.ajax({            
				method : "POST",             
				url : "delBanner.do",                   
				data : {"baSeq" : seq}, 
				success : function(data){  
					$("#divDown_"+cnt).remove();
					if($("[id^=divDown_]").length < 1){  
						fncAddDownBanner();
					}     
				} 
			})             
		}           
	}         
}
  

function fncSubmit(title){           
	 
	if($("#ceName").val() == null || $("#ceName").val() == ""){
		checkMsg("#ceName", "이름을 입력해주세요.");
	}  
	if($("#ceNum").val() == null || $("#ceNum").val() == ""){
		checkMsg("#ceNum", "사업자 번호를 입력해주세요.");
	}  
	if($("#ceAdd3").val() == null || $("#ceAdd3").val() == ""){
		checkMsg("#ceAdd3", "상세주소를 입력해주세요."); 
	}                  
	           
	for(var i = 1; i <= $("[id^=baTitle_]").length; i++){
		if($("#baTitle_" + i).val() == null || $("#baTitle_" + i).val() == ""){     
			checkMsg("#baTitle_" + i, "제목을 입력해주세요.");
			return false;                  
		}         
	}            
	   
	for(var i = 1; i <= $("[id^=baTitleDown_]").length; i++){
		if($("#baTitleDown_" + i).val() == null || $("#baTitleDown_" + i).val() == ""){     
			checkMsg("#baTitleDown_" + i, "제목을 입력해주세요.");
			return false;                  
		}         
	}              
	           
	for(var i = 1; i <= $("[id^=baOrderNum_").length; i++){
		if($("[id^=baOrderNum_" + i).val() == null || $("[id^=baOrderNum_" + i).val() == ""){
			checkMsg("#baOrderNum_" + i, "순서를 선택해주세요.");
			return false;
		}    
	}       
	  
	for(var i = 1; i <= $("[id^=baOrderNumDown_").length; i++){
		if($("[id^=baOrderNumDown_" + i).val() == null || $("[id^=baOrderNumDown_" + i).val() == ""){
			checkMsg("#baOrderNumDown_" + i, "순서를 선택해주세요.");
			return false; 
		}    
	}   
	 
	if(title == null || title == ""){    
		fncPageBoard('write','insertProc.do'); 
		return false; 
	}else{
		fncPageBoard('update','updateProc.do'); 
		return false;   
	}            
}                                                      
    




</script>

