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
			<h3 class="tit_page">상단 배너  <a href="javascript:void(0)" onclick="fncAddUpBanner();" id="place_a" class="btn btn_mdl btn_rewrite"> 추가</a> </h3> 
			<c:if test="${fn:length(upBannerList) gt 0 }"> 
			 	<c:forEach var="bannerVO" items="${upBannerList}" varStatus="status">      
					 <div id="div_${status.count}"> 
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
										<input type="text" name="baSeq" id="baSeq_${status.count }" value="${bannerVO.baSeq} " /> 
										<input type="text" name="baRgstId" id="baRgstId_${status.count }" value="${bannerVO.baRgstId } " />
										<input type="text" name="baRvseId" id="baRvseId_${status.count }" value="${bannerVO.baRgstDt } " />
										<input type="text" name="schEtc02" id="schEtc02_${status.count }" value="1" />
									 </td>                    
								 </tr>
								 <tr> 
									 <th scope="row"><strong class="th_tit">제목</strong></th>    
									 <td colspan="3"> 
										<input type="text" name="baTitle" id="baTitle_${status.count }" class="text w90p" maxlength="70" value="${bannerVO.baTitle} " />
									 	<a href="javascript:void(0)" onclick="fncDelBanner(${status.count }, ${bannerVO.baSeq} )" id="btn_del_${status.count }" class="btn btn_mdl btn_del btn_cnt" style="margin-left:39px" >삭제</a>
									 </td>                    
								 </tr>           
								 <tr>       
									 <th scope="row"><strong>URL</strong></th>          
									 <td>  
										 <input type="text" name="baUrl" id="baUrl_${status.count }" class="text w100p" maxlength="120" value="${bannerVO.baUrl} " />
									 </td>
									 <th scope="row"><strong>새창 유무</strong></th>  
									 <td>      
										 사용 <input type="radio" name="newWindow_${bannerVO.baSeq }" id="radio_window_${status.count }" ${bannerVO.baWindow eq "Y" ? "checked" : "" }>
										 미사용 <input type="radio" name="newWindow_${bannerVO.baSeq }" id="radio_window_${status.count }" ${bannerVO.baWindow eq "N" ? "checked" : "" }>
									 <input type="hidden" name="baWindow" id="baWindow_${status.count }" value=" "> 
									 </td>     
								 </tr>                      
								 <tr>             
								 <th scope="row"><strong>전시 순서</strong></th>      
								 <td>    
									 <select name="baOrderNum" id="baOrderNum_${status.count }">             
										 <option value="">순서 선택</option>                        
										 <c:forEach var="num" items="${upBannerList}" varStatus="inner">              
											 <option value="${inner.count}" ${bannerVO.baOrderNum eq inner.count ? "selected" : ""}>${inner.count}</option>
										 </c:forEach>     
									 </select>                 
								 </td>                        
								 <th scope="row"><strong>전시 유무 </strong></th>                   
									 <td>           
										 전시 <input type="radio" name="showYn_${status.count }" id="radio_baExposeYn_${status.count }" ${bannerVO.baExposeYn eq "Y" ? "checked" : ""}>
										 미전시 <input type="radio" name="showYn_${status.count }" id="radio_baExposeYn_${status.count }" ${bannerVO.baExposeYn eq "N" ? "checked" : ""}>
									 	<input type="hidden" name="baExposeYn" id="baExposeYn_${status.count }" value=" ">
									 </td>   
								 </tr>       
								 <tr>          
									 <th scope="row"><strong>내용</strong></th>                     
									 <td colspan="3">            
										 <input type="text" name="baCont" id="baCont_${status.count }" class="text w100p" maxlength="50" value="${bannerVO.baCont } "/>
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
		 	  <div class="addPlaceUpBanner"> 
		 	  </div>  
		</div>           
	  	<div class="btn_area">  
			<a href="javascript:void(0)" class="btn btn_mdl btn_save" onclick="submit('${ceoVO.ceName}')" id="btn_submit">등록</a>
		</div>         
	</form>  
</div>	           
	         
<script type="text/javascript">
                     
// 다음 주소 API
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
   
function submit(title){    
	    
	$("[id^=baAtchFileId_]").each(function(){ 
		alert($("#"+ this.id).attr("src"));
	})
	  
	$("[id^=baOrderNum_]").each(function(){                  
		if($("#"+this.id).attr("selected") == false){         
			checkMsg("#"+this.id, "순서를 선택해주세요.");
		}         
	});  
	   
	$("[id^=radio_baExposeYn_]").each(function(){
		if(this.value == null || this.value == ""){
			checkMsg("#"+this.id, "전시 여부를 선택해주세요."); 
		}      
	});  
	  
	$("[id^=baWindow_]").each(function(){  
		if(this.value == null || this.value == ""){ 
			checkMsg("#"+this.id, "새창 여부를 선택해주세요.");
		}
	});  
	  
	 
	if($("#ceName").val() == null || $("#ceName").val() == ""){
		checkMsg("#ceName", "이름을 입력해주세요.");
	}  
	if($("#ceNum").val() == null || $("#ceNum").val() == ""){
		checkMsg("#ceNum", "사업자 번호를 입력해주세요.");
	}  
	if($("#ceAdd3").val() == null || $("#ceAdd3").val() == ""){
		checkMsg("#ceAdd3", "상세주소를 입력해주세요.");
	}                
	
	$("[id^=baTitle_]").each(function(){   
		if(this.value == null || this.value == ""){ 
			checkMsg("#"+this.id, "제목을 입력해주세요.");
		}
	});       
	$("[id^=baUrl_]").each(function(){  
		if(this.value == null || this.value == ""){ 
			checkMsg("#"+this.id, "Url을 입력해주세요.");
		}
	});  
  
	$("[id^=baCont_]").each(function(){  
		if(this.value == null || this.value == ""){ 
			checkMsg("#"+this.id, "내용을 입력해주세요.");
			return false;
		}  
	});   
	   
	if(title == null || title == ""){    
		fncPageBoard('write','insertProc.do'); 
		return false; 
	}else{
		fncPageBoard('update','updateProc.do'); 
		return false;  
	}         
	 
}                                                     
 
var arrOrderNum = []; 


function fncSetOptionNum(){
	var leng = $("[id^=baOrderNum_]").length;      
	 
	$("[id^=baOrderNum_]").each(function(){
		var val = $("#" + this.id + "option:selected").val();
		var html = '<option value="">순서 선택</option>'; 
		for(var i = 1; i <= leng; i++){
			var selected = ""; 
			if(i == val){ 
				selected = "selected";
			}              
			html += '<option value="'+i+'"' + selected + '">' + i + '</option>';
		}
		$(this).html(html);
	})           
}      
     
function fncAddUpBanner(){                    
	var num = $("[id^=baOrderNum_]").length + 1;     
	alert(num + "번째 창이 추가되었습니다.");
	var html = '';                          
	 	html += '<div id="div_'+ num +'">'; 
		html += '<input type="hidden" name="baAtchFileId" id="baAtchFileId">';
		html += '<input type="hidden" name="baSeq" id="baSeq_'+num+'" value=" ">';   
		html += '<input type="hidden" name="schEtc02" id="schEtc02_'+num+'" value="2"/>';
		html += '<table class="tbl_row_type01">';    
		html += '<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>';
		html += '<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>';
		html += '<colgroup>';     
		html += '<col style="width:20%;">';      
		html += '<col style="width:30%;">';            
		html += '<col style="width:20%;">';
		html += '<col style="width:30%;">';     
		html += '</colgroup>';    
		html += '<tbody>';             
		html += '<tr>';                              
		html += '<th scope="row"><strong class="th_tit">제목</strong></th>';     
		html += '<td colspan="3">'; 
		html += '<input type="text" name="baTitle" id="baTitle_'+num+'" class="text w90p" maxlength="70" value=" " />';
		html += '<a href="javascript:void(0)" onclick="fncDelBanner('+num+');" id="btn_del_'+num+'" class="btn btn_mdl btn_del btn_cnt" style="margin-left:42px;" >삭제</a>';
		html += '</td>';                 
		html += '</tr>';                 
		html += '<tr>';           
		html += '<th scope="row"><strong>URL</strong></th>';    
		html += '<td>'; 
		html += '<input type="text" name="baUrl" id="baUrl_'+num+'" class="text w100p" maxlength="120" value=" " />';
		html += '</td>';    
		html += '<th scope="row"><strong>새창 유무</strong></th>';     
		html += '<td>'; 
		html += ' 사용 <input type="radio" name="newWindow" id="radio_window_'+num+'" ${bannerVO.baWindow eq "Y" ? "checked" : "" }>';
		html += '미사용 <input type="radio" name="newWindow" id="radio_window_'+num+'" ${bannerVO.baWindow eq "N" ? "checked" : "" }>';
		html += '<input type="hidden" name="baWindow" id="baWindow_'+num+'" value=" ">';	 
		html += '</td>';          
		html += '</tr>';     
		html += '<tr>'; 
		html += '<th scope="row"><strong>전시 순서</strong></th>';     
		html += '<td>'; 
		html += '<select name="baOrderNum" id="baOrderNum_'+num+'">';  
		html += '</select>';        
		html += '</td>';      
		html += '<th scope="row"><strong>전시 유무</strong></th>';  
		html += '<td>';  
		html += '전시 <input type="radio" name="showYn" id="radio_baExposeYn_'+num+'" ${bannerVO.baExposeYn eq "Y" ? "checked" : ""}>';
		html += '미전시 <input type="radio" name="showYn" id="radio_baExposeYn_'+num+'" ${bannerVO.baExposeYn eq "N" ? "checked" : ""}>';
		html += '<input type="hidden" name="baExposeYn" id="baExposeYn_'+num+'" value=" ">';
		html += '</td>';     
		html += '</tr>';         
		html += '<tr>';    
		html += '<th scope="row"><strong>내용</strong></th>'; 
		html += '<td colspan="3">';     
		html += '<input type="text" name="baCont" id="baCont_'+num+'" class="text w100p" maxlength="50" value=" "/>';
		html += '</td>'; 
		html += '</tr>';       
		html += '<tr>';                     
		html += '<th scope="row"><strong>첨부파일</strong></th>';    
		html += '<td colspan="3">';
		html += '<iframe name="baAtchFileId_'+num+'Frame" id="baAtchFileId_'+num+'Frame" src="/atch/fileUpload.do?atchFileId=${bannerVO.baAtchFileId }&fileCnt=5&atchFileIdNm=baAtchFileId_'+num+'&updateType=upload" style="width:100%" frameborder="0"></iframe>';
		html += '<input type="hidden" name="baAtchFileId" id="baAtchFileId_'+num+'" value=" ">'; 
		html += '</td>';                 
		html += '</tr>';  
		html += '</tbody>';      
		html += '</table>';         
		html += '</div>';    
	 	                
	$(".addPlaceUpBanner").before(html);      
	fncSetOptionNum();
}          
           
function fncDelBanner(cnt, seq){   
	         
	if(confirm("삭제하시겠습니까?")){   
		if(typeof seq == "undefined"){
			$("#div_"+cnt).remove();          
		}else{                  
			$.ajax({   
				method : "POST",
				url : "delUpBanner.do",
				data : {"baSeq" : seq},
				success : function(data){
					$("#div_"+cnt).remove();  
				} 
			})      
		} 
	}
}
          
      
  

</script>

