package com.open.ma.develop.columns90.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

 
@Alias("columns90VO")
public class Columns90VO extends CmmnDefaultVO implements Serializable {
	
	private String rcpNum 			   ;
	private String seq                 ;
	private String lcnsNum             ;
	private String watSum              ;
	private String fromMhz             ;
	private String toMhz               ;
	private String addrsNum            ;
	private String addrs1              ;
	private String addrs2              ;
	private String addrsGooboon        ;
	private String measMeth            ;
	private String msrUnt              ;
	private String emIntStd            ;
	private String msrVl               ;
	private String expIdx              ;
	private String radioStnm           ;
	private String callName            ;
	private String latAng              ;
	private String latMin              ;
	private String latSec              ;
	private String lngtdAng            ;
	private String lngtdMin            ;
	private String lngtdSec            ;
	private String antTyp              ;
	private String antTypName          ;
	private String antnDeuk            ;
	private String antnHght            ;
	private String grndClrnc           ;
	private String antBeamCnt          ;
	private String antBeamFrm          ;
	private String eqvlnIsrdp          ;
	private String ctrFreq             ;
	private String bandwidth           ;
	private String refSigMeasFreq      ;
	private String antTildedAng        ;
	private String maxVrtBeamAng       ;
	private String mxmHrzBmAng         ;
	private String rgsSgnGrpCyc        ;
	private String nbrSlotFormats      ;
	private String nbrFreqRcBlocks     ;
	private String nbrAuxCaWaves       ;
	private String nmbUpwGrdSym        ;
	private String sglSlotSymCnt       ;
	private String slotFmtInfo         ;
	private String calcSBoundary       ;
	private String dstWrlessSta        ;
	private String msrnPnt             ;
	private String notes               ;
	private String msrmDate            ;
	private String msrmFromTime        ;
	private String msrmToTime          ;
	private String temperature         ;
	private String humidity            ;
	private String weather             ;
	private String provModelName       ;
	private String provSrlNmbr         ;
	private String provMnfct           ;
	private String provFromFrqncBand   ; 
	private String provToFrqncBand     ;
	private String provClbrtDate       ;
	private String rcvrModelName       ;
	private String rcvrSrlNmbr         ;
	private String rcvrMnfct           ;
	private String rcvrFromFrqncBand   ; 
	private String rcvrToFrqncBand     ;
	private String rcvrClbrtDate       ;
	private String measureVal1         ;
	private String measureVal2         ;
	private String measureVal3         ;
	private String calcVal1            ;
	private String calcVal2            ;
	private String calcVal3            ;
	private String avrgMstmMin         ;
	private String rwrdCfcnt           ;
	private String cmpCfcDueTrf        ;
	private String measMax             ;
	private String calcMax             ;
	private String fromElctrInrfv      ;
	private String toElctrInrfv        ;
	private String rfrncFrqnc          ;
	private String pwrmsCnvrs          ;
	private String datePrprt           ;
	private String nmmsInstt           ;
	private String msrnInstAdrs        ;
	private String measurersHumanName  ;   
	private String writer              ;
	private String systemLoss          ;
	private String msrngIntrv          ;
	private String nbrMeasPts          ;
	private String nmbrCps             ;
	private String mltplRdexn          ;
	private String mobileCrrrArea      ;
	private String cnt    			   ;
	
	public String getRcpNum() {
		return rcpNum;
	}
	public void setRcpNum(String rcpNum) {
		this.rcpNum = rcpNum;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getLcnsNum() {
		return lcnsNum;
	}
	public void setLcnsNum(String lcnsNum) {
		this.lcnsNum = lcnsNum;
	}
	public String getWatSum() {
		return watSum;
	}
	public void setWatSum(String watSum) {
		this.watSum = watSum;
	}
	public String getFromMhz() {
		return fromMhz;
	}
	public void setFromMhz(String fromMhz) {
		this.fromMhz = fromMhz;
	}
	public String getToMhz() {
		return toMhz;
	}
	public void setToMhz(String toMhz) {
		this.toMhz = toMhz;
	}
	public String getAddrsNum() {
		return addrsNum;
	}
	public void setAddrsNum(String addrsNum) {
		this.addrsNum = addrsNum;
	}
	public String getAddrs1() {
		return addrs1;
	}
	public void setAddrs1(String addrs1) {
		this.addrs1 = addrs1;
	}
	public String getAddrs2() {
		return addrs2;
	}
	public void setAddrs2(String addrs2) {
		this.addrs2 = addrs2;
	}
	public String getAddrsGooboon() {
		return addrsGooboon;
	}
	public void setAddrsGooboon(String addrsGooboon) {
		this.addrsGooboon = addrsGooboon;
	}
	public String getMeasMeth() {
		return measMeth;
	}
	public void setMeasMeth(String measMeth) {
		this.measMeth = measMeth;
	}
	public String getMsrUnt() {
		return msrUnt;
	}
	public void setMsrUnt(String msrUnt) {
		this.msrUnt = msrUnt;
	}
	public String getEmIntStd() {
		return emIntStd;
	}
	public void setEmIntStd(String emIntStd) {
		this.emIntStd = emIntStd;
	}
	public String getMsrVl() {
		return msrVl;
	}
	public void setMsrVl(String msrVl) {
		this.msrVl = msrVl;
	}
	public String getExpIdx() {
		return expIdx;
	}
	public void setExpIdx(String expIdx) {
		this.expIdx = expIdx;
	}
	public String getRadioStnm() {
		return radioStnm;
	}
	public void setRadioStnm(String radioStnm) {
		this.radioStnm = radioStnm;
	}
	public String getCallName() {
		return callName;
	}
	public void setCallName(String callName) {
		this.callName = callName;
	}
	public String getLatAng() {
		return latAng;
	}
	public void setLatAng(String latAng) {
		this.latAng = latAng;
	}
	public String getLatMin() {
		return latMin;
	}
	public void setLatMin(String latMin) {
		this.latMin = latMin;
	}
	public String getLatSec() {
		return latSec;
	}
	public void setLatSec(String latSec) {
		this.latSec = latSec;
	}
	public String getLngtdAng() {
		return lngtdAng;
	}
	public void setLngtdAng(String lngtdAng) {
		this.lngtdAng = lngtdAng;
	}
	public String getLngtdMin() {
		return lngtdMin;
	}
	public void setLngtdMin(String lngtdMin) {
		this.lngtdMin = lngtdMin;
	}
	public String getLngtdSec() {
		return lngtdSec;
	}
	public void setLngtdSec(String lngtdSec) {
		this.lngtdSec = lngtdSec;
	}
	public String getAntTyp() {
		return antTyp;
	}
	public void setAntTyp(String antTyp) {
		this.antTyp = antTyp;
	}
	public String getAntTypName() {
		return antTypName;
	}
	public void setAntTypName(String antTypName) {
		this.antTypName = antTypName;
	}
	public String getAntnDeuk() {
		return antnDeuk;
	}
	public void setAntnDeuk(String antnDeuk) {
		this.antnDeuk = antnDeuk;
	}
	public String getAntnHght() {
		return antnHght;
	}
	public void setAntnHght(String antnHght) {
		this.antnHght = antnHght;
	}
	public String getGrndClrnc() {
		return grndClrnc;
	}
	public void setGrndClrnc(String grndClrnc) {
		this.grndClrnc = grndClrnc;
	}
	public String getAntBeamCnt() {
		return antBeamCnt;
	}
	public void setAntBeamCnt(String antBeamCnt) {
		this.antBeamCnt = antBeamCnt;
	}
	public String getAntBeamFrm() {
		return antBeamFrm;
	}
	public void setAntBeamFrm(String antBeamFrm) {
		this.antBeamFrm = antBeamFrm;
	}
	public String getEqvlnIsrdp() {
		return eqvlnIsrdp;
	}
	public void setEqvlnIsrdp(String eqvlnIsrdp) {
		this.eqvlnIsrdp = eqvlnIsrdp;
	}
	public String getCtrFreq() {
		return ctrFreq;
	}
	public void setCtrFreq(String ctrFreq) {
		this.ctrFreq = ctrFreq;
	}
	public String getBandwidth() {
		return bandwidth;
	}
	public void setBandwidth(String bandwidth) {
		this.bandwidth = bandwidth;
	}
	public String getRefSigMeasFreq() {
		return refSigMeasFreq;
	}
	public void setRefSigMeasFreq(String refSigMeasFreq) {
		this.refSigMeasFreq = refSigMeasFreq;
	}
	public String getAntTildedAng() {
		return antTildedAng;
	}
	public void setAntTildedAng(String antTildedAng) {
		this.antTildedAng = antTildedAng;
	}
	public String getMaxVrtBeamAng() {
		return maxVrtBeamAng;
	}
	public void setMaxVrtBeamAng(String maxVrtBeamAng) {
		this.maxVrtBeamAng = maxVrtBeamAng;
	}
	public String getMxmHrzBmAng() {
		return mxmHrzBmAng;
	}
	public void setMxmHrzBmAng(String mxmHrzBmAng) {
		this.mxmHrzBmAng = mxmHrzBmAng;
	}
	public String getRgsSgnGrpCyc() {
		return rgsSgnGrpCyc;
	}
	public void setRgsSgnGrpCyc(String rgsSgnGrpCyc) {
		this.rgsSgnGrpCyc = rgsSgnGrpCyc;
	}
	public String getNbrSlotFormats() {
		return nbrSlotFormats;
	}
	public void setNbrSlotFormats(String nbrSlotFormats) {
		this.nbrSlotFormats = nbrSlotFormats;
	}
	public String getNbrFreqRcBlocks() {
		return nbrFreqRcBlocks;
	}
	public void setNbrFreqRcBlocks(String nbrFreqRcBlocks) {
		this.nbrFreqRcBlocks = nbrFreqRcBlocks;
	}
	public String getNbrAuxCaWaves() {
		return nbrAuxCaWaves;
	}
	public void setNbrAuxCaWaves(String nbrAuxCaWaves) {
		this.nbrAuxCaWaves = nbrAuxCaWaves;
	}
	public String getNmbUpwGrdSym() {
		return nmbUpwGrdSym;
	}
	public void setNmbUpwGrdSym(String nmbUpwGrdSym) {
		this.nmbUpwGrdSym = nmbUpwGrdSym;
	}
	public String getSglSlotSymCnt() {
		return sglSlotSymCnt;
	}
	public void setSglSlotSymCnt(String sglSlotSymCnt) {
		this.sglSlotSymCnt = sglSlotSymCnt;
	}
	public String getSlotFmtInfo() {
		return slotFmtInfo;
	}
	public void setSlotFmtInfo(String slotFmtInfo) {
		this.slotFmtInfo = slotFmtInfo;
	}
	public String getCalcSBoundary() {
		return calcSBoundary;
	}
	public void setCalcSBoundary(String calcSBoundary) {
		this.calcSBoundary = calcSBoundary;
	}
	public String getDstWrlessSta() {
		return dstWrlessSta;
	}
	public void setDstWrlessSta(String dstWrlessSta) {
		this.dstWrlessSta = dstWrlessSta;
	}
	public String getMsrnPnt() {
		return msrnPnt;
	}
	public void setMsrnPnt(String msrnPnt) {
		this.msrnPnt = msrnPnt;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getMsrmDate() {
		return msrmDate;
	}
	public void setMsrmDate(String msrmDate) {
		this.msrmDate = msrmDate;
	}
	public String getMsrmFromTime() {
		return msrmFromTime;
	}
	public void setMsrmFromTime(String msrmFromTime) {
		this.msrmFromTime = msrmFromTime;
	}
	public String getMsrmToTime() {
		return msrmToTime;
	}
	public void setMsrmToTime(String msrmToTime) {
		this.msrmToTime = msrmToTime;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getProvModelName() {
		return provModelName;
	}
	public void setProvModelName(String provModelName) {
		this.provModelName = provModelName;
	}
	public String getProvSrlNmbr() {
		return provSrlNmbr;
	}
	public void setProvSrlNmbr(String provSrlNmbr) {
		this.provSrlNmbr = provSrlNmbr;
	}
	public String getProvMnfct() {
		return provMnfct;
	}
	public void setProvMnfct(String provMnfct) {
		this.provMnfct = provMnfct;
	}
	public String getProvFromFrqncBand() {
		return provFromFrqncBand;
	}
	public void setProvFromFrqncBand(String provFromFrqncBand) {
		this.provFromFrqncBand = provFromFrqncBand;
	}
	public String getProvToFrqncBand() {
		return provToFrqncBand;
	}
	public void setProvToFrqncBand(String provToFrqncBand) {
		this.provToFrqncBand = provToFrqncBand;
	}
	public String getProvClbrtDate() {
		return provClbrtDate;
	}
	public void setProvClbrtDate(String provClbrtDate) {
		this.provClbrtDate = provClbrtDate;
	}
	public String getRcvrModelName() {
		return rcvrModelName;
	}
	public void setRcvrModelName(String rcvrModelName) {
		this.rcvrModelName = rcvrModelName;
	}
	public String getRcvrSrlNmbr() {
		return rcvrSrlNmbr;
	}
	public void setRcvrSrlNmbr(String rcvrSrlNmbr) {
		this.rcvrSrlNmbr = rcvrSrlNmbr;
	}
	public String getRcvrMnfct() {
		return rcvrMnfct;
	}
	public void setRcvrMnfct(String rcvrMnfct) {
		this.rcvrMnfct = rcvrMnfct;
	}
	public String getRcvrFromFrqncBand() {
		return rcvrFromFrqncBand;
	}
	public void setRcvrFromFrqncBand(String rcvrFromFrqncBand) {
		this.rcvrFromFrqncBand = rcvrFromFrqncBand;
	}
	public String getRcvrToFrqncBand() {
		return rcvrToFrqncBand;
	}
	public void setRcvrToFrqncBand(String rcvrToFrqncBand) {
		this.rcvrToFrqncBand = rcvrToFrqncBand;
	}
	public String getRcvrClbrtDate() {
		return rcvrClbrtDate;
	}
	public void setRcvrClbrtDate(String rcvrClbrtDate) {
		this.rcvrClbrtDate = rcvrClbrtDate;
	}
	public String getMeasureVal1() {
		return measureVal1;
	}
	public void setMeasureVal1(String measureVal1) {
		this.measureVal1 = measureVal1;
	}
	public String getMeasureVal2() {
		return measureVal2;
	}
	public void setMeasureVal2(String measureVal2) {
		this.measureVal2 = measureVal2;
	}
	public String getMeasureVal3() {
		return measureVal3;
	}
	public void setMeasureVal3(String measureVal3) {
		this.measureVal3 = measureVal3;
	}
	public String getCalcVal1() {
		return calcVal1;
	}
	public void setCalcVal1(String calcVal1) {
		this.calcVal1 = calcVal1;
	}
	public String getCalcVal2() {
		return calcVal2;
	}
	public void setCalcVal2(String calcVal2) {
		this.calcVal2 = calcVal2;
	}
	public String getCalcVal3() {
		return calcVal3;
	}
	public void setCalcVal3(String calcVal3) {
		this.calcVal3 = calcVal3;
	}
	public String getAvrgMstmMin() {
		return avrgMstmMin;
	}
	public void setAvrgMstmMin(String avrgMstmMin) {
		this.avrgMstmMin = avrgMstmMin;
	}
	public String getRwrdCfcnt() {
		return rwrdCfcnt;
	}
	public void setRwrdCfcnt(String rwrdCfcnt) {
		this.rwrdCfcnt = rwrdCfcnt;
	}
	public String getCmpCfcDueTrf() {
		return cmpCfcDueTrf;
	}
	public void setCmpCfcDueTrf(String cmpCfcDueTrf) {
		this.cmpCfcDueTrf = cmpCfcDueTrf;
	}
	public String getMeasMax() {
		return measMax;
	}
	public void setMeasMax(String measMax) {
		this.measMax = measMax;
	}
	public String getCalcMax() {
		return calcMax;
	}
	public void setCalcMax(String calcMax) {
		this.calcMax = calcMax;
	}
	public String getFromElctrInrfv() {
		return fromElctrInrfv;
	}
	public void setFromElctrInrfv(String fromElctrInrfv) {
		this.fromElctrInrfv = fromElctrInrfv;
	}
	public String getToElctrInrfv() {
		return toElctrInrfv;
	}
	public void setToElctrInrfv(String toElctrInrfv) {
		this.toElctrInrfv = toElctrInrfv;
	}
	public String getRfrncFrqnc() {
		return rfrncFrqnc;
	}
	public void setRfrncFrqnc(String rfrncFrqnc) {
		this.rfrncFrqnc = rfrncFrqnc;
	}
	public String getPwrmsCnvrs() {
		return pwrmsCnvrs;
	}
	public void setPwrmsCnvrs(String pwrmsCnvrs) {
		this.pwrmsCnvrs = pwrmsCnvrs;
	}
	public String getDatePrprt() {
		return datePrprt;
	}
	public void setDatePrprt(String datePrprt) {
		this.datePrprt = datePrprt;
	}
	public String getNmmsInstt() {
		return nmmsInstt;
	}
	public void setNmmsInstt(String nmmsInstt) {
		this.nmmsInstt = nmmsInstt;
	}
	public String getMsrnInstAdrs() {
		return msrnInstAdrs;
	}
	public void setMsrnInstAdrs(String msrnInstAdrs) {
		this.msrnInstAdrs = msrnInstAdrs;
	}
	public String getMeasurersHumanName() {
		return measurersHumanName;
	}
	public void setMeasurersHumanName(String measurersHumanName) {
		this.measurersHumanName = measurersHumanName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSystemLoss() {
		return systemLoss;
	}
	public void setSystemLoss(String systemLoss) {
		this.systemLoss = systemLoss;
	}
	public String getMsrngIntrv() {
		return msrngIntrv;
	}
	public void setMsrngIntrv(String msrngIntrv) {
		this.msrngIntrv = msrngIntrv;
	}
	public String getNbrMeasPts() {
		return nbrMeasPts;
	}
	public void setNbrMeasPts(String nbrMeasPts) {
		this.nbrMeasPts = nbrMeasPts;
	}
	public String getNmbrCps() {
		return nmbrCps;
	}
	public void setNmbrCps(String nmbrCps) {
		this.nmbrCps = nmbrCps;
	}
	public String getMltplRdexn() {
		return mltplRdexn;
	}
	public void setMltplRdexn(String mltplRdexn) {
		this.mltplRdexn = mltplRdexn;
	}
	public String getMobileCrrrArea() {
		return mobileCrrrArea;
	}
	public void setMobileCrrrArea(String mobileCrrrArea) {
		this.mobileCrrrArea = mobileCrrrArea;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
	
	
  
	
	
}