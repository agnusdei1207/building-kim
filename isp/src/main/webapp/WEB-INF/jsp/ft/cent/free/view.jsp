<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">   
		<input type="hidden" name="frSeq" id="frSeq" value="${freeVO.frSeq }">
		<input type="hidden" name="frAtchFileId" id="frAtchFileId">
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
							${freeVO.frId } 
						</td> 
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${freeVO.frDt }</td>
					</tr>    
					<tr>   
	                    <th scope="row"><strong>제목</strong></th>
						<td colspan="3"> 
							${freeVO.frTitle }
						</td>
					</tr>   
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(freeVO.frCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>  
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="frAtchFileIdFrame" id="frAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${freeVO.frAtchFileId }&fileCnt=5&atchFileIdNm=frAtchFileId&updateType=view" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>     
		           
	<div class="tbl_btns c">
		<c:if test="${memberVO.meId eq freeVO.frId }">
			<a href="javascript:void(0)" id="btn_update" class="btn btn_middle btn_purple" >수정</a> 
			<a href="javascript:void(0)" id="btn_del" class="btn btn_middle btn_red" >삭제</a>
		</c:if>
		<a href="javascript:void(0)" id="btn_list" class="btn btn_middle btn_gray" >목록</a>
	</div>	
	
	
	
	<!-- prev & next -->
		<table class="tbl_prevNext" >
		    <caption></caption>
		    <colgroup>
		        <col style="width:15%"/>
		        <col />
		    </colgroup>    
		    <tbody>
	    	     <tr>  
		            <th scope="row">다음글</th>
		            <td>
		            	<c:choose>
		            		<c:when test="${empty next.frTitle }">
		            			-
		            		</c:when>   
		            		<c:otherwise>
		            			<a href="/ft/cent/free/view.do?frSeq=${next.frSeq }">${next.frTitle }</a>	
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr>
		        <tr>     
		            <th scope="row">이전글</th>
		            <td>
		            	<c:choose>
		            		<c:when test="${empty pre.frTitle }">
		            			-
		            		</c:when>
		            		<c:otherwise>
		            			<a href="/ft/cent/free/view.do?frSeq=${pre.frSeq }">${pre.frTitle }</a>	
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr> 
		   
		    </tbody>
		</table>
	<!--// prev & next -->
	
	</form>
</div>
