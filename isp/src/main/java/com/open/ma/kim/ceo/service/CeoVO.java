package com.open.ma.kim.ceo.service;

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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
	
}