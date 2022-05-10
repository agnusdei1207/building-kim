package com.open.ma.kim.ntc.service;

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
@Alias("ntcVO")
public class NtcVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String ntSeq;
	private String ntRgstDt;
	private String ntRgstId;
	private String ntRvseDt;
	private String ntRvseId;  
	private String ntAtchFileId;
	private String ntTitle;
	private String ntCont;
	private String ntState;
	private String ntStaDate;
	private String ntEndDate;
	private String noticeYn;
	   
	
	  
	
	public String getNoticeYn() {
		return noticeYn;
	}
	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}
	public String getNtSeq() {
		return ntSeq;
	}
	public void setNtSeq(String ntSeq) {
		this.ntSeq = ntSeq;
	}
	public String getNtRgstDt() {
		return ntRgstDt;
	}
	public void setNtRgstDt(String ntRgstDt) {
		this.ntRgstDt = ntRgstDt;
	}
	public String getNtRgstId() {
		return ntRgstId;
	}
	public void setNtRgstId(String ntRgstId) {
		this.ntRgstId = ntRgstId;
	}
	public String getNtRvseDt() {
		return ntRvseDt;
	}
	public void setNtRvseDt(String ntRvseDt) {
		this.ntRvseDt = ntRvseDt;
	}
	public String getNtRvseId() {
		return ntRvseId;
	}
	public void setNtRvseId(String ntRvseId) {
		this.ntRvseId = ntRvseId;
	}
	public String getNtAtchFileId() {
		return ntAtchFileId;
	}
	public void setNtAtchFileId(String ntAtchFileId) {
		this.ntAtchFileId = ntAtchFileId;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtCont() {
		return ntCont;
	}
	public void setNtCont(String ntCont) {
		this.ntCont = ntCont;
	}
	public String getNtState() {
		return ntState;
	}
	public void setNtState(String ntState) {
		this.ntState = ntState;
	}
	public String getNtStaDate() {
		return ntStaDate;
	}
	public void setNtStaDate(String ntStaDate) {
		this.ntStaDate = ntStaDate;
	}
	public String getNtEndDate() {
		return ntEndDate;
	}
	public void setNtEndDate(String ntEndDate) {
		this.ntEndDate = ntEndDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
}