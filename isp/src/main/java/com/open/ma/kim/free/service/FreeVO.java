package com.open.ma.kim.free.service;

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
@Alias("freeVO")
public class FreeVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String frSeq;
	private String frRgstDt;
	private String frRgstId;
	private String frRvseDt;
	private String frRvseId;
	private String frAtchFileId;
	private String frTitle;
	private String frCont;
	private String frId;
	private String frDt;
	private String frCnt;
	
	
	
	
	public String getFrSeq() {
		return frSeq;
	}
	public void setFrSeq(String frSeq) {
		this.frSeq = frSeq;
	}
	public String getFrRgstDt() {
		return frRgstDt;
	}
	public void setFrRgstDt(String frRgstDt) {
		this.frRgstDt = frRgstDt;
	}
	public String getFrRgstId() {
		return frRgstId;
	}
	public void setFrRgstId(String frRgstId) {
		this.frRgstId = frRgstId;
	}
	public String getFrRvseDt() {
		return frRvseDt;
	}
	public void setFrRvseDt(String frRvseDt) {
		this.frRvseDt = frRvseDt;
	}
	public String getFrRvseId() {
		return frRvseId;
	}
	public void setFrRvseId(String frRvseId) {
		this.frRvseId = frRvseId;
	}
	public String getFrAtchFileId() {
		return frAtchFileId;
	}
	public void setFrAtchFileId(String frAtchFileId) {
		this.frAtchFileId = frAtchFileId;
	}
	public String getFrTitle() {
		return frTitle;
	}
	public void setFrTitle(String frTitle) {
		this.frTitle = frTitle;
	}
	public String getFrCont() {
		return frCont;
	}
	public void setFrCont(String frCont) {
		this.frCont = frCont;
	}
	public String getFrId() {
		return frId;
	}
	public void setFrId(String frId) {
		this.frId = frId;
	}
	public String getFrDt() {
		return frDt;
	}
	public void setFrDt(String frDt) {
		this.frDt = frDt;
	}
	public String getFrCnt() {
		return frCnt;
	}
	public void setFrCnt(String frCnt) {
		this.frCnt = frCnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
}