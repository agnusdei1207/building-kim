package com.open.ma.kim.estQst.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("estQstVO")
public class EstQstVO extends CmmnDefaultVO implements Serializable {
	/**
	 *  
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String eqSeq;
	private String eqRgstDt;
	private String eqRgstId;
	private String eqRvseDt;
	private String eqRvseId;
	private String eqAtchFileId; 
	private String eqTitle;
	private String eqCont;
	private String eqId;
	private String eqPw;
	private String eqDt;
	private String eqState;
	private String eqCmt;
	private String eqCnt;
	
	   
	
	
	public String getEqSeq() {
		return eqSeq;
	}
	public void setEqSeq(String eqSeq) {
		this.eqSeq = eqSeq;
	}
	public String getEqRgstDt() {
		return eqRgstDt;
	}
	public void setEqRgstDt(String eqRgstDt) {
		this.eqRgstDt = eqRgstDt;
	}
	public String getEqRgstId() {
		return eqRgstId;
	}
	public void setEqRgstId(String eqRgstId) {
		this.eqRgstId = eqRgstId;
	}
	public String getEqRvseDt() {
		return eqRvseDt;
	}
	public void setEqRvseDt(String eqRvseDt) {
		this.eqRvseDt = eqRvseDt;
	}
	public String getEqRvseId() {
		return eqRvseId;
	}
	public void setEqRvseId(String eqRvseId) {
		this.eqRvseId = eqRvseId;
	}
	public String getEqAtchFileId() {
		return eqAtchFileId;
	}
	public void setEqAtchFileId(String eqAtchFileId) {
		this.eqAtchFileId = eqAtchFileId;
	}
	public String getEqTitle() {
		return eqTitle;
	}
	public void setEqTitle(String eqTitle) {
		this.eqTitle = eqTitle;
	}
	public String getEqCont() {
		return eqCont;
	}
	public void setEqCont(String eqCont) {
		this.eqCont = eqCont;
	}
	public String getEqId() {
		return eqId;
	}
	public void setEqId(String eqId) {
		this.eqId = eqId;
	}
	public String getEqPw() {
		return eqPw;
	}
	public void setEqPw(String eqPw) {
		this.eqPw = eqPw;
	}
	public String getEqDt() {
		return eqDt;
	}
	public void setEqDt(String eqDt) {
		this.eqDt = eqDt;
	}
	public String getEqState() {
		return eqState;
	}
	public void setEqState(String eqState) {
		this.eqState = eqState;
	}
	public String getEqCmt() {
		return eqCmt;
	}
	public void setEqCmt(String eqCmt) {
		this.eqCmt = eqCmt;
	}
	public String getEqCnt() {
		return eqCnt;
	}
	public void setEqCnt(String eqCnt) {
		this.eqCnt = eqCnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
	
	
	
}