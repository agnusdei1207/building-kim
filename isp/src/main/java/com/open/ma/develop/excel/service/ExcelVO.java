package com.open.ma.develop.excel.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

       
@Alias("excelVO")
@SuppressWarnings("serial")
public class ExcelVO extends CmmnDefaultVO implements Serializable {
	
	private String xlRcpNum             ;
	private String xlSeq                ;
	private String xlLcnsNum            ;
	private String xlWatSum             ;
	private String xlFromMhz            ;
	private String xlToMhz              ;
	private String xlAddrsNum           ;
	private String xlAddrs1             ;
	private String xlAddrs2             ;
	private String xlAddrsGooboon       ;
	private String xlMeasMeth           ;
	private String xlMsrUnt             ;
	private String xlEmIntStd           ;
	private String xlMsrVl              ;
	private String xlExpIdx             ;
	private String xlRadioStnm          ;
	private String xlCallName           ;
	private String xlLatAng             ;
	private String xlLatMin             ;
	private String xlLatSec             ;
	private String xlLngtdAng           ;
	private String xlLngtdMin           ;
	private String xlLngtdSec           ;
	private String xlAntTyp             ;
	private String xlAntTypName         ;
	private String xlAntnDeuk           ;
	private String xlAntnHght           ;
	private String xlGrndClrnc          ;
	private String xlAntBeamCnt         ;
	private String xlAntBeamFrm         ;
	private String xlEqvlnIsrdp         ;
	private String xlCtrFreq            ;
	private String xlBandwidth          ;
	private String xlRefSigMeasFreq     ;
	private String xlAntTildedAng       ;
	private String xlMaxVrtBeamAng      ;
	private String xlMxmHrzBmAng        ;
	private String xlRgsSgnGrpCyc       ;
	private String xlNbrSlotFormats     ;
	private String xlNbrFreqRcBlocks    ;
	private String xlNbrAuxCaWaves      ;
	private String xlNmbUpwGrdSym       ;
	private String xlSglSlotSymCnt      ;
	private String xlSlotFmtInfo        ;
	private String xlCalcSBoundary      ;
	private String xlDstWrlessSta       ;
	private String xlMsrnPnt            ;
	private String xlNotes              ;
	private String xlMsrmDate           ;
	private String xlMsrmFromTime       ;
	private String xlMsrmToTime         ;
	private String xlTemperature        ;
	private String xlHumidity           ;
	private String xlWeather            ;
	private String xlProvModelName      ;
	private String xlProvSrlNmbr        ;
	private String xlProvMnfct          ;
	private String xlProvFromFrqncBand  ;
	private String xlProvToFrqncBand    ;
	private String xlProvClbrtDate      ;
	private String xlRcvrModelName      ;
	private String xlRcvrSrlNmbr        ;
	private String xlRcvrMnfct          ;
	private String xlRcvrFromFrqncBand  ;
	private String xlRcvrToFrqncBand    ;
	private String xlRcvrClbrtDate      ;
	private String xlMeasureVal1        ;
	private String xlMeasureVal2        ;
	private String xlMeasureVal3        ;
	private String xlCalcVal1           ;
	private String xlCalcVal2           ;
	private String xlCalcVal3           ;
	private String xlAvrgMstmMin        ;
	private String xlRwrdCfcnt          ;
	private String xlCmpCfcDueTrf       ;
	private String xlMeasMax            ;
	private String xlCalcMax            ;
	private String xlFromElctrInrfv     ;
	private String xlToElctrInrfv       ;
	private String xlRfrncFrqnc         ;
	private String xlPwrmsCnvrs         ;
	private String xlDatePrprt          ;
	private String xlNmmsInstt          ;
	private String xlMsrnInstAdrs       ;
	private String xlMeasurersHumanName ; 
	private String xlWriter             ;
	private String xlSystemLoss         ;
	private String xlMsrngIntrv         ;
	private String xlNbrMeasPts         ;
	private String xlNmbrCps            ;
	private String xlMltplRdexn         ;
	private String xlMobileCrrrArea     ;
	private String xlAtchFileId		    ;
	private String xlCnt				;
	private List<ExcelVO> excelList 	;
	
	
	public List<ExcelVO> getExcelList() {
		return excelList;
	}
	public void setExcelList(List<ExcelVO> excelList) {
		this.excelList = excelList;
	}
	public String getXlRcpNum() {
		return xlRcpNum;
	}
	public void setXlRcpNum(String xlRcpNum) {
		this.xlRcpNum = xlRcpNum;
	}
	public String getXlSeq() {
		return xlSeq;
	}
	public void setXlSeq(String xlSeq) {
		this.xlSeq = xlSeq;
	}
	public String getXlLcnsNum() {
		return xlLcnsNum;
	}
	public void setXlLcnsNum(String xlLcnsNum) {
		this.xlLcnsNum = xlLcnsNum;
	}
	public String getXlWatSum() {
		return xlWatSum;
	}
	public void setXlWatSum(String xlWatSum) {
		this.xlWatSum = xlWatSum;
	}
	public String getXlFromMhz() {
		return xlFromMhz;
	}
	public void setXlFromMhz(String xlFromMhz) {
		this.xlFromMhz = xlFromMhz;
	}
	public String getXlToMhz() {
		return xlToMhz;
	}
	public void setXlToMhz(String xlToMhz) {
		this.xlToMhz = xlToMhz;
	}
	public String getXlAddrsNum() {
		return xlAddrsNum;
	}
	public void setXlAddrsNum(String xlAddrsNum) {
		this.xlAddrsNum = xlAddrsNum;
	}
	public String getXlAddrs1() {
		return xlAddrs1;
	}
	public void setXlAddrs1(String xlAddrs1) {
		this.xlAddrs1 = xlAddrs1;
	}
	public String getXlAddrs2() {
		return xlAddrs2;
	}
	public void setXlAddrs2(String xlAddrs2) {
		this.xlAddrs2 = xlAddrs2;
	}
	public String getXlAddrsGooboon() {
		return xlAddrsGooboon;
	}
	public void setXlAddrsGooboon(String xlAddrsGooboon) {
		this.xlAddrsGooboon = xlAddrsGooboon;
	}
	public String getXlMeasMeth() {
		return xlMeasMeth;
	}
	public void setXlMeasMeth(String xlMeasMeth) {
		this.xlMeasMeth = xlMeasMeth;
	}
	public String getXlMsrUnt() {
		return xlMsrUnt;
	}
	public void setXlMsrUnt(String xlMsrUnt) {
		this.xlMsrUnt = xlMsrUnt;
	}
	public String getXlEmIntStd() {
		return xlEmIntStd;
	}
	public void setXlEmIntStd(String xlEmIntStd) {
		this.xlEmIntStd = xlEmIntStd;
	}
	public String getXlMsrVl() {
		return xlMsrVl;
	}
	public void setXlMsrVl(String xlMsrVl) {
		this.xlMsrVl = xlMsrVl;
	}
	public String getXlExpIdx() {
		return xlExpIdx;
	}
	public void setXlExpIdx(String xlExpIdx) {
		this.xlExpIdx = xlExpIdx;
	}
	public String getXlRadioStnm() {
		return xlRadioStnm;
	}
	public void setXlRadioStnm(String xlRadioStnm) {
		this.xlRadioStnm = xlRadioStnm;
	}
	public String getXlCallName() {
		return xlCallName;
	}
	public void setXlCallName(String xlCallName) {
		this.xlCallName = xlCallName;
	}
	public String getXlLatAng() {
		return xlLatAng;
	}
	public void setXlLatAng(String xlLatAng) {
		this.xlLatAng = xlLatAng;
	}
	public String getXlLatMin() {
		return xlLatMin;
	}
	public void setXlLatMin(String xlLatMin) {
		this.xlLatMin = xlLatMin;
	}
	public String getXlLatSec() {
		return xlLatSec;
	}
	public void setXlLatSec(String xlLatSec) {
		this.xlLatSec = xlLatSec;
	}
	public String getXlLngtdAng() {
		return xlLngtdAng;
	}
	public void setXlLngtdAng(String xlLngtdAng) {
		this.xlLngtdAng = xlLngtdAng;
	}
	public String getXlLngtdMin() {
		return xlLngtdMin;
	}
	public void setXlLngtdMin(String xlLngtdMin) {
		this.xlLngtdMin = xlLngtdMin;
	}
	public String getXlLngtdSec() {
		return xlLngtdSec;
	}
	public void setXlLngtdSec(String xlLngtdSec) {
		this.xlLngtdSec = xlLngtdSec;
	}
	public String getXlAntTyp() {
		return xlAntTyp;
	}
	public void setXlAntTyp(String xlAntTyp) {
		this.xlAntTyp = xlAntTyp;
	}
	public String getXlAntTypName() {
		return xlAntTypName;
	}
	public void setXlAntTypName(String xlAntTypName) {
		this.xlAntTypName = xlAntTypName;
	}
	public String getXlAntnDeuk() {
		return xlAntnDeuk;
	}
	public void setXlAntnDeuk(String xlAntnDeuk) {
		this.xlAntnDeuk = xlAntnDeuk;
	}
	public String getXlAntnHght() {
		return xlAntnHght;
	}
	public void setXlAntnHght(String xlAntnHght) {
		this.xlAntnHght = xlAntnHght;
	}
	public String getXlGrndClrnc() {
		return xlGrndClrnc;
	}
	public void setXlGrndClrnc(String xlGrndClrnc) {
		this.xlGrndClrnc = xlGrndClrnc;
	}
	public String getXlAntBeamCnt() {
		return xlAntBeamCnt;
	}
	public void setXlAntBeamCnt(String xlAntBeamCnt) {
		this.xlAntBeamCnt = xlAntBeamCnt;
	}
	public String getXlAntBeamFrm() {
		return xlAntBeamFrm;
	}
	public void setXlAntBeamFrm(String xlAntBeamFrm) {
		this.xlAntBeamFrm = xlAntBeamFrm;
	}
	public String getXlEqvlnIsrdp() {
		return xlEqvlnIsrdp;
	}
	public void setXlEqvlnIsrdp(String xlEqvlnIsrdp) {
		this.xlEqvlnIsrdp = xlEqvlnIsrdp;
	}
	public String getXlCtrFreq() {
		return xlCtrFreq;
	}
	public void setXlCtrFreq(String xlCtrFreq) {
		this.xlCtrFreq = xlCtrFreq;
	}
	public String getXlBandwidth() {
		return xlBandwidth;
	}
	public void setXlBandwidth(String xlBandwidth) {
		this.xlBandwidth = xlBandwidth;
	}
	public String getXlRefSigMeasFreq() {
		return xlRefSigMeasFreq;
	}
	public void setXlRefSigMeasFreq(String xlRefSigMeasFreq) {
		this.xlRefSigMeasFreq = xlRefSigMeasFreq;
	}
	public String getXlAntTildedAng() {
		return xlAntTildedAng;
	}
	public void setXlAntTildedAng(String xlAntTildedAng) {
		this.xlAntTildedAng = xlAntTildedAng;
	}
	public String getXlMaxVrtBeamAng() {
		return xlMaxVrtBeamAng;
	}
	public void setXlMaxVrtBeamAng(String xlMaxVrtBeamAng) {
		this.xlMaxVrtBeamAng = xlMaxVrtBeamAng;
	}
	public String getXlMxmHrzBmAng() {
		return xlMxmHrzBmAng;
	}
	public void setXlMxmHrzBmAng(String xlMxmHrzBmAng) {
		this.xlMxmHrzBmAng = xlMxmHrzBmAng;
	}
	public String getXlRgsSgnGrpCyc() {
		return xlRgsSgnGrpCyc;
	}
	public void setXlRgsSgnGrpCyc(String xlRgsSgnGrpCyc) {
		this.xlRgsSgnGrpCyc = xlRgsSgnGrpCyc;
	}
	public String getXlNbrSlotFormats() {
		return xlNbrSlotFormats;
	}
	public void setXlNbrSlotFormats(String xlNbrSlotFormats) {
		this.xlNbrSlotFormats = xlNbrSlotFormats;
	}
	public String getXlNbrFreqRcBlocks() {
		return xlNbrFreqRcBlocks;
	}
	public void setXlNbrFreqRcBlocks(String xlNbrFreqRcBlocks) {
		this.xlNbrFreqRcBlocks = xlNbrFreqRcBlocks;
	}
	public String getXlNbrAuxCaWaves() {
		return xlNbrAuxCaWaves;
	}
	public void setXlNbrAuxCaWaves(String xlNbrAuxCaWaves) {
		this.xlNbrAuxCaWaves = xlNbrAuxCaWaves;
	}
	public String getXlNmbUpwGrdSym() {
		return xlNmbUpwGrdSym;
	}
	public void setXlNmbUpwGrdSym(String xlNmbUpwGrdSym) {
		this.xlNmbUpwGrdSym = xlNmbUpwGrdSym;
	}
	public String getXlSglSlotSymCnt() {
		return xlSglSlotSymCnt;
	}
	public void setXlSglSlotSymCnt(String xlSglSlotSymCnt) {
		this.xlSglSlotSymCnt = xlSglSlotSymCnt;
	}
	public String getXlSlotFmtInfo() {
		return xlSlotFmtInfo;
	}
	public void setXlSlotFmtInfo(String xlSlotFmtInfo) {
		this.xlSlotFmtInfo = xlSlotFmtInfo;
	}
	public String getXlCalcSBoundary() {
		return xlCalcSBoundary;
	}
	public void setXlCalcSBoundary(String xlCalcSBoundary) {
		this.xlCalcSBoundary = xlCalcSBoundary;
	}
	public String getXlDstWrlessSta() {
		return xlDstWrlessSta;
	}
	public void setXlDstWrlessSta(String xlDstWrlessSta) {
		this.xlDstWrlessSta = xlDstWrlessSta;
	}
	public String getXlMsrnPnt() {
		return xlMsrnPnt;
	}
	public void setXlMsrnPnt(String xlMsrnPnt) {
		this.xlMsrnPnt = xlMsrnPnt;
	}
	public String getXlNotes() {
		return xlNotes;
	}
	public void setXlNotes(String xlNotes) {
		this.xlNotes = xlNotes;
	}
	public String getXlMsrmDate() {
		return xlMsrmDate;
	}
	public void setXlMsrmDate(String xlMsrmDate) {
		this.xlMsrmDate = xlMsrmDate;
	}
	public String getXlMsrmFromTime() {
		return xlMsrmFromTime;
	}
	public void setXlMsrmFromTime(String xlMsrmFromTime) {
		this.xlMsrmFromTime = xlMsrmFromTime;
	}
	public String getXlMsrmToTime() {
		return xlMsrmToTime;
	}
	public void setXlMsrmToTime(String xlMsrmToTime) {
		this.xlMsrmToTime = xlMsrmToTime;
	}
	public String getXlTemperature() {
		return xlTemperature;
	}
	public void setXlTemperature(String xlTemperature) {
		this.xlTemperature = xlTemperature;
	}
	public String getXlHumidity() {
		return xlHumidity;
	}
	public void setXlHumidity(String xlHumidity) {
		this.xlHumidity = xlHumidity;
	}
	public String getXlWeather() {
		return xlWeather;
	}
	public void setXlWeather(String xlWeather) {
		this.xlWeather = xlWeather;
	}
	public String getXlProvModelName() {
		return xlProvModelName;
	}
	public void setXlProvModelName(String xlProvModelName) {
		this.xlProvModelName = xlProvModelName;
	}
	public String getXlProvSrlNmbr() {
		return xlProvSrlNmbr;
	}
	public void setXlProvSrlNmbr(String xlProvSrlNmbr) {
		this.xlProvSrlNmbr = xlProvSrlNmbr;
	}
	public String getXlProvMnfct() {
		return xlProvMnfct;
	}
	public void setXlProvMnfct(String xlProvMnfct) {
		this.xlProvMnfct = xlProvMnfct;
	}
	public String getXlProvFromFrqncBand() {
		return xlProvFromFrqncBand;
	}
	public void setXlProvFromFrqncBand(String xlProvFromFrqncBand) {
		this.xlProvFromFrqncBand = xlProvFromFrqncBand;
	}
	public String getXlProvToFrqncBand() {
		return xlProvToFrqncBand;
	}
	public void setXlProvToFrqncBand(String xlProvToFrqncBand) {
		this.xlProvToFrqncBand = xlProvToFrqncBand;
	}
	public String getXlProvClbrtDate() {
		return xlProvClbrtDate;
	}
	public void setXlProvClbrtDate(String xlProvClbrtDate) {
		this.xlProvClbrtDate = xlProvClbrtDate;
	}
	public String getXlRcvrModelName() {
		return xlRcvrModelName;
	}
	public void setXlRcvrModelName(String xlRcvrModelName) {
		this.xlRcvrModelName = xlRcvrModelName;
	}
	public String getXlRcvrSrlNmbr() {
		return xlRcvrSrlNmbr;
	}
	public void setXlRcvrSrlNmbr(String xlRcvrSrlNmbr) {
		this.xlRcvrSrlNmbr = xlRcvrSrlNmbr;
	}
	public String getXlRcvrMnfct() {
		return xlRcvrMnfct;
	}
	public void setXlRcvrMnfct(String xlRcvrMnfct) {
		this.xlRcvrMnfct = xlRcvrMnfct;
	}
	public String getXlRcvrFromFrqncBand() {
		return xlRcvrFromFrqncBand;
	}
	public void setXlRcvrFromFrqncBand(String xlRcvrFromFrqncBand) {
		this.xlRcvrFromFrqncBand = xlRcvrFromFrqncBand;
	}
	public String getXlRcvrToFrqncBand() {
		return xlRcvrToFrqncBand;
	}
	public void setXlRcvrToFrqncBand(String xlRcvrToFrqncBand) {
		this.xlRcvrToFrqncBand = xlRcvrToFrqncBand;
	}
	public String getXlRcvrClbrtDate() {
		return xlRcvrClbrtDate;
	}
	public void setXlRcvrClbrtDate(String xlRcvrClbrtDate) {
		this.xlRcvrClbrtDate = xlRcvrClbrtDate;
	}
	public String getXlMeasureVal1() {
		return xlMeasureVal1;
	}
	public void setXlMeasureVal1(String xlMeasureVal1) {
		this.xlMeasureVal1 = xlMeasureVal1;
	}
	public String getXlMeasureVal2() {
		return xlMeasureVal2;
	}
	public void setXlMeasureVal2(String xlMeasureVal2) {
		this.xlMeasureVal2 = xlMeasureVal2;
	}
	public String getXlMeasureVal3() {
		return xlMeasureVal3;
	}
	public void setXlMeasureVal3(String xlMeasureVal3) {
		this.xlMeasureVal3 = xlMeasureVal3;
	}
	public String getXlCalcVal1() {
		return xlCalcVal1;
	}
	public void setXlCalcVal1(String xlCalcVal1) {
		this.xlCalcVal1 = xlCalcVal1;
	}
	public String getXlCalcVal2() {
		return xlCalcVal2;
	}
	public void setXlCalcVal2(String xlCalcVal2) {
		this.xlCalcVal2 = xlCalcVal2;
	}
	public String getXlCalcVal3() {
		return xlCalcVal3;
	}
	public void setXlCalcVal3(String xlCalcVal3) {
		this.xlCalcVal3 = xlCalcVal3;
	}
	public String getXlAvrgMstmMin() {
		return xlAvrgMstmMin;
	}
	public void setXlAvrgMstmMin(String xlAvrgMstmMin) {
		this.xlAvrgMstmMin = xlAvrgMstmMin;
	}
	public String getXlRwrdCfcnt() {
		return xlRwrdCfcnt;
	}
	public void setXlRwrdCfcnt(String xlRwrdCfcnt) {
		this.xlRwrdCfcnt = xlRwrdCfcnt;
	}
	public String getXlCmpCfcDueTrf() {
		return xlCmpCfcDueTrf;
	}
	public void setXlCmpCfcDueTrf(String xlCmpCfcDueTrf) {
		this.xlCmpCfcDueTrf = xlCmpCfcDueTrf;
	}
	public String getXlMeasMax() {
		return xlMeasMax;
	}
	public void setXlMeasMax(String xlMeasMax) {
		this.xlMeasMax = xlMeasMax;
	}
	public String getXlCalcMax() {
		return xlCalcMax;
	}
	public void setXlCalcMax(String xlCalcMax) {
		this.xlCalcMax = xlCalcMax;
	}
	public String getXlFromElctrInrfv() {
		return xlFromElctrInrfv;
	}
	public void setXlFromElctrInrfv(String xlFromElctrInrfv) {
		this.xlFromElctrInrfv = xlFromElctrInrfv;
	}
	public String getXlToElctrInrfv() {
		return xlToElctrInrfv;
	}
	public void setXlToElctrInrfv(String xlToElctrInrfv) {
		this.xlToElctrInrfv = xlToElctrInrfv;
	}
	public String getXlRfrncFrqnc() {
		return xlRfrncFrqnc;
	}
	public void setXlRfrncFrqnc(String xlRfrncFrqnc) {
		this.xlRfrncFrqnc = xlRfrncFrqnc;
	}
	public String getXlPwrmsCnvrs() {
		return xlPwrmsCnvrs;
	}
	public void setXlPwrmsCnvrs(String xlPwrmsCnvrs) {
		this.xlPwrmsCnvrs = xlPwrmsCnvrs;
	}
	public String getXlDatePrprt() {
		return xlDatePrprt;
	}
	public void setXlDatePrprt(String xlDatePrprt) {
		this.xlDatePrprt = xlDatePrprt;
	}
	public String getXlNmmsInstt() {
		return xlNmmsInstt;
	}
	public void setXlNmmsInstt(String xlNmmsInstt) {
		this.xlNmmsInstt = xlNmmsInstt;
	}
	public String getXlMsrnInstAdrs() {
		return xlMsrnInstAdrs;
	}
	public void setXlMsrnInstAdrs(String xlMsrnInstAdrs) {
		this.xlMsrnInstAdrs = xlMsrnInstAdrs;
	}
	public String getXlMeasurersHumanName() {
		return xlMeasurersHumanName;
	}
	public void setXlMeasurersHumanName(String xlMeasurersHumanName) {
		this.xlMeasurersHumanName = xlMeasurersHumanName;
	}
	public String getXlWriter() {
		return xlWriter;
	}
	public void setXlWriter(String xlWriter) {
		this.xlWriter = xlWriter;
	}
	public String getXlSystemLoss() {
		return xlSystemLoss;
	}
	public void setXlSystemLoss(String xlSystemLoss) {
		this.xlSystemLoss = xlSystemLoss;
	}
	public String getXlMsrngIntrv() {
		return xlMsrngIntrv;
	}
	public void setXlMsrngIntrv(String xlMsrngIntrv) {
		this.xlMsrngIntrv = xlMsrngIntrv;
	}
	public String getXlNbrMeasPts() {
		return xlNbrMeasPts;
	}
	public void setXlNbrMeasPts(String xlNbrMeasPts) {
		this.xlNbrMeasPts = xlNbrMeasPts;
	}
	public String getXlNmbrCps() {
		return xlNmbrCps;
	}
	public void setXlNmbrCps(String xlNmbrCps) {
		this.xlNmbrCps = xlNmbrCps;
	}
	public String getXlMltplRdexn() {
		return xlMltplRdexn;
	}
	public void setXlMltplRdexn(String xlMltplRdexn) {
		this.xlMltplRdexn = xlMltplRdexn;
	}
	public String getXlMobileCrrrArea() {
		return xlMobileCrrrArea;
	}
	public void setXlMobileCrrrArea(String xlMobileCrrrArea) {
		this.xlMobileCrrrArea = xlMobileCrrrArea;
	}
	
	public String getXlAtchFileId() {
		return xlAtchFileId;
	}
	public void setXlAtchFileId(String xlAtchFileId) {
		this.xlAtchFileId = xlAtchFileId;
	}
	public String getXlCnt() {
		return xlCnt;
	}
	public void setXlCnt(String xlCnt) {
		this.xlCnt = xlCnt;
	}
	
  
	
	
}