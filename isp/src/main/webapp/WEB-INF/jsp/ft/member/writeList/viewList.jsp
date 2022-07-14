<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">  
	<form name="defaultFrm" id="defaultFrm" method="post">     
		<input type="hidden" name="atchFileId" id="atchFileId">
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->  
		<div class="tbl_wrap">   
			<table class="tbl_row_type01">  
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">   
					<col style="width:35%;">
				</colgroup>
				<tbody>   
					<tr>                  
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${searchVO.schEtc01 } 
						</td> 
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${searchVO.schEtc01 }</td>
					</tr>    
					<tr>   
	                    <th scope="row"><strong>제목</strong></th>
						<td colspan="3">  
							${searchVO.schEtc01 }
						</td>
					</tr>   
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(searchVO.schEtc01)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>  
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3"> 
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${searchVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody> 
			</table>    
		</div>      
		<div class="tbl_btns">
			<a href="javascript:void(0)" id="btn_update" class="btn btn_middle btn_purple" >수정</a> 
			<a href="javascript:void(0)" id="btn_del" class="btn btn_middle btn_red" >삭제</a>
			<a href="javascript:void(0)" id="btn_list" class="btn btn_middle btn_gray" >목록</a>
		</div>	
		        
	<ul class="tab js-tab tab_menu">              
	    <li id="menu"><a href="javascript:void(0);" onclick="fncMenuTap(0);">자유게시판</a></li>
	    <li id="menu1"><a href="javascript:void(0);" onclick="fncMenuTap(1);">견적게시판</a></li> 
	</ul>    
		<div class="search_box">    
				<input type="text" id="col1" class="text w100p" name="col1"/>   
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
										<strong class="tit hideBtn3">검색</strong>						
										<select title="구분 선택" name="searchCondition" id="searchCondition"  class="selec hideBtn3" style="width:132px;">  
											<option value="0" >전체</option>
											<option value="1" >제목</option> 
											<option value="2" >내용</option>     
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
		</div>  
	     <div class="tbl">
	     </div>
	</form>
</div>	    
	  
<script type="text/javascript">
         
$(function(){   
	<%-- 정규식 처리 --%>
	$(".num").each(function(){
		numFormat($(this), 'num');
	});
	$(".tel").each(function(){
		numFormat($(this), 'tel');
	});
	 
	fncPageBoard('addList','fedViewAddList.do', 1);
	fncClickTap($("#eduTap_"+$("#subDivn").val()));
}); 
      
<%-- 숫자 정규식 --%>
function numFormat(object, divn){
	var numVal = object.text().trim();
	if(divn == "tel"){
		numVal = numVal.replace(/^(02[0-9]{0}|0[0-9]{2}|01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/,"$1-$2-$3");
	}
	if(divn == "busi"){
		numVal = numVal.replace(/^([0-9]{3})([0-9]{2})([0-9]{5})$/,"$1-$2-$3");
	}
	if(divn == "num"){
		numVal = numVal.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	object.text(numVal);  
}     
 
<%-- 메뉴 클릭 CSS --%>
function fncClickTap(obj){
	$(obj).addClass("current");   
	$(obj).siblings().removeClass("current");
}  
           
<%-- 메뉴 클릭 --%>
function fncMenuTap(obj, divn){
	fncClickTap(obj);
	$("#subDivn").val(divn);
	fncPageBoard('addList','fedViewAddList.do', 1);
}

</script>