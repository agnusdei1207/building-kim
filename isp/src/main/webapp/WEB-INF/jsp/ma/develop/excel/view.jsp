<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">    
		<input type="hidden" name="xlSeq" id="xlSeq" value="${excelVO.xlSeq }">
		<input type="hidden" name="xlAtchFileId" id="xlAtchFileId" value="${excelVO.xlAtchFileId }">
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
						<th scope="row"><strong>허가 번호</strong></th> 
						<td>
							${excelVO.xlLcnsNum }
						</td>
						<th scope="row"><strong>안테나 전력의 합 (W)</strong></th>
						<td>
							${excelVO.xlWatSum }
						</td> 
					</tr> 
					<tr>  
						<th scope="row"><strong>주파수 대역 FROM</strong></th> 
						<td>
							${excelVO.xlFromMhz }
						</td>
						<th scope="row"><strong>주파수 대역 TO</strong></th>
						<td>
							${excelVO.xlToMhz }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>우편 번호</strong></th> 
						<td>
							${excelVO.xlAddrsNum }
						</td>
						<th scope="row"><strong>도로명 주소</strong></th>
						<td>
							${excelVO.xlAddrs1 }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>상세 주소</strong></th> 
						<td>
							${excelVO.xlAddrs2 }
						</td>
						<th scope="row"><strong>설치 장소 구분</strong></th>
						<td>
							${excelVO.xlAddrsGooboon }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정 방법</strong></th> 
						<td>
							${excelVO.xlMeasMeth }
						</td>
						<th scope="row"><strong>측정 단위</strong></th>
						<td>
							${excelVO.xlMsrUnt }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>전자파 강도 기준</strong></th> 
						<td>
							${excelVO.xlEmIntStd }
						</td>
						<th scope="row"><strong>측정값(계산값)</strong></th>
						<td>
							${excelVO.xlMsrVl }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>노출 지수</strong></th> 
						<td>
							${excelVO.xlExpIdx }
						</td>
						<th scope="row"><strong>무선국 명</strong></th>
						<td>
							${excelVO.xlRadioStnm }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>호출 명칭</strong></th> 
						<td>
							${excelVO.xlCallName }
						</td>
						<th scope="row"><strong>위도도</strong></th> 
						<td>
							${excelVO.xlLatAng }
						</td>
					</tr>
					<tr>  
						<th scope="row"><strong>위도분</strong></th>
						<td>
							${excelVO.xlLatMin }
						</td> 
						<th scope="row"><strong>위도초</strong></th>
						<td>
							${excelVO.xlLatSec }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>경도도</strong></th> 
						<td>
							${excelVO.xlLngtdAng }
						</td>
						<th scope="row"><strong>경도분</strong></th>
						<td>
							${excelVO.xlLngtdMin }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>경도초</strong></th> 
						<td>
							${excelVO.xlLngtdSec }
						</td>
						<th scope="row"><strong>안테나 형식</strong></th>
						<td>
							${excelVO.xlAntTyp }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 형식 명</strong></th> 
						<td>
							${excelVO.xlAntTypName }
						</td>
						<th scope="row"><strong>안테나이득</strong></th>
						<td>
							${excelVO.xlAntnDeuk }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 높이</strong></th> 
						<td>
							${excelVO.xlAntnHght }
						</td>
						<th scope="row"><strong>지상고</strong></th>
						<td>
							${excelVO.xlGrndClrnc }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 빔 개수</strong></th> 
						<td>
							${excelVO.xlAntBeamCnt }
						</td>
						<th scope="row"><strong>안테나 빔 형태</strong></th>
						<td>
							${excelVO.xlAntBeamFrm }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>등가등방성방사전력(W)</strong></th> 
						<td>
							${excelVO.xlEqvlnIsrdp }
						</td>
						<th scope="row"><strong>중심주파수(MHz)</strong></th>
						<td>
							${excelVO.xlCtrFreq }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>대역폭(MHz)</strong></th> 
						<td>
							${excelVO.xlBandwidth }
						</td>
						<th scope="row"><strong>기준신호 측정 주파수(MHz)</strong></th>
						<td>
							${excelVO.xlRefSigMeasFreq }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 틸트각도</strong></th> 
						<td>
							${excelVO.xlAntTildedAng }
						</td>
						<th scope="row"><strong>최대 수직 빔 각도</strong></th>
						<td>
							${excelVO.xlMaxVrtBeamAng }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>최대 수평 빔 각도</strong></th> 
						<td>
							${excelVO.xlMxmHrzBmAng }
						</td>
						<th scope="row"><strong>동기신호 그룹 주기(ms)</strong></th>
						<td>
							${excelVO.xlRgsSgnGrpCyc }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>슬롯 포맷 개수</strong></th> 
						<td>
							${excelVO.xlNbrSlotFormats }
						</td>
						<th scope="row"><strong>주파수자원 블럭 개수</strong></th>
						<td>
							${excelVO.xlNbrFreqRcBlocks }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>보조반송파 개수</strong></th> 
						<td>
							${excelVO.xlNbrAuxCaWaves }
						</td>
						<th scope="row"><strong>상향 및 가드심볼 개수</strong></th>
						<td>
							${excelVO.xlNmbUpwGrdSym }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>한 슬롯 심볼개수</strong></th> 
						<td>
							${excelVO.xlSglSlotSymCnt }
						</td>
						<th scope="row"><strong>슬롯 포맷 정보</strong></th>
						<td>
							${excelVO.xlSlotFmtInfo }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>계산안전경계(M)</strong></th> 
						<td>
							${excelVO.xlCalcSBoundary }
						</td>
						<th scope="row"><strong>무선국과의거리(M)</strong></th>
						<td>
							${excelVO.xlDstWrlessSta }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정지점</strong></th> 
						<td>
							${excelVO.xlMsrnPnt }
						</td>
						<th scope="row"><strong>참고사항</strong></th>
						<td>
							${excelVO.xlNotes }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정일</strong></th> 
						<td>
							${excelVO.xlMsrmDate }
						</td>
						<th scope="row"><strong>측정시간(From)</strong></th>
						<td>
							${excelVO.xlMsrmFromTime }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정시간(To)</strong></th> 
						<td>
							${excelVO.xlMsrmToTime }
						</td>
						<th scope="row"><strong>온도(℃)</strong></th>
						<td>
							${excelVO.xlTemperature }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>습도(%)</strong></th> 
						<td>
							${excelVO.xlHumidity }
						</td>
						<th scope="row"><strong>날씨</strong></th>
						<td>
							${excelVO.xlWeather }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>동방성프로브(모델명)</strong></th> 
						<td>
							${excelVO.xlProvModelName }
						</td>
						<th scope="row"><strong>동방성프로브(일련번호)</strong></th>
						<td>
							${excelVO.xlProvSrlNmbr }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>동방성프로브(제조사)</strong></th> 
						<td>
							${excelVO.xlProvMnfct }
						</td>
						<th scope="row"><strong>동방성프로브(주파수대역 From)</strong></th>
						<td>
							${excelVO.xlProvFromFrqncBand }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>동방성프로브(주파수대역 To)</strong></th> 
						<td>
							${excelVO.xlProvToFrqncBand }
						</td>
						<th scope="row"><strong>동방성프로브(교정일자)</strong></th>
						<td>
							${excelVO.xlProvClbrtDate }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>수신기(모델명)</strong></th> 
						<td>
							${excelVO.xlRcvrModelName }
						</td>
						<th scope="row"><strong>수신기(일련번호)</strong></th>
						<td>
							${excelVO.xlRcvrSrlNmbr }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>수신기(제조사)</strong></th> 
						<td>
							${excelVO.xlRcvrMnfct }
						</td>
						<th scope="row"><strong>수신기(주파수대역 From)</strong></th>
						<td>
							${excelVO.xlRcvrFromFrqncBand }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>수신기(주파수대역 To)</strong></th> 
						<td>
							${excelVO.xlRcvrToFrqncBand }
						</td>
						<th scope="row"><strong>수신기(교정일자)</strong></th>
						<td>
							${excelVO.xlRcvrClbrtDate }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정값1(1.1m)</strong></th> 
						<td>
							${excelVO.xlMeasureVal1 }
						</td>
						<th scope="row"><strong>측정값2(1.5m)</strong></th>
						<td>
							${excelVO.xlMeasureVal2 }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정값3(1.7m)</strong></th> 
						<td>
							${excelVO.xlMeasureVal3 }
						</td>
						<th scope="row"><strong>계산값1(1.1m)</strong></th>
						<td>
							${excelVO.xlCalcVal1 }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>계산값2(1.5m)</strong></th> 
						<td>
							${excelVO.xlCalcVal2 }
						</td>
						<th scope="row"><strong>계산값3(1.7m)</strong></th>
						<td>
							${excelVO.xlCalcVal3 }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>평균측정시간(분)</strong></th> 
						<td>
							${excelVO.xlAvrgMstmMin }
						</td>
						<th scope="row"><strong>보상계수</strong></th>
						<td>
							${excelVO.xlRwrdCfcnt }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>트래픽에 의한 보상계수</strong></th> 
						<td>
							${excelVO.xlCmpCfcDueTrf }
						</td>
						<th scope="row"><strong>측정최대값</strong></th>
						<td>
							${excelVO.xlMeasMax }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>계산최대값</strong></th> 
						<td>
							${excelVO.xlCalcMax }
						</td>
						<th scope="row"><strong>전자파강도 기준값(From)</strong></th>
						<td>
							${excelVO.xlFromElctrInrfv }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>전자파강도 기준값(To)</strong></th> 
						<td>
							${excelVO.xlToElctrInrfv }
						</td>
						<th scope="row"><strong>기준주파수(MHz)</strong></th>
						<td>
							${excelVO.xlRfrncFrqnc }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>전력밀도측정 환산식</strong></th> 
						<td>
							${excelVO.xlPwrmsCnvrs }
						</td>
						<th scope="row"><strong>작성일자</strong></th>
						<td>
							${excelVO.xlDatePrprt }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정기관명</strong></th> 
						<td>
							${excelVO.xlNmmsInstt }
						</td>
						<th scope="row"><strong>측정기관주소</strong></th>
						<td>
							${excelVO.xlMsrnInstAdrs }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정자</strong></th> 
						<td>
							${excelVO.xlMeasurersHumanName }
						</td>
						<th scope="row"><strong>작성자</strong></th>
						<td>
							${excelVO.xlWriter }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>시스템손실(DB)</strong></th> 
						<td>
							${excelVO.xlSystemLoss }
						</td>
						<th scope="row"><strong>측정간격(M)</strong></th>
						<td>
							${excelVO.xlMsrngIntrv }
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정지점수(개)</strong></th> 
						<td>
							${excelVO.xlNbrMeasPts }
						</td>
						<th scope="row"><strong>복사원갯수</strong></th>
						<td>
							${excelVO.xlNmbrCps }
						</td> 
					</tr> 
					<tr>  
						<th scope="row"><strong>다중복사원총노출지수</strong></th> 
						<td>
							${excelVO.xlMltplRdexn }
						</td>
						<th scope="row"><strong>이동통신사지역</strong></th>
						<td>
							${excelVO.xlMobileCrrrArea }
						</td> 
					</tr>  
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>  
						<td colspan="3">
							<c:choose>   
								<c:when test="${fn:length(fileSnList) gt 0 }">
									<c:forEach var="i" items="${fileSnList }">
										<img src="/atch/getImage.do?atchFileId=${excelVO.xlAtchFileId }&fileSn=${i.fileSn}" alt="">      
									</c:forEach>
								</c:when>
								<c:otherwise>
									이미지 없음     
								</c:otherwise>  
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div> 
		
	<div class="btn_area">
		<a href="javascript:void(0)" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0)" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0)" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form>
</div>
