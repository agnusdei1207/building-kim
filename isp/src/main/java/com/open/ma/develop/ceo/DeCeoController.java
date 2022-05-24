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
   
	@RequestMapping(folderPath + "updateProc.do")
	public String proc(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO); 
		}        
		         
		BannerVO bannerVO = new BannerVO();    
		
		for(int i = 0; i < searchVO.getBaSeq().length; i++){    
			    
				bannerVO.setBaSeq(searchVO.getBaSeq()[i]);  
				bannerVO.setBaTitle(searchVO.getBaTitle()[i]);    
				bannerVO.setBaCont(searchVO.getBaCont()[i]);    
				bannerVO.setBaUrl(searchVO.getBaUrl()[i]); 
				bannerVO.setBaWindow(searchVO.getBaWindow()[i]);  
				bannerVO.setBaExposeYn(searchVO.getBaExposeYn()[i]); 
				bannerVO.setBaOrderNum(searchVO.getBaOrderNum()[i]); 
				bannerVO.setBaAtchFileId(searchVO.getBaAtchFileId()[i]); 
				bannerVO.setBaPosition(searchVO.getBaPosition()[i]);   
				if("N".equals(searchVO.getBaSeq()[i])){   
					cmmnService.insertContents(bannerVO, "Banner");
				}else{
					cmmnService.updateContents(bannerVO, "Banner");
				} 
				
		}            
		 
		
		  
		System.out.println(1);
		if(searchVO.getBannerList() != null && searchVO.getBannerList().size() > 0) { 
			System.out.println(2);
			Iterator<BannerVO> tempList = searchVO.getBannerList().iterator();
			System.out.println(3);
			while(tempList.hasNext()) {        
				System.out.println(4);
				BannerVO tempVO = tempList.next();  
				if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) { 
					System.out.println("rrrrrrrrrrrr");
					tempList.remove();     		      
				}else{      
					System.out.println("5");
					cmmnService.deleteContents(tempVO, "Banner");  
				}  
			}           
			  
			for (BannerVO tempVO : ceoVO.getBannerList()) {  
				System.out.println("temp :::: "+ tempVO);
				if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {  
					System.out.println(6);
					cmmnService.insertContents(tempVO, "Banner");  
				}else {   
					System.out.println(7);
					cmmnService.updateContents(tempVO, "Banner.updateReverse"); 
				}  
			}   
		}  
		model.addAttribute("message", "등록되었습니다.");  
		model.addAttribute("cmmnScript", folderPath + "form.do");
		return "cmmn/execute";
	}        
		 
		 
             
		
		   
	@ResponseBody
	@RequestMapping(folderPath + "delBanner.do")
	public void delUpBanner(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		searchVO.setCol1(searchVO.getBaSeq()[0]);
		cmmnService.deleteContents(searchVO, "Banner.deleteBannerContents");    
		 
	}     
	
}
