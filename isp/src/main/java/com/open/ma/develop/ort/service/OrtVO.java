package com.open.ma.develop.ort.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;




@Alias("ortVO")
public class OrtVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String orSeq;
	private String orAtchFileId;
	private String orPjName;
	private String orPjCont;
	private String orId;
	private String orDt;
	private String orPw;
	private String orCategory;
	private String orStaDate;
	private String orEndDate;
	private String orName;
	private String orBsNum;
	private String orHp;
	private String orAddress;
	private String orMail;
	private String orMbti;
	private String orBlood;
	
	public String getOrSeq() {
		return orSeq;
	}
	public void setOrSeq(String orSeq) {
		this.orSeq = orSeq;
	}
	public String getOrAtchFileId() {
		return orAtchFileId;
	}
	public void setOrAtchFileId(String orAtchFileId) {
		this.orAtchFileId = orAtchFileId;
	}
	public String getOrPjName() {
		return orPjName;
	}
	public void setOrPjName(String orPjName) {
		this.orPjName = orPjName;
	}
	public String getOrPjCont() {
		return orPjCont;
	}
	public void setOrPjCont(String orPjCont) {
		this.orPjCont = orPjCont;
	}
	public String getOrId() {
		return orId;
	}
	public void setOrId(String orId) {
		this.orId = orId;
	}
	public String getOrDt() {
		return orDt;
	}
	public void setOrDt(String orDt) {
		this.orDt = orDt;
	}
	public String getOrPw() {
		return orPw;
	}
	public void setOrPw(String orPw) {
		this.orPw = orPw;
	}
	public String getOrCategory() {
		return orCategory;
	}
	public void setOrCategory(String orCategory) {
		this.orCategory = orCategory;
	}
	public String getOrStaDate() {
		return orStaDate;
	}
	public void setOrStaDate(String orStaDate) {
		this.orStaDate = orStaDate;
	}
	public String getOrEndDate() {
		return orEndDate;
	}
	public void setOrEndDate(String orEndDate) {
		this.orEndDate = orEndDate;
	}
	public String getOrName() {
		return orName;
	}
	public void setOrName(String orName) {
		this.orName = orName;
	}
	public String getOrBsNum() {
		return orBsNum;
	}
	public void setOrBsNum(String orBsNum) {
		this.orBsNum = orBsNum;
	}
	public String getOrHp() {
		return orHp;
	}
	public void setOrHp(String orHp) {
		this.orHp = orHp;
	}
	public String getOrAddress() {
		return orAddress;
	}
	public void setOrAddress(String orAddress) {
		this.orAddress = orAddress;
	}
	public String getOrMail() {
		return orMail;
	}
	public void setOrMail(String orMail) {
		this.orMail = orMail;
	}
	public String getOrMbti() {
		return orMbti;
	}
	public void setOrMbti(String orMbti) {
		this.orMbti = orMbti;
	}
	public String getOrBlood() {
		return orBlood;
	}
	public void setOrBlood(String orBlood) {
		this.orBlood = orBlood;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
}