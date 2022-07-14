<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="frSeq" name="frSeq"/> 
			<%-- 게시판 구분 schEtc02 --%>
			<input type="hidden" id="schEtc02" name="schEtc02"/>  
			<%-- 게시판 SEQ --%>
			<input type="hidden" id="schEtc03" name="schEtc03"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset>
				<legend>검색</legend>      
				<div class="search_basic">   
					<strong class="tit">첨부파일</strong>
					<form:select path="schEtc01" id="schEtc01" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="Y" label="첨부"/>  
						<form:option value="N" label="미첨부"/>
					</form:select>       
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>  
						<form:option value="2" label="내용"/>  
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div> 
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>

<script type="text/javaScript">    
  
$(function(){  
	fncPageBoard('addList','addList.do', '1');
});
   
$("#schEtc01").change(function(){
	fncPageBoard('addList','addList.do', '1');   
});
  
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

</script>