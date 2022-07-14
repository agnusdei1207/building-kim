package com.open.ft.member.join.service;

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
@Alias("memberVO")
public class MemberVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String meSeq  ;
	private String meDt   ;
	private String meId   ;
	private String meName ;
	private String mePw   ;
	private String meHp   ;
	private String meMail ;
	private String meFailCnt;
	private String divn;
	
	
	public String getDivn() {
		return divn;
	}
	public void setDivn(String divn) {
		this.divn = divn;
	}
	public String getMeFailCnt() {
		return meFailCnt;
	}
	public void setMeFailCnt(String meFailCnt) {
		this.meFailCnt = meFailCnt;
	}
	public String getMeSeq() {
		return meSeq;
	}
	public void setMeSeq(String meSeq) {
		this.meSeq = meSeq;
	}
	public String getMeDt() {
		return meDt;
	}
	public void setMeDt(String meDt) {
		this.meDt = meDt;
	}
	public String getMeId() {
		return meId;
	}
	public void setMeId(String meId) {
		this.meId = meId;
	}
	public String getMeName() {
		return meName;
	}
	public void setMeName(String meName) {
		this.meName = meName;
	}
	public String getMePw() {
		return mePw;
	}
	public void setMePw(String mePw) {
		this.mePw = mePw;
	}
	public String getMeHp() {
		return meHp;
	}
	public void setMeHp(String meHp) {
		this.meHp = meHp;
	}
	public String getMeMail() {
		return meMail;
	}
	public void setMeMail(String meMail) {
		this.meMail = meMail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}