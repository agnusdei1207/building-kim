package com.open.ma.develop.ipLog.service;

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
@Alias("ipLogVO")
public class IpLogVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String ipSeq;
	private String ipClientIp;
	private String ipRgstId;
	private String ipRgstDt;
	private String ipDt;
	private String ipCnt;
	
	   
	public String getIpRgstId() {
		return ipRgstId;
	}
	public void setIpRgstId(String ipRgstId) {
		this.ipRgstId = ipRgstId;
	}
	public String getIpRgstDt() {
		return ipRgstDt;
	}
	public void setIpRgstDt(String ipRgstDt) {
		this.ipRgstDt = ipRgstDt;
	}
	public String getIpSeq() {
		return ipSeq;
	}
	public void setIpSeq(String ipSeq) {
		this.ipSeq = ipSeq;
	}
	public String getIpClientIp() {
		return ipClientIp;
	}
	public void setIpClientIp(String ipClientIp) {
		this.ipClientIp = ipClientIp;
	}
	public String getIpDt() {
		return ipDt;
	}
	public void setIpDt(String ipDt) {
		this.ipDt = ipDt;
	}
	public String getIpCnt() {
		return ipCnt;
	}
	public void setIpCnt(String ipCnt) {
		this.ipCnt = ipCnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
	
	
	
}