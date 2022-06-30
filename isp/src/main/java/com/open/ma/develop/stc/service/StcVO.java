package com.open.ma.develop.stc.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

@Alias("stcVO")
public class StcVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String ciapTotalSeq;
	private String com;
	private String area;
	private String address;
	private String visitDate;
	private String atchFileId;
	
	private String visitDateReal;
	List<StcVO> excelList;
	
	private String year;
	
	private String year1;
	
	private String year2;
	
	private String year3;
	
	private String year4;
	
	private String year5;
	
	private String mon1;
	
	private String mon2;
	
	private String mon3;
	
	private String mon4;
	
	private String mon5;
	
	private String mon6;
	
	private String mon7;
	
	private String mon8;
	
	private String mon9;
	
	private String mon10;
	
	private String mon11;
	
	private String mon12;
	
	private String area1;
	
	private String area2;
	
	private String area3;
	
	private String area4;
	
	private String area5;
	
	private String area6;
	
	private String area7;
	
	
	
	public String getVisitDateReal() {
		return visitDateReal;
	}

	public void setVisitDateReal(String visitDateReal) {
		this.visitDateReal = visitDateReal;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public List<StcVO> getExcelList() {
		return excelList;
	}

	public void setExcelList(List<StcVO> excelList) {
		this.excelList = excelList;
	}

	public String getCiapTotalSeq() {
		return ciapTotalSeq;
	}

	public void setCiapTotalSeq(String ciapTotalSeq) {
		this.ciapTotalSeq = ciapTotalSeq;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getCom() {
		return com;
	}

	public void setCom(String com) {
		this.com = com;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}

	public String getYear1() {
		return year1;
	}

	public void setYear1(String year1) {
		this.year1 = year1;
	}

	public String getYear2() {
		return year2;
	}

	public void setYear2(String year2) {
		this.year2 = year2;
	}

	public String getYear3() {
		return year3;
	}

	public void setYear3(String year3) {
		this.year3 = year3;
	}

	public String getYear4() {
		return year4;
	}

	public void setYear4(String year4) {
		this.year4 = year4;
	}

	public String getYear5() {
		return year5;
	}

	public void setYear5(String year5) {
		this.year5 = year5;
	}

	public String getMon1() {
		return mon1;
	}

	public void setMon1(String mon1) {
		this.mon1 = mon1;
	}

	public String getMon2() {
		return mon2;
	}

	public void setMon2(String mon2) {
		this.mon2 = mon2;
	}

	public String getMon3() {
		return mon3;
	}

	public void setMon3(String mon3) {
		this.mon3 = mon3;
	}

	public String getMon4() {
		return mon4;
	}

	public void setMon4(String mon4) {
		this.mon4 = mon4;
	}

	public String getMon5() {
		return mon5;
	}

	public void setMon5(String mon5) {
		this.mon5 = mon5;
	}

	public String getMon6() {
		return mon6;
	}

	public void setMon6(String mon6) {
		this.mon6 = mon6;
	}

	public String getMon7() {
		return mon7;
	}

	public void setMon7(String mon7) {
		this.mon7 = mon7;
	}

	public String getMon8() {
		return mon8;
	}

	public void setMon8(String mon8) {
		this.mon8 = mon8;
	}

	public String getMon9() {
		return mon9;
	}

	public void setMon9(String mon9) {
		this.mon9 = mon9;
	}

	public String getMon10() {
		return mon10;
	}

	public void setMon10(String mon10) {
		this.mon10 = mon10;
	}

	public String getMon11() {
		return mon11;
	}

	public void setMon11(String mon11) {
		this.mon11 = mon11;
	}

	public String getMon12() {
		return mon12;
	}

	public void setMon12(String mon12) {
		this.mon12 = mon12;
	}

	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getArea2() {
		return area2;
	}

	public void setArea2(String area2) {
		this.area2 = area2;
	}

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	public String getArea4() {
		return area4;
	}

	public void setArea4(String area4) {
		this.area4 = area4;
	}

	public String getArea5() {
		return area5;
	}

	public void setArea5(String area5) {
		this.area5 = area5;
	}

	public String getArea6() {
		return area6;
	}

	public void setArea6(String area6) {
		this.area6 = area6;
	}

	public String getArea7() {
		return area7;
	}

	public void setArea7(String area7) {
		this.area7 = area7;
	}
}