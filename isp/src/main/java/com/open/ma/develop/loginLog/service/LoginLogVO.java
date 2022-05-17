package com.open.ma.develop.loginLog.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

@Alias("loginLogVO") 
public class LoginLogVO extends CmmnDefaultVO implements Serializable {
   
	private static final long serialVersionUID = 2172623835339565860L;
	 
	private String logSeq;
	private String logClientIp;
	private String logId;
	private String logUrl;
	private String logMenuCd;
	private String logDt;
	private String logDivn;
	private String logIpErrYn; 
	private String logCnt;
	private String logLoginYn;
	private String maxLogDt;
    
	
	
	public String getLogLoginYn() {
		return logLoginYn;
	}
	public void setLogLoginYn(String logLoginYn) {
		this.logLoginYn = logLoginYn;
	}
	public String getMaxLogDt() {
		return maxLogDt;
	}
	public void setMaxLogDt(String maxLogDt) {
		this.maxLogDt = maxLogDt;
	}
	public String getLogMenuCd() {
		return logMenuCd;
	}
	public void setLogMenuCd(String logMenuCd) {
		this.logMenuCd = logMenuCd;
	}
	public String getLogSeq() {
		return logSeq;         
	}
	public void setLogSeq(String logSeq) {
		this.logSeq = logSeq;
	}
	public String getLogClientIp() {
		return logClientIp;
	}
	public void setLogClientIp(String logClientIp) {
		this.logClientIp = logClientIp;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	
	public String getLogUrl() {
		return logUrl;
	}
	public void setLogUrl(String logUrl) {
		this.logUrl = logUrl;
	}
	public String getLogDt() {
		return logDt;
	}
	public void setLogDt(String logDt) {
		this.logDt = logDt;
	}
	public String getLogDivn() {
		return logDivn;
	}
	public void setLogDivn(String logDivn) {
		this.logDivn = logDivn;
	}
	public String getLogIpErrYn() {
		return logIpErrYn;
	}
	public void setLogIpErrYn(String logIpErrYn) {
		this.logIpErrYn = logIpErrYn;
	}
	public String getLogCnt() {
		return logCnt;
	}
	public void setLogCnt(String logCnt) {
		this.logCnt = logCnt;  
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}