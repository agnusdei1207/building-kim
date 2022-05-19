package com.open.ma.kim.banner.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

 
   
@Alias("bannerVO")
public class BannerVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String baSeq;
	private String baRgstDt;
	private String baRgstId;
	private String baRvseDt;
	private String baRvseId;
	private String baAtchFileId;
	private String baTitle;
	private String baCont;
	private String baUrl;
	private String baWindow;
	private String baExposeYn;
	private String baOrderNum; 
	private String baCnt;
	     
	public String getBaExposeYn() {
		return baExposeYn;
	}
	public void setBaExposeYn(String baExposeYn) {
		this.baExposeYn = baExposeYn;
	}
	public String getBaOrderNum() {
		return baOrderNum;
	}
	public void setBaOrderNum(String baOrderNum) {
		this.baOrderNum = baOrderNum;
	}
	public String getBaSeq() {
		return baSeq;
	}
	public void setBaSeq(String baSeq) {
		this.baSeq = baSeq;
	}
	public String getBaRgstDt() {
		return baRgstDt;
	}
	public void setBaRgstDt(String baRgstDt) {
		this.baRgstDt = baRgstDt;
	}
	public String getBaRgstId() {
		return baRgstId;
	}
	public void setBaRgstId(String baRgstId) {
		this.baRgstId = baRgstId;
	}
	public String getBaRvseDt() {
		return baRvseDt;
	}
	public void setBaRvseDt(String baRvseDt) {
		this.baRvseDt = baRvseDt;
	}
	public String getBaRvseId() {
		return baRvseId;
	}
	public void setBaRvseId(String baRvseId) {
		this.baRvseId = baRvseId;
	}
	public String getBaAtchFileId() {
		return baAtchFileId;
	}
	public void setBaAtchFileId(String baAtchFileId) {
		this.baAtchFileId = baAtchFileId;
	}
	public String getBaTitle() {
		return baTitle;
	}
	public void setBaTitle(String baTitle) {
		this.baTitle = baTitle;
	}
	public String getBaCont() {
		return baCont;
	}
	public void setBaCont(String baCont) {
		this.baCont = baCont;
	}
	public String getBaUrl() {
		return baUrl;
	}
	public void setBaUrl(String baUrl) {
		this.baUrl = baUrl;
	}
	public String getBaWindow() {
		return baWindow;
	}
	public void setBaWindow(String baWindow) {
		this.baWindow = baWindow;
	}
	public String getBaCnt() {
		return baCnt;
	}
	public void setBaCnt(String baCnt) {
		this.baCnt = baCnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	  
	
	
	
	
	
}