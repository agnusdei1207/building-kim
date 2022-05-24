package com.open.ma.develop.calendar.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
 
@Alias("calendarVO")
@SuppressWarnings("serial")
public class CalendarVO extends CmmnDefaultVO implements Serializable {
	   
	private String caSeq;				// 일련번호
	private String caDataDate;			// 등록일
	private String caHolYn;				// 기념일구분
	private String caCont;				// 내용
	private String caRgstId;			// 작성자
	private String caRgstDt;			// 작성일
	private String caRvseId;			// 수정자
	private String caUseYn;				// 사용여부 
	private String caSelectedYear;		// 선택 년도
	private String caSelectedMonth;		// 선택 월
	private String caSchYearMonth;		// 선택 년월
	 
	private String[] arrSelect;   
	
	public String[] getArrSelect() {
		String[] newArrSelect = null;
		if(this.arrSelect!=null){
			newArrSelect = new String[arrSelect.length];
			for (int i = 0; i < arrSelect.length; i++) {
				newArrSelect[i] = this.arrSelect[i];
			}
		}
		return newArrSelect;
	}
	public void setArrSelect(String[] arrSelect) {
		this.arrSelect = arrSelect;
		this.arrSelect = new String[arrSelect.length];
		for (int i = 0; i < arrSelect.length; i++)
			this.arrSelect[i] = arrSelect[i];
	}    
	      
	
	public String getCaSeq() {
		return caSeq;
	}
	public void setCaSeq(String caSeq) {
		this.caSeq = caSeq;
	}
	public String getCaDataDate() {
		return caDataDate;
	}
	public void setCaDataDate(String caDataDate) {
		this.caDataDate = caDataDate;
	}
	public String getCaHolYn() {
		return caHolYn;
	}
	public void setCaHolYn(String caHolYn) {
		this.caHolYn = caHolYn;
	}
	public String getCaCont() {
		return caCont;
	}
	public void setCaCont(String caCont) {
		this.caCont = caCont;
	}
	public String getCaRgstId() {
		return caRgstId;
	}
	public void setCaRgstId(String caRgstId) {
		this.caRgstId = caRgstId;
	}
	public String getCaRgstDt() {
		return caRgstDt;
	}
	public void setCaRgstDt(String caRgstDt) {
		this.caRgstDt = caRgstDt;
	}
	public String getCaRvseId() {
		return caRvseId;
	}
	public void setCaRvseId(String caRvseId) {
		this.caRvseId = caRvseId;
	}
	public String getCaUseYn() {
		return caUseYn;
	}
	public void setCaUseYn(String caUseYn) {
		this.caUseYn = caUseYn;
	}
	public String getCaSelectedYear() {
		return caSelectedYear;
	}
	public void setCaSelectedYear(String caSelectedYear) {
		this.caSelectedYear = caSelectedYear;
	}
	public String getCaSelectedMonth() {
		return caSelectedMonth;
	}
	public void setCaSelectedMonth(String caSelectedMonth) {
		this.caSelectedMonth = caSelectedMonth;
	}
	public String getCaSchYearMonth() {
		return caSchYearMonth;
	}
	public void setCaSchYearMonth(String caSchYearMonth) {
		this.caSchYearMonth = caSchYearMonth;
	}
	
	
	
}