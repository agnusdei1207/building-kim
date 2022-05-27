<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
                   
<c:choose>
	<c:when test="${fn:length(resultList) gt 0 }">
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
								<th>공휴일 여부 ${status.count }</th>                     
								<td>                   
								 	<input type="checkbox" name="caHolYn" id="caHolYn_${status.count }" value="Y" ${result.caHolYn eq 'Y' ? "checked" : "" } style="margin-left:20px;" /> 
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
									<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncDelBtn(${status.count }, ${result.caSeq});">삭제22</a>
									<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncInsertBtn(${status.count }, ${result.caSeq});">등록 </a>
								</td> 
							</tr>    
						</tbody>              
					</table>       
				</div>     
			</div>         
		</c:forEach>           
	</c:when>
	<c:otherwise>      
		<div id="tbl_wrap_1">  
				<div class="tbl_wrap mar_t20">   
					<table class="tbl_row_type01">    
						<colgroup>     
							<col width="20%">            
							<col>                            
						</colgroup>              
						<tbody>                   
							<tr>                  
								<th>공휴일 여부 1</th>                      
								<td>                    
									<input type="checkbox" name="caHolYn" id="caHolYn_1" value="Y" style="margin-left:20px;" />
								</td>     
							</tr>             
							<tr>        
								<th>내용</th>                    
								<td>   
									<input type="text" name="caCont" id="caCont_1" class="text w70p" maxlength="100" />
								</td>             
							</tr>      
							<tr>        
								<th>버튼</th>    
								<td>    
									<a href="javascript:void(0)" class="btn btn_mdl btn_del" onclick="fncDelBtn(1);">삭제33</a>
									<a href="javascript:void(0)" class="btn btn_mdl btn_rewrite" onclick="fncInsertBtn(1);">등록 </a>
								</td>
							</tr> 
						</tbody>             
					</table>       
				</div>    
			</div>
	</c:otherwise> 
</c:choose>
         