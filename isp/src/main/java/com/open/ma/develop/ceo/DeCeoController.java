package com.open.ma.develop.ceo;


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

import com.open.cmmn.service.CmmnService;
import com.open.ma.kim.banner.service.BannerVO;
import com.open.ma.kim.ceo.service.CeoVO;


@Controller
public class DeCeoController {

	@Resource(name = "cmmnService")   
    protected CmmnService cmmnService;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Ceo";

    /** folderPath **/ 
    private final static String folderPath = "/ma/develop/deCeo/";
    
	@RequestMapping(folderPath + "{procType}form.do")    
	public String form(@ModelAttribute("searchVO") CeoVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		     
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO);
		}    
		   
		  
		List<BannerVO> upBannerList = (List<BannerVO>)cmmnService.selectList(searchVO, "Banner.upBannerSelectList");
		model.addAttribute("upBannerList", upBannerList); 
		 
		List<BannerVO> downBannerList = (List<BannerVO>)cmmnService.selectList(searchVO, "Banner.downBannerSelectList");
		model.addAttribute("downBannerList", downBannerList);
		
		 
		return ".mLayout:"+ folderPath + "form";
	}     
  
	@RequestMapping(folderPath + "{procType}Proc.do")
	public void proc(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		    
		     
	}      
        
	@ResponseBody
	@RequestMapping(folderPath + "delUpBanner.do")
	public void delUpBanner(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		cmmnService.deleteContents(searchVO, "Banner");    
		
	}     
	
}
