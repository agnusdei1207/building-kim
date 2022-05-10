<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

 
<!-- slider -->  
<script type="text/javascript" src="/publish/ft/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="/publish/ft/js/jquery.pikachoose.js"></script>
<script type="text/javascript">
	$(document).ready(
		function (){
			$("#pikame").PikaChoose({carousel:true,autoPlay:false,carouselOptions:{wrap:'circular'}});
		});
</script>    
<!-- // slider -->
     
<div class="content_box">
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
							<th scope="row"><strong class="th_tit">제목</strong></th>
							<td colspan="3">${portVO.poTitle }</td>
						</tr> 
						<tr>
							<th scope="row"><strong class="th_tit">작성자</strong></th>
							<td>${portVO.poRgstId }</td>
							<th scope="row"><strong class="th_tit">작성일 </strong></th>
							<td>${portVO.poRgstDt }
							<c:forEach var="i" items="${fileSnList }">
									숫자는 뭘까? : ${i.fileSn}
								</c:forEach>  
							</td>    
						</tr>     
						<tr> 
							<td colspan="4" class="tbl_text">    
								<div class="thum_slide">                   
									<div class="pikachoose">                
										<ul id="pikame" class="jcarousel-skin-pika">     
											<c:forEach var="i" items="${fileSnList }">
												<img src="/atch/getImage.do?atchFileId=${portVO.poAtchFileId }&fileSn=${i.fileSn}" alt="" onerror="/publish/ft/images/sample.png">      
											</c:forEach>
										</ul> 
									</div>
								</div> 
							</td>
						</tr>
					</tbody>
			</table>
		</div>
		<!-- //tbl -->
</div>