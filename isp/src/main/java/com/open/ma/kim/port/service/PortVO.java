package com.open.ma.kim.port.service;

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
@Alias("portVO")
public class PortVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String poSeq;
	private String poRgstDt;
	private String poRgstId;
	private String poRvseDt;
	private String poRvseId;
	private String poAtchFileId;
	private String poTitle;
	private String poCont;
	private String poKind;
	private String poCnt;
	   
	public String getPoSeq() {
		return poSeq;
	}
	public void setPoSeq(String poSeq) {
		this.poSeq = poSeq;
	}
	public String getPoRgstDt() {
		return poRgstDt;
	}
	public void setPoRgstDt(String poRgstDt) {
		this.poRgstDt = poRgstDt;
	}
	public String getPoRgstId() {
		return poRgstId;
	}
	public void setPoRgstId(String poRgstId) {
		this.poRgstId = poRgstId;
	}
	public String getPoRvseDt() {
		return poRvseDt;
	}
	public void setPoRvseDt(String poRvseDt) {
		this.poRvseDt = poRvseDt;
	}
	public String getPoRvseId() {
		return poRvseId;
	}
	public void setPoRvseId(String poRvseId) {
		this.poRvseId = poRvseId;
	}
	public String getPoAtchFileId() {
		return poAtchFileId;
	}
	public void setPoAtchFileId(String poAtchFileId) {
		this.poAtchFileId = poAtchFileId;
	}
	public String getPoTitle() {
		return poTitle;
	}
	public void setPoTitle(String poTitle) {
		this.poTitle = poTitle;
	}
	public String getPoCont() {
		return poCont;
	}
	public void setPoCont(String poCont) {
		this.poCont = poCont;
	}
	public String getPoKind() {
		return poKind;
	}
	public void setPoKind(String poKind) {
		this.poKind = poKind;
	}
	public String getPoCnt() {
		return poCnt;
	}
	public void setPoCnt(String poCnt) {
		this.poCnt = poCnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
	
	
}