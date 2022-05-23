package com.open.ma.develop.ceo;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.StringUtil;
import com.open.ma.kim.banner.service.BannerVO;
import com.open.ma.kim.ceo.service.CeoVO;


@Controller
public class DeCeoController { 

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
    private final static String PROGRAM_ID = "Ceo";
     
    private final static String folderPath = "/ma/develop/deCeo/";
    
	@SuppressWarnings("unchecked")  
	@RequestMapping(folderPath + "form.do")    
	public String form(@ModelAttribute("searchVO") CeoVO searchVO, Model model, HttpServletRequest request) throws Exception {
		     
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO);
		}     
		            
		CmmnDefaultVO cmmnDefaultVo = new CmmnDefaultVO();
		List<CeoVO> upBannerList = (List<CeoVO>)cmmnService.selectList(cmmnDefaultVo, "Banner.upBannerSelectList");
		model.addAttribute("upBannerList", upBannerList); 
		 
		List<CeoVO> downBannerList = (List<CeoVO>)cmmnService.selectList(cmmnDefaultVo, "Banner.downBannerSelectList");
		model.addAttribute("downBannerList", downBannerList);
		
		return ".mLayout:"+ folderPath + "form";
	}        
  
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "updateProc.do")
	public String proc(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO);
		}       
		  
		List<BannerVO> upBannerList = (List<BannerVO>)cmmnService.selectList(searchVO, "Banner.upBannerSelectList"); 
		 
		if(searchVO != null || !"".equals(StringUtil.nullConvert(searchVO))){
			ceoVO.setBaSeq(searchVO.getBaSeq());
			ceoVO.setBaTitle(searchVO.getBaTitle());
			ceoVO.setBaCont(searchVO.getBaCont());
			ceoVO.setBaUrl(searchVO.getBaUrl());
			ceoVO.setBaWindow(searchVO.getBaWindow());
			ceoVO.setBaExposeYn(searchVO.getBaExposeYn());
			ceoVO.setBaOrderNum(searchVO.getBaOrderNum());
		}
		  
		ceoVO.setBannerList(upBannerList);      
		List<String> delSeqList = new ArrayList<>();
		BannerVO bannerVO = new BannerVO();  
		  
		
		if(ceoVO.getBaTitle() != null || ceoVO.getBaTitle().length > 0){
			for(int j = 0; j < ceoVO.getBaSeq().length; j++){
				for(int i = 0; i < upBannerList.size(); i++){
					if(ceoVO.getBaSeq()[j].equals(upBannerList.get(i))){
						delSeqList.add(ceoVO.getBaSeq()[i]);
						cmmnService.deleteContents(ceoVO.getBaSeq()[i], "Banner.updateReverse");
					}  
				} 
				if(ceoVO.getBaSeq()[j] == null || ceoVO.getBaSeq()[j] == "" || ceoVO.getBaSeq()[j] == " "){
					bannerVO.setBaTitle(ceoVO.getBaTitle()[j]);
					bannerVO.setBaCont(ceoVO.getBaCont()[j]);   
					bannerVO.setBaUrl(ceoVO.getBaUrl()[j]); 
					bannerVO.setBaWindow(ceoVO.getBaWindow()[j]);
					bannerVO.setBaExposeYn(ceoVO.getBaExposeYn()[j]);
					bannerVO.setBaOrderNum(ceoVO.getBaOrderNum()[j]);  
					cmmnService.insertContents(bannerVO, "Banner");
					System.out.println("toSring ::: " + bannerVO.toString());
				}
			}  
		}  
		
		       
		
		
		
//		if(ceoVO.getBannerList() != null && ceoVO.getBannerList().size() > 0) { 
//			Iterator<BannerVO> tempList = ceoVO.getBannerList().iterator();
//			while(tempList.hasNext()) {       
//				BannerVO tempVO = tempList.next();
//				if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {
//					tempList.remove();     		      
//				}else{   
//					cmmnService.deleteContents(tempVO, "Banner"); 
//				}
//			}        
//			                           
//			for (BannerVO tempVO : ceoVO.getBannerList()) { 
//				if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {  
//					cmmnService.insertContents(tempVO, "Banner");  
//				}else {   
//					cmmnService.updateContents(tempVO, "Banner.updateReverse"); 
//				}  
//			}
//			
//		}  
	        
		model.addAttribute("message", "등록되었습니다.");  
		model.addAttribute("cmmnScript", folderPath + "form.do");
		return "cmmn/execute";
	}        
		   
	@ResponseBody
	@RequestMapping(folderPath + "delUpBanner.do")
	public void delUpBanner(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		searchVO.setCol1(searchVO.getBaSeq()[0]);
		cmmnService.deleteContents(searchVO, "Banner.deleteBannerContents");    
		 
	}     
	
}
