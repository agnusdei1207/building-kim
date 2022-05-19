package com.open.ma.kim.ceo.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.ma.kim.banner.service.BannerVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("ceoVO")
public class CeoVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String ceSeq;
	private String ceAtchFileId;
	private String ceName;
	private String ceDt;
	private String ceNum;
	private String ceHp;
	private String ceAdd;
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
	private List<BannerVO> bannerList;
	
	
	public String getCeSeq() {
		return ceSeq;
	}
	public void setCeSeq(String ceSeq) {
		this.ceSeq = ceSeq;
	}
	public String getCeAtchFileId() {
		return ceAtchFileId;
	}
	public void setCeAtchFileId(String ceAtchFileId) {
		this.ceAtchFileId = ceAtchFileId;
	}
	public String getCeName() {
		return ceName;
	}
	public void setCeName(String ceName) {
		this.ceName = ceName;
	}
	public String getCeDt() {
		return ceDt;
	}
	public void setCeDt(String ceDt) {
		this.ceDt = ceDt;
	}
	public String getCeNum() {
		return ceNum;
	}
	public void setCeNum(String ceNum) {
		this.ceNum = ceNum;
	}
	public String getCeHp() {
		return ceHp;
	}
	public void setCeHp(String ceHp) {
		this.ceHp = ceHp;
	}
	public String getCeAdd() {
		return ceAdd;
	}
	public void setCeAdd(String ceAdd) {
		this.ceAdd = ceAdd;
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
	public String getBaCnt() {
		return baCnt;
	}
	public void setBaCnt(String baCnt) {
		this.baCnt = baCnt;
	}
	public List<BannerVO> getBannerList() {
		return bannerList;
	}
	public void setBannerList(List<BannerVO> bannerList) {
		this.bannerList = bannerList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
}