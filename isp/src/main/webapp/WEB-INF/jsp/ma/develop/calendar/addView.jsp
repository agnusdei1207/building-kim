<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
               
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
							<th>날짜 ${fn:length(resultList) } </th>                     
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
         