<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>


<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
			<input type="hidden" id="poSeq" name="poSeq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">   
					<strong class="tit">게시판</strong>
					<form:select path="schEtc02" id="schEtc02" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="B" label="시공사례"/>   
						<form:option value="R" label="추천설계"/>  
						<form:option value="S" label="시공현장"/>  
						<form:option value="I" label="인테리어사례"/>   
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

