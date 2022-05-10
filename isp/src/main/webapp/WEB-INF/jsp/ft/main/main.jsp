<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>김건축사무소</title>
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/style.css">
	<script type="text/javascript" src="/publish/ft/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/publish/ft/js/common.js"></script>
		<script type="text/javascript" src="/publish/ma/js/board.js"></script>
	<script type="text/javascript" src="/publish/ft/js/jquery.bxslider.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function() {
			$('.slider').bxSlider({
				controls:false,  
				auto: true,        
				autoControls: true,
				autoControlsCombine:true,
				pager:true, 
				pause: 4000  
			}); 
			
			$.ajax({
				method : "POST",
				url : "/ft/main/addList.do",
			    dataType: "html",
				success : function(data){
					console.log(data);    
					$("#main_tab01").html(data);
				}
			})
		}); 
	function port(category){
		$.ajax({   
			method : "POST",
			url : "/ft/main/addList.do", 
			data : {"category" : category},
		    dataType: "html", 
			success : function(data){  
				console.log(data);  
				$("#main_tab01").html(data);
			}
		})
	} 
	</script> 
 </head>
 <body>  
	<div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
	<div id="wrapper">
		<!-- header  --> 
		<div class="gnb_bg"></div> 
		<header id="header">
			<div class="header_box">
				<h1 class="logo"><a href="/ft/main/main.do"><img src="/publish/ft/images/common/logo.png" alt="김건축사무소"/></a></h1>
				<div class="util_box">  
					<ul class=" clear"> 
						<c:choose>      
							<c:when test="${empty memberVO }">
								<li><a href="/ft/main/main.do">HOME</a></li>
								<li><a href="/ft/member/login/loginFrm.do">로그인</a></li>
								<li><a href="/ft/member/join/agreeFrm.do">회원가입</a></li>
								<li><a href="/login.do"><i class="fa fa-star"></i>즐겨찾기</a></li>
							</c:when>  
							<c:otherwise>           
								<li><a href="/ft/member/myHome/checkPwFrm.do">${memberVO.meId } 님 마이홈</a></li>
								<li><a href="/ft/member/login/logout.do">로그아웃</a></li>
								<li><a href="/login.do"><i class="fa fa-star"></i>즐겨찾기</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>         
			</div>     
			<!-- GNB --> 
			<h2 class="hidden">주메뉴</h2>
			<div id="gnb_area">
				<nav id="gnb">
					<ul class="depth2 clear">
						<c:if test="${fn:length(allMenu) gt 0 }">    
							<c:forEach var="main" items="${allMenu }">
								<li class="depth1_1">
									<a href="${main.url }">${main.menuNm }</a>
									<ul class="depthBox">
										<c:forEach var="sub" items="${main.menuList }">
											<li><a href="${sub.url }">${sub.menuNm }</a></li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</c:if> 
					</ul>
				</nav>  
			</div>
			<!-- //GNB --> 
		</header>     
		<!-- // header   --> 
		<!-- container -->   
		<div id="container">      
			<div class="main_slider">     
				<ul class="slider">        
					<c:choose> 
						<c:when test="${fn:length(ceoFileSnList) gt 0 }">
							<c:forEach var="ceo" items="${ceoFileSnList }">
								<li>        
									<img src="/atch/getImage.do?atchFileId=${ceoVO.ceAtchFileId }&fileSn=${ceo.fileSn}" style="width:1900px; height:460px;" alt="" >
								</li>      
							</c:forEach>     
						</c:when>
						<c:otherwise>   
							<li>        
								<img src="/publish/ft/images/sample.png" style="width:1900px; height:460px;">
							</li>  
						</c:otherwise>
					</c:choose> 
				</ul>       
			</div>       
			<div id="main_content">      
				<div class="main_conts clear"> 
					<div class="notice_box" style="width:399.35px"> 
						<div >   
							<h3>공지사항</h3>       
							<ul class="notice_list"> 
								<c:if test="${fn:length(ntcList) gt 0}">
									<c:forEach var="ntcVO" items="${ntcList }">
										<li>
											<a href="/ft/cent/ntc/view.do?ntSeq=${ntcVO.ntSeq }">${ntcVO.ntTitle }</a><span class="date">${ntcVO.ntRgstDt }</span>
										</li>
									</c:forEach>   
								</c:if>
							</ul>
							<a href="javascript:void(0)" class="more"></a> 
						</div>   
					</div>          
					<c:if test="${fn:length(bannerList) gt 0 }">      
						<c:forEach var="bannerVO" items="${bannerList }">      
							<c:choose>
								<c:when test="${not empty bannerVO.baAtchFileId }">
									<div class="quotation" style="background:url(/atch/getImage.do?atchFileId=${bannerVO.baAtchFileId }&fileSn=0) no-repeat 0 100%; background-size:cover; width:399.34px;" >
									<h3 class="tit_quotation"></h3> 
										<div>            
											<p>${bannerVO.baTitle }</p>
				                            <p>${bannerVO.baTitle }</p>
				                            <a href="${bannerVO.baUrl}" target="${bannerVO.baWindow eq 'Y' ? '_blank' : '_self' }"  alt="견적문의">${bannerVO.baTitle } 바로가기<span class="quotation_arrow"></span></a>
										</div> 
									</div> 
								</c:when>           
								<c:otherwise>
									<div class="quotation" style="background:url(/isp/src/main/webapp/publish/ft/images/sample.png) no-repeat 0 100%; background-size:cover;  width:399.34px;" >
									<h3 class="tit_quotation"></h3> 
										<div>       
											<p>${bannerVO.baTitle }</p>
				                            <p>${bannerVO.baTitle }</p>
				                            <a href="${bannerVO.baUrl}" target="${bannerVO.baWindow eq 'Y' ? '_blank' : '_self' }"  alt="견적문의">${bannerVO.baTitle } 바로가기<span class="quotation_arrow"></span></a>
										</div> 
									</div>   
								</c:otherwise>  
							</c:choose>          
						</c:forEach>  
					</c:if>
				</div> 
				<div class="main_tabarea clear"> 
					<ul class="tab_menu main_tab">
						<li onclick="port('B')" class="current"><a href="#main_tab01"><span class="icon_tab01"></span><span>시공사례</span></a></li>
						<li onclick="port('R')"><a href="javascript:void(0)"><span class="icon_tab02"></span><span>추천설계</span></a></li>
						<li onclick="port('S')"><a href="javascript:void(0)"><span class="icon_tab03"></span><span>시공현장</span></a></li>
						<li onclick="port('I')"><a href="javascript:void(0)"><span class="icon_tab04"></span><span>인테리어사례</span></a></li>
					</ul>
					<!-- 포트폴리오 -->
					<div id="main_tab01" class="tab_content main_tabcont">
					</div>   
					<!-- 포트폴리오 --> 
				</div>    
			</div>   
			<div class="quick_menu">  
				<ul>    
					<li class="quick01">
						<a href="/ft/intro/greet/list.do"><span class="icon_quick"></span><span>인사말</span></a>
					</li>
					<li class="quick02">
						<a href="/ft/guide/advnt/list.do"><span class="icon_quick"></span><span>건축정보</span></a>
					</li>
					<li class="quick03">
						<a href="/ft/cent/free/list.do"><span class="icon_quick"></span><span>자유게시판</span></a>
					</li>
					<li class="quick04">
						<a href="/ft/intro/boundary/list.do"><span class="icon_quick"></span><span>사업영역</span></a>
					</li>
					<li class="btn_top"><strong>Top</strong></li>
				</ul>
			</div>
		</div>   
			
	<!-- //container --> 
	<!-- footer -->
	<footer id="footer">
		<div class="footer_area">
			<div class="footer_box">
				<div class="customer_center" style="top:-1px">
					<table>
						<thead>
							<tr>
								<th colspan="2">고객센터</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>평일</th>
								<td class="r" > 09:00 ~ 18:00</td>
							</tr>
							<tr>
								<th>토요일</th>
								<td class="r" >09:00 ~ 12:00</td>
							</tr>
						</tbody>
					</table>  
				</div>  
				<p class="address">주소 : ${ceoVO.ceAdd } </p>
				<ul class="clear">
					<li>대표 : ${ceoVO.ceName }  ㅣ  사업자등록번호 : ${ceoVO.ceNum }</li>
					<li><i class="fa fa-phone"></i>${ceoVO.ceHp }</li>
					<li><i class="fa fa-fax"></i>FAX : ${ceoVO.ceHp }</li>   
					<li><i class="fa fa-envelope"></i> ${ceoVO.ceHp }</li>
				</ul>
				<p class="copy">2022 Copyright by ${ceoVO.ceName } 사무소 &copy; all right reserved.</p>
			</div>
		</div>
	</footer>
	<!-- //footer -->
	</div>  </body>
</html>



