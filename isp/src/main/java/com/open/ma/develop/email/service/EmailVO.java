package com.open.ma.develop.email.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

@Alias("emailVO") 
@SuppressWarnings("serial")
public class EmailVO extends CmmnDefaultVO implements Serializable {
	
	private String emSeq;
	private String emRgstDt;
	private String emRgstId;
	private String emRvseDt;
	private String emRvseId;
	private String emTitle;
	private String emCont;
	private String emViewCnt;
	private String emDsgn;
	private String emNewYn;
	
	private String emUserSeq;
	private String emId;
	private String emName;
	private String emMail;
	private String userDivn;
	private String checkedArray;
	private String[] arrUserSeq;
	private String[] arrUserDivn;
	
	
	
	
	public String getCheckedArray() {
		return checkedArray;
	}

	public void setCheckedArray(String checkedArray) {
		this.checkedArray = checkedArray;
	}

	public String getEmUserSeq() {
		return emUserSeq;
	}

	public void setEmUserSeq(String emUserSeq) {
		this.emUserSeq = emUserSeq;
	}

	public String getEmSeq() {
		return emSeq;
	}

	public void setEmSeq(String emSeq) {
		this.emSeq = emSeq;
	}

	public String getEmRgstDt() {
		return emRgstDt;
	}

	public void setEmRgstDt(String emRgstDt) {
		this.emRgstDt = emRgstDt;
	}

	public String getEmRgstId() {
		return emRgstId;
	}

	public void setEmRgstId(String emRgstId) {
		this.emRgstId = emRgstId;
	}

	public String getEmRvseDt() {
		return emRvseDt;
	}

	public void setEmRvseDt(String emRvseDt) {
		this.emRvseDt = emRvseDt;
	}

	public String getEmRvseId() {
		return emRvseId;
	}

	public void setEmRvseId(String emRvseId) {
		this.emRvseId = emRvseId;
	}

	public String getEmTitle() {
		return emTitle;
	}

	public void setEmTitle(String emTitle) {
		this.emTitle = emTitle;
	}

	public String getEmCont() {
		return emCont;
	}

	public void setEmCont(String emCont) {
		this.emCont = emCont;
	}

	public String getEmViewCnt() {
		return emViewCnt;
	}

	public void setEmViewCnt(String emViewCnt) {
		this.emViewCnt = emViewCnt;
	}

	public String getEmDsgn() {
		return emDsgn;
	}

	public void setEmDsgn(String emDsgn) {
		this.emDsgn = emDsgn;
	}

	public String getEmNewYn() {
		return emNewYn;
	}

	public void setEmNewYn(String emNewYn) {
		this.emNewYn = emNewYn;
	}
	
	public String getEmId() {   
		return emId;
	}

	public void setEmId(String emId) {
		this.emId = emId;
	}

	public String getEmName() {
		return emName;
	}

	public void setEmName(String emName) {
		this.emName = emName;
	} 

	public String getEmMail() {
		return emMail;
	}

	public void setEmMail(String emMail) {
		this.emMail = emMail;
	}

	public String getUserDivn() {
		return userDivn;
	}

	public void setUserDivn(String userDivn) {
		this.userDivn = userDivn;
	}

	public String[] getArrUserDivn() {
		return arrUserDivn;
	}

	public void setArrUserDivn(String[] arrUserDivn) {
		this.arrUserDivn = arrUserDivn;
	}

	public String[] getArrUserSeq(){
		String[] arr = null;
		if(this.arrUserSeq != null){
			arr = new String[arrUserSeq.length];
			for(int i = 0; i < arrUserSeq.length; i++){
				arr[i] = this.arrUserSeq[i];
			}
		}
		return arr;
	}
	
	public void setArrUserSeq(String[] arrUserSeq){
		this.arrUserSeq = new String[arrUserSeq.length];
		for(int i = 0; i < arrUserSeq.length; i++){
			this.arrUserSeq[i] = arrUserSeq[i];
		}
	}
	
	
	
}