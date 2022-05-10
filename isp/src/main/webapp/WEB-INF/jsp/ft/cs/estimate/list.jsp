<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>


<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="eqSeq" name="eqSeq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset>
				<legend>검색</legend>      
				<div class="search_basic">   
					<strong class="tit">진행상태</strong>
					<form:select path="schEtc03" id="schEtc03" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="A" label="신청"/>  
						<form:option value="R" label="반려"/>  
						<form:option value="T" label="재신청"/>  
						<form:option value="P" label="승인"/>  
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
$(document).ready(function(){
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
});
    
$("[id^=schEtc]").on("change", function(){
	fncPageBoard('addList','addList.do','1');
})


</script>

