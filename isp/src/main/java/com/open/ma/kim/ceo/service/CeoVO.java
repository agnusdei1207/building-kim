package com.open.ma.kim.ceo.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.util.StringUtil;
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
	private String[] baSeq;  
	private String[] baRgstDt;
	private String[] baRgstId; 
	private String[] baRvseDt;
	private String[] baRvseId;
	private String[] baAtchFileId;
	private String[] baTitle;
	private String[] baCont;
	private String[] baUrl;  
	private String[] baWindow;
	private String[] baExposeYn;
	private String[] baOrderNum; 
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
	public String[] getBaSeq() {
		String[] newArr = null;
		if(baSeq != null){  
			newArr = new String[baSeq.length];
			for (int i = 0; i < baSeq.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baSeq[i]);
			}  
		}
		return newArr;
	}
	public void setBaSeq(String[] baSeq) {
		this.baSeq = new String[baSeq.length];
		for (int i = 0; i < baSeq.length; i++){
			this.baSeq[i] = StringUtil.nullConvert(baSeq[i]);
		}
	}
	 
	public String[] getBaRgstDt() {
		String[] newArr = null;
		if(baRgstDt != null){
			newArr = new String[baRgstDt.length];
			for (int i = 0; i < baRgstDt.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baRgstDt[i]);
			}
		}
		return newArr;
	}
	public void setBaRgstDt(String[] baRgstDt) {
		this.baRgstDt = new String[baRgstDt.length];
		for (int i = 0; i < baRgstDt.length; i++){
			this.baRgstDt[i] = StringUtil.nullConvert(baRgstDt[i]);
		}
	}

	public String[] getBaRgstId() {
		String[] newArr = null;
		if(baRgstId != null){
			newArr = new String[baRgstId.length];
			for (int i = 0; i < baRgstId.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baRgstId[i]);
			}
		}
		return newArr;
	}
	public void setBaRgstId(String[] baRgstId) {
		this.baRgstId = new String[baRgstId.length];
		for (int i = 0; i < baRgstId.length; i++){
			this.baRgstId[i] = StringUtil.nullConvert(baRgstId[i]);
		}
	}

	public String[] getBaRvseDt() {
		String[] newArr = null;
		if(baRvseDt != null){
			newArr = new String[baRvseDt.length];
			for (int i = 0; i < baRvseDt.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baRvseDt[i]);
			}
		}
		return newArr; 
	}
	public void setBaRvseDt(String[] baRvseDt) {
		this.baRvseDt = new String[baRvseDt.length];
		for (int i = 0; i < baRvseDt.length; i++){
			this.baRvseDt[i] = StringUtil.nullConvert(baRvseDt[i]);
		}
	}

	public String[] getBaRvseId() {
		String[] newArr = null;
		if(baRvseId != null){
			newArr = new String[baRvseId.length];
			for (int i = 0; i < baRvseId.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baRvseId[i]);
			}
		}
		return newArr;
	}
	public void setBaRvseId(String[] baRvseId) {
		this.baRvseId = new String[baRvseId.length];
		for (int i = 0; i < baRvseId.length; i++){
			this.baRvseId[i] = StringUtil.nullConvert(baRvseId[i]);
		}
	}
	
	public String[] getBaAtchFileId() {
		String[] newArr = null;
		if(baAtchFileId != null){
			newArr = new String[baAtchFileId.length];
			for (int i = 0; i < baAtchFileId.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baAtchFileId[i]);
			}
		}
		return newArr; 
	}
	public void setBaAtchFileId(String[] baAtchFileId) {
		this.baAtchFileId = new String[baAtchFileId.length];
		for (int i = 0; i < baAtchFileId.length; i++){
			this.baAtchFileId[i] = StringUtil.nullConvert(baAtchFileId[i]);
		}
	}
	
	public String[] getBaTitle() {
		String[] newArr = null;
		if(baTitle != null){
			newArr = new String[baTitle.length];
			for (int i = 0; i < baTitle.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baTitle[i]);
			}
		}
		return newArr; 
	}
	public void setBaTitle(String[] baTitle) {
		this.baTitle = new String[baTitle.length];
		for (int i = 0; i < baTitle.length; i++){
			this.baTitle[i] = StringUtil.nullConvert(baTitle[i]);
		}
	}
	
	public String[] getBaCont() {
		String[] newArr = null;
		if(baCont != null){
			newArr = new String[baCont.length];
			for (int i = 0; i < baCont.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baCont[i]);
			}
		}
		return newArr;
	}
	public void setBaCont(String[] baCont) {
		this.baCont = new String[baCont.length];
		for (int i = 0; i < baCont.length; i++){
			this.baCont[i] = StringUtil.nullConvert(baCont[i]);
		}
	}
	
	public String[] getBaUrl() {
		String[] newArr = null;
		if(baUrl != null){
			newArr = new String[baUrl.length];
			for (int i = 0; i < baUrl.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baUrl[i]);
			}
		}
		return newArr;
	}
	public void setBaUrl(String[] baUrl) {
		this.baUrl = new String[baUrl.length];
		for (int i = 0; i < baUrl.length; i++){
			this.baUrl[i] = StringUtil.nullConvert(baUrl[i]);
		}
	}

	public String[] getBaWindow() {
		String[] newArr = null;
		if(baWindow != null){
			newArr = new String[baWindow.length];
			for (int i = 0; i < baWindow.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baWindow[i]);
			}
		}
		return newArr;
	}
	public void setBaWindow(String[] baWindow) {
		this.baWindow = new String[baWindow.length];
		for (int i = 0; i < baWindow.length; i++){
			this.baWindow[i] = StringUtil.nullConvert(baWindow[i]);
		}
	}

	public String[] getBaExposeYn() {
		String[] newArr = null;
		if(baExposeYn != null){
			newArr = new String[baExposeYn.length];
			for (int i = 0; i < baExposeYn.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baExposeYn[i]);
			}
		}
		return newArr;
	}
	public void setBaExposeYn(String[] baExposeYn) {
		this.baExposeYn = new String[baExposeYn.length];
		for (int i = 0; i < baExposeYn.length; i++){
			this.baExposeYn[i] = StringUtil.nullConvert(baExposeYn[i]);
		}
	}
	
	public String[] getBaOrderNum() {
		String[] newArr = null;
		if(baOrderNum != null){
			newArr = new String[baOrderNum.length];
			for (int i = 0; i < baOrderNum.length; i++) {
				newArr[i] = StringUtil.nullConvert(this.baOrderNum[i]);
			}
		}
		return newArr;
	}
	public void setBaOrderNum(String[] baOrderNum) {
		this.baOrderNum = new String[baOrderNum.length];
		for (int i = 0; i < baOrderNum.length; i++){
			this.baOrderNum[i] = StringUtil.nullConvert(baOrderNum[i]);
		}
	}
	
	
	
	
	
}