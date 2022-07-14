package com.open.ft.member.writeList.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
  
@Alias("writeListVO")
@SuppressWarnings("serial")
public class WriteListVO extends CmmnDefaultVO implements Serializable {
	private String seq; 
	private String id; 
	private String title;
	private String cont;
	private String atchFileId;
	private String rgstDt;
	private String divn;  
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getDivn() {
		return divn;
	}
	public void setDivn(String divn) {
		this.divn = divn;
	}
	
	
	
}