package com.open.ma.develop.pop.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;




@Alias("popVO")
public class PopVO extends CmmnDefaultVO implements Serializable {
	                 
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String poSeq;
	private String poAtchFileId;
	private String poTitle;
	private String poCont;
	private String poWidth;
	private String poHeight;
	private String poLeft;
	private String poCnt;
	   
	
	public String getPoSeq() {
		return poSeq;
	}
	public void setPoSeq(String poSeq) {
		this.poSeq = poSeq;
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
	public String getPoWidth() {
		return poWidth;
	}
	public void setPoWidth(String poWidth) {
		this.poWidth = poWidth;
	}
	public String getPoHeight() {
		return poHeight;
	}
	public void setPoHeight(String poHeight) {
		this.poHeight = poHeight;
	}
	public String getPoLeft() {
		return poLeft;
	}
	public void setPoLeft(String poLeft) {
		this.poLeft = poLeft;
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