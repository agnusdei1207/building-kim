<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="content_box">  
	<form name="defaultFrm" id="defaultFrm" method="post">
		<input type="hidden" name="xlSeq" id="xlSeq" value="${excelVO.xlSeq }">
		<input type="hidden" name="xlAtchFileId" id="xlAtchFileId" value="${excelVO.xlAtchFileId }">
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="tbl_row_type01">      
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">   
					<col style="width:30%;"> 
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup>   
				<tbody>
					<tr>  
						<th scope="row"><strong>허가 번호</strong></th> 
						<td>
							<input type="text" name="xlLcnsNum" id="xlLcnsNum" class="text w100p" maxlength="70" value="${excelVO.xlLcnsNum }" />
						</td>
						<th scope="row"><strong>안테나 전력의 합 (W)</strong></th>
						<td>
							<input type="text" name="xlWatSum" id="xlWatSum" class="text w100p" maxlength="70" value="${excelVO.xlWatSum }" />
						</td> 
					</tr> 
					<tr>  
						<th scope="row"><strong>주파수 대역 FROM</strong></th> 
						<td>
							<input type="text" name="xlFromMhz" id="xlFromMhz" class="text w100p" maxlength="70" value="${excelVO.xlFromMhz }" />
						</td>
						<th scope="row"><strong>주파수 대역 TO</strong></th>
						<td>
							<input type="text" name="xlToMhz" id="xlToMhz" class="text w100p" maxlength="70" value="${excelVO.xlToMhz }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>우편 번호</strong></th> 
						<td>
							<input type="text" name="xlAddrsNum" id="xlAddrsNum" class="text w100p" maxlength="70" value="${excelVO.xlAddrsNum }" />
						</td>
						<th scope="row"><strong>도로명 주소</strong></th>
						<td>
							<input type="text" name="xlAddrs1" id="xlAddrs1" class="text w100p" maxlength="70" value="${excelVO.xlAddrs1 }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>상세 주소</strong></th> 
						<td>
							<input type="text" name="xlAddrs2" id="xlAddrs2" class="text w100p" maxlength="70" value="${excelVO.xlAddrs2 }" />
						</td>
						<th scope="row"><strong>설치 장소 구분</strong></th>
						<td>
							<input type="text" name="xlAddrsGooboon" id="xlAddrsGooboon" class="text w100p" maxlength="70" value="${excelVO.xlAddrsGooboon }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정 방법</strong></th> 
						<td>
							<input type="text" name="xlMeasMeth" id="xlMeasMeth" class="text w100p" maxlength="70" value="${excelVO.xlMeasMeth }" />
						</td>
						<th scope="row"><strong>측정 단위</strong></th>
						<td>
							<input type="text" name="xlMsrUnt" id="xlMsrUnt" class="text w100p" maxlength="70" value="${excelVO.xlMsrUnt }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>전자파 강도 기준</strong></th> 
						<td>
							<input type="text" name="xlEmIntStd" id="xlEmIntStd" class="text w100p" maxlength="70" value="${excelVO.xlEmIntStd }" />
						</td>
						<th scope="row"><strong>측정값(계산값)</strong></th>
						<td>
							<input type="text" name="xlMsrVl" id="xlMsrVl" class="text w100p" maxlength="70" value="${excelVO.xlMsrVl }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>노출 지수</strong></th> 
						<td>
							<input type="text" name="xlExpIdx" id="xlExpIdx" class="text w100p" maxlength="70" value="${excelVO.xlExpIdx }" />
						</td>
						<th scope="row"><strong>무선국 명</strong></th>
						<td>
							<input type="text" name="xlRadioStnm" id="xlRadioStnm" class="text w100p" maxlength="70" value="${excelVO.xlRadioStnm }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>호출 명칭</strong></th> 
						<td>
							<input type="text" name="xlCallName" id="xlCallName" class="text w100p" maxlength="70" value="${excelVO.xlCallName }" />
						</td>
						<th scope="row"><strong>위도도</strong></th> 
						<td>
							<input type="text" name="xlLatAng" id="xlLatAng" class="text w100p" maxlength="70" value="${excelVO.xlLatAng }" />
						</td>
					</tr>
					<tr>  
						<th scope="row"><strong>위도분</strong></th>
						<td>
							<input type="text" name="xlLatMin" id="xlLatMin" class="text w100p" maxlength="70" value="${excelVO.xlLatMin }" />
						</td> 
						<th scope="row"><strong>위도초</strong></th>
						<td>
							<input type="text" name="xlLatSec" id="xlLatSec" class="text w100p" maxlength="70" value="${excelVO.xlLatSec }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>경도도</strong></th> 
						<td>
							<input type="text" name="xlLngtdAng" id="xlLngtdAng" class="text w100p" maxlength="70" value="${excelVO.xlLngtdAng }" />
						</td>
						<th scope="row"><strong>경도분</strong></th>
						<td>
							<input type="text" name="xlLngtdMin" id="xlLngtdMin" class="text w100p" maxlength="70" value="${excelVO.xlLngtdMin }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>경도초</strong></th> 
						<td>
							<input type="text" name="xlLngtdSec" id="xlLngtdSec" class="text w100p" maxlength="70" value="${excelVO.xlLngtdSec }" />
						</td>
						<th scope="row"><strong>안테나 형식</strong></th>
						<td>
							<input type="text" name="xlAntTyp" id="xlAntTyp" class="text w100p" maxlength="70" value="${excelVO.xlAntTyp }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 형식 명</strong></th> 
						<td>
							<input type="text" name="xlAntTypName" id="xlAntTypName" class="text w100p" maxlength="70" value="${excelVO.xlAntTypName }" />
						</td>
						<th scope="row"><strong>안테나이득</strong></th>
						<td>
							<input type="text" name="xlAntnDeuk" id="xlAntnDeuk" class="text w100p" maxlength="70" value="${excelVO.xlAntnDeuk }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 높이</strong></th> 
						<td>
							<input type="text" name="xlAntnHght" id="xlAntnHght" class="text w100p" maxlength="70" value="${excelVO.xlAntnHght }" />
						</td>
						<th scope="row"><strong>지상고</strong></th>
						<td>
							<input type="text" name="xlGrndClrnc" id="xlGrndClrnc" class="text w100p" maxlength="70" value="${excelVO.xlGrndClrnc }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 빔 개수</strong></th> 
						<td>
							<input type="text" name="xlAntBeamCnt" id="xlAntBeamCnt" class="text w100p" maxlength="70" value="${excelVO.xlAntBeamCnt }" />
						</td>
						<th scope="row"><strong>안테나 빔 형태</strong></th>
						<td>
							<input type="text" name="xlAntBeamFrm" id="xlAntBeamFrm" class="text w100p" maxlength="70" value="${excelVO.xlAntBeamFrm }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>등가등방성방사전력(W)</strong></th> 
						<td>
							<input type="text" name="xlEqvlnIsrdp" id="xlEqvlnIsrdp" class="text w100p" maxlength="70" value="${excelVO.xlEqvlnIsrdp }" />
						</td>
						<th scope="row"><strong>중심주파수(MHz)</strong></th>
						<td>
							<input type="text" name="xlCtrFreq" id="xlCtrFreq" class="text w100p" maxlength="70" value="${excelVO.xlCtrFreq }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>대역폭(MHz)</strong></th> 
						<td>
							<input type="text" name="xlBandwidth" id="xlBandwidth" class="text w100p" maxlength="70" value="${excelVO.xlBandwidth }" />
						</td>
						<th scope="row"><strong>기준신호 측정 주파수(MHz)</strong></th>
						<td>
							<input type="text" name="xlRefSigMeasFreq" id="xlRefSigMeasFreq" class="text w100p" maxlength="70" value="${excelVO.xlRefSigMeasFreq }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>안테나 틸트각도</strong></th> 
						<td>
							<input type="text" name="xlAntTildedAng" id="xlAntTildedAng" class="text w100p" maxlength="70" value="${excelVO.xlAntTildedAng }" />
						</td>
						<th scope="row"><strong>최대 수직 빔 각도</strong></th>
						<td>
							<input type="text" name="xlMaxVrtBeamAng" id="xlMaxVrtBeamAng" class="text w100p" maxlength="70" value="${excelVO.xlMaxVrtBeamAng }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>최대 수평 빔 각도</strong></th> 
						<td>
							<input type="text" name="xlMxmHrzBmAng" id="xlMxmHrzBmAng" class="text w100p" maxlength="70" value="${excelVO.xlMxmHrzBmAng }" />
						</td>
						<th scope="row"><strong>동기신호 그룹 주기(ms)</strong></th>
						<td>
							<input type="text" name="xlRgsSgnGrpCyc" id="xlRgsSgnGrpCyc" class="text w100p" maxlength="70" value="${excelVO.xlRgsSgnGrpCyc }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>슬롯 포맷 개수</strong></th> 
						<td>
							<input type="text" name="xlNbrSlotFormats" id="xlNbrSlotFormats" class="text w100p" maxlength="70" value="${excelVO.xlNbrSlotFormats }" />
						</td>
						<th scope="row"><strong>주파수자원 블럭 개수</strong></th>
						<td>
							<input type="text" name="xlNbrFreqRcBlocks" id="xlNbrFreqRcBlocks" class="text w100p" maxlength="70" value="${excelVO.xlNbrFreqRcBlocks }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>보조반송파 개수</strong></th> 
						<td>
							<input type="text" name="xlNbrAuxCaWaves" id="xlNbrAuxCaWaves" class="text w100p" maxlength="70" value="${excelVO.xlNbrAuxCaWaves }" />
						</td>
						<th scope="row"><strong>상향 및 가드심볼 개수</strong></th>
						<td>
							<input type="text" name="xlNmbUpwGrdSym" id="xlNmbUpwGrdSym" class="text w100p" maxlength="70" value="${excelVO.xlNmbUpwGrdSym }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>한 슬롯 심볼개수</strong></th> 
						<td>
							<input type="text" name="xlSglSlotSymCnt" id="xlSglSlotSymCnt" class="text w100p" maxlength="70" value="${excelVO.xlSglSlotSymCnt }" />
						</td>
						<th scope="row"><strong>슬롯 포맷 정보</strong></th>
						<td>
							<input type="text" name="xlSlotFmtInfo" id="xlSlotFmtInfo" class="text w100p" maxlength="70" value="${excelVO.xlSlotFmtInfo }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>계산안전경계(M)</strong></th> 
						<td>
							<input type="text" name="xlCalcSBoundary" id="xlCalcSBoundary" class="text w100p" maxlength="70" value="${excelVO.xlCalcSBoundary }" />
						</td>
						<th scope="row"><strong>무선국과의거리(M)</strong></th>
						<td>
							<input type="text" name="xlDstWrlessSta" id="xlDstWrlessSta" class="text w100p" maxlength="70" value="${excelVO.xlDstWrlessSta }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정지점</strong></th> 
						<td>
							<input type="text" name="xlMsrnPnt" id="xlMsrnPnt" class="text w100p" maxlength="70" value="${excelVO.xlMsrnPnt }" />
						</td>
						<th scope="row"><strong>참고사항</strong></th>
						<td>
							<input type="text" name="xlNotes" id="xlNotes" class="text w100p" maxlength="70" value="${excelVO.xlNotes }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정일</strong></th> 
						<td>
							<input type="text" name="xlMsrmDate" id="xlMsrmDate" class="text w100p" maxlength="70" value="${excelVO.xlMsrmDate }" />
						</td>
						<th scope="row"><strong>측정시간(From)</strong></th>
						<td>
							<input type="text" name="xlMsrmFromTime" id="xlMsrmFromTime" class="text w100p" maxlength="70" value="${excelVO.xlMsrmFromTime }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정시간(To)</strong></th> 
						<td>
							<input type="text" name="xlMsrmToTime" id="xlMsrmToTime" class="text w100p" maxlength="70" value="${excelVO.xlMsrmToTime }" />
						</td>
						<th scope="row"><strong>온도(℃)</strong></th>
						<td>
							<input type="text" name="xlTemperature" id="xlTemperature" class="text w100p" maxlength="70" value="${excelVO.xlTemperature }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>습도(%)</strong></th> 
						<td>
							<input type="text" name="xlHumidity" id="xlHumidity" class="text w100p" maxlength="70" value="${excelVO.xlHumidity }" />
						</td>
						<th scope="row"><strong>날씨</strong></th>
						<td>
							<input type="text" name="xlWeather" id="xlWeather" class="text w100p" maxlength="70" value="${excelVO.xlWeather }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>동방성프로브(모델명)</strong></th> 
						<td>
							<input type="text" name="xlProvModelName" id="xlProvModelName" class="text w100p" maxlength="70" value="${excelVO.xlProvModelName }" />
						</td>
						<th scope="row"><strong>동방성프로브(일련번호)</strong></th>
						<td>
							<input type="text" name="xlProvSrlNmbr" id="xlProvSrlNmbr" class="text w100p" maxlength="70" value="${excelVO.xlProvSrlNmbr }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>동방성프로브(제조사)</strong></th> 
						<td>
							<input type="text" name="xlProvMnfct" id="xlProvMnfct" class="text w100p" maxlength="70" value="${excelVO.xlProvMnfct }" />
						</td>
						<th scope="row"><strong>동방성프로브(주파수대역 From)</strong></th>
						<td>
							<input type="text" name="xlProvFromFrqncBand" id="xlProvFromFrqncBand" class="text w100p" maxlength="70" value="${excelVO.xlProvFromFrqncBand }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>동방성프로브(주파수대역 To)</strong></th> 
						<td>
							<input type="text" name="xlProvToFrqncBand" id="xlProvToFrqncBand" class="text w100p" maxlength="70" value="${excelVO.xlProvToFrqncBand }" />
						</td>
						<th scope="row"><strong>동방성프로브(교정일자)</strong></th>
						<td>
							<input type="text" name="xlProvClbrtDate" id="xlProvClbrtDate" class="text w100p" maxlength="70" value="${excelVO.xlProvClbrtDate }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>수신기(모델명)</strong></th> 
						<td>
							<input type="text" name="xlRcvrModelName" id="xlRcvrModelName" class="text w100p" maxlength="70" value="${excelVO.xlRcvrModelName }" />
						</td>
						<th scope="row"><strong>수신기(일련번호)</strong></th>
						<td>
							<input type="text" name="xlRcvrSrlNmbr" id="xlRcvrSrlNmbr" class="text w100p" maxlength="70" value="${excelVO.xlRcvrSrlNmbr }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>수신기(제조사)</strong></th> 
						<td>
							<input type="text" name="xlRcvrMnfct" id="xlRcvrMnfct" class="text w100p" maxlength="70" value="${excelVO.xlRcvrMnfct }" />
						</td>
						<th scope="row"><strong>수신기(주파수대역 From)</strong></th>
						<td>
							<input type="text" name="xlRcvrFromFrqncBand" id="xlRcvrFromFrqncBand" class="text w100p" maxlength="70" value="${excelVO.xlRcvrFromFrqncBand }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>수신기(주파수대역 To)</strong></th> 
						<td>
							<input type="text" name="xlRcvrToFrqncBand" id="xlRcvrToFrqncBand" class="text w100p" maxlength="70" value="${excelVO.xlRcvrToFrqncBand }" />
						</td>
						<th scope="row"><strong>수신기(교정일자)</strong></th>
						<td>
							<input type="text" name="xlRcvrClbrtDate" id="xlRcvrClbrtDate" class="text w100p" maxlength="70" value="${excelVO.xlRcvrClbrtDate }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정값1(1.1m)</strong></th> 
						<td>
							<input type="text" name="xlMeasureVal1" id="xlMeasureVal1" class="text w100p" maxlength="70" value="${excelVO.xlMeasureVal1 }" />
						</td>
						<th scope="row"><strong>측정값2(1.5m)</strong></th>
						<td>
							<input type="text" name="xlMeasureVal2" id="xlMeasureVal2" class="text w100p" maxlength="70" value="${excelVO.xlMeasureVal2 }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정값3(1.7m)</strong></th> 
						<td>
							<input type="text" name="xlMeasureVal3" id="xlMeasureVal3" class="text w100p" maxlength="70" value="${excelVO.xlMeasureVal3 }" />
						</td>
						<th scope="row"><strong>계산값1(1.1m)</strong></th>
						<td>
							<input type="text" name="xlCalcVal1" id="xlCalcVal1" class="text w100p" maxlength="70" value="${excelVO.xlCalcVal1 }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>계산값2(1.5m)</strong></th> 
						<td>
							<input type="text" name="xlCalcVal2" id="xlCalcVal2" class="text w100p" maxlength="70" value="${excelVO.xlCalcVal2 }" />
						</td>
						<th scope="row"><strong>계산값3(1.7m)</strong></th>
						<td>
							<input type="text" name="xlCalcVal3" id="xlCalcVal3" class="text w100p" maxlength="70" value="${excelVO.xlCalcVal3 }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>평균측정시간(분)</strong></th> 
						<td>
							<input type="text" name="xlAvrgMstmMin" id="xlAvrgMstmMin" class="text w100p" maxlength="70" value="${excelVO.xlAvrgMstmMin }" />
						</td>
						<th scope="row"><strong>보상계수</strong></th>
						<td>
							<input type="text" name="xlRwrdCfcnt" id="xlRwrdCfcnt" class="text w100p" maxlength="70" value="${excelVO.xlRwrdCfcnt }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>트래픽에 의한 보상계수</strong></th> 
						<td>
							<input type="text" name="xlCmpCfcDueTrf" id="xlCmpCfcDueTrf" class="text w100p" maxlength="70" value="${excelVO.xlCmpCfcDueTrf }" />
						</td>
						<th scope="row"><strong>측정최대값</strong></th>
						<td>
							<input type="text" name="xlMeasMax" id="xlMeasMax" class="text w100p" maxlength="70" value="${excelVO.xlMeasMax }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>계산최대값</strong></th> 
						<td>
							<input type="text" name="xlCalcMax" id="xlCalcMax" class="text w100p" maxlength="70" value="${excelVO.xlCalcMax }" />
						</td>
						<th scope="row"><strong>전자파강도 기준값(From)</strong></th>
						<td>
							<input type="text" name="xlFromElctrInrfv" id="xlFromElctrInrfv" class="text w100p" maxlength="70" value="${excelVO.xlFromElctrInrfv }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>전자파강도 기준값(To)</strong></th> 
						<td>
							<input type="text" name="xlToElctrInrfv" id="xlToElctrInrfv" class="text w100p" maxlength="70" value="${excelVO.xlToElctrInrfv }" />
						</td>
						<th scope="row"><strong>기준주파수(MHz)</strong></th>
						<td>
							<input type="text" name="xlRfrncFrqnc" id="xlRfrncFrqnc" class="text w100p" maxlength="70" value="${excelVO.xlRfrncFrqnc }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>전력밀도측정 환산식</strong></th> 
						<td>
							<input type="text" name="xlPwrmsCnvrs" id="xlPwrmsCnvrs" class="text w100p" maxlength="70" value="${excelVO.xlPwrmsCnvrs }" />
						</td>
						<th scope="row"><strong>작성일자</strong></th>
						<td>
							<input type="text" name="xlDatePrprt" id="xlDatePrprt" class="text w100p" maxlength="70" value="${excelVO.xlDatePrprt }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정기관명</strong></th> 
						<td>
							<input type="text" name="xlNmmsInstt" id="xlNmmsInstt" class="text w100p" maxlength="70" value="${excelVO.xlNmmsInstt }" />
						</td>
						<th scope="row"><strong>측정기관주소</strong></th>
						<td>
							<input type="text" name="xlMsrnInstAdrs" id="xlMsrnInstAdrs" class="text w100p" maxlength="70" value="${excelVO.xlMsrnInstAdrs }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정자</strong></th> 
						<td>
							<input type="text" name="xlMeasurersHumanName" id="xlMeasurersHumanName" class="text w100p" maxlength="70" value="${excelVO.xlMeasurersHumanName }" />
						</td>
						<th scope="row"><strong>작성자</strong></th>
						<td>
							<input type="text" name="xlWriter" id="xlWriter" class="text w100p" maxlength="70" value="${excelVO.xlWriter }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>시스템손실(DB)</strong></th> 
						<td>
							<input type="text" name="xlSystemLoss" id="xlSystemLoss" class="text w100p" maxlength="70" value="${excelVO.xlSystemLoss }" />
						</td>
						<th scope="row"><strong>측정간격(M)</strong></th>
						<td>
							<input type="text" name="xlMsrngIntrv" id="xlMsrngIntrv" class="text w100p" maxlength="70" value="${excelVO.xlMsrngIntrv }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>측정지점수(개)</strong></th> 
						<td>
							<input type="text" name="xlNbrMeasPts" id="xlNbrMeasPts" class="text w100p" maxlength="70" value="${excelVO.xlNbrMeasPts }" />
						</td>
						<th scope="row"><strong>복사원갯수</strong></th>
						<td>
							<input type="text" name="xlNmbrCps" id="xlNmbrCps" class="text w100p" maxlength="70" value="${excelVO.xlNmbrCps }" />
						</td> 
					</tr>
					<tr>  
						<th scope="row"><strong>다중복사원총노출지수</strong></th> 
						<td>
							<input type="text" name="xlMltplRdexn" id="xlMltplRdexn" class="text w100p" maxlength="70" value="${excelVO.xlMltplRdexn }" />
						</td>
						<th scope="row"><strong>이동통신사지역</strong></th>
						<td>
							<input type="text" name="xlMobileCrrrArea" id="xlMobileCrrrArea" class="text w100p" maxlength="70" value="${excelVO.xlMobileCrrrArea }" />
						</td> 
					</tr>
					<tr> 
						<th scope="row"><strong>첨부 파일</strong></th>     
						<td colspan="3">  
							<iframe name="xlAtchFileIdFrame" id="xlAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${excelVO.xlAtchFileId }&fileCnt=5&atchFileIdNm=xlAtchFileId&updateType=imageUpload" style="width: 100%;" frameborder="0" frTitle="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>   
			</table> 
		</div>
		<div class="btn_area">
			<a href="javascript:void(0)" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" onclick="submit('${excelVO.xlLcnsNum}')" id="btn_submit">${not empty excelVO.xlLcnsNum ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="javascript:void(0)" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form>
</div>

<script type="text/javascript">
    
    
function submit(title){
	  
	if($("#xlLcnsNum").val() == null || $("#xlLcnsNum").val() == "") {
		checkMsg("#xlLcnsNum", "허가 번호를 입력하세요.");
		return false;
	}  
	     
	if(title == null || title == ""){
		fncPageBoard('submit','insertProc.do');
		return false;
	}else{
		fncPageBoard('update','updateProc.do');
		return false;
	}
} 
  
$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
});



</script>

