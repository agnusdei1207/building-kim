package com.open.ft.main;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.develop.pop.service.PopVO;
import com.open.ma.kim.banner.service.BannerVO;
import com.open.ma.kim.ceo.service.CeoVO;
import com.open.ma.kim.ntc.service.NtcVO;
import com.open.ma.kim.port.service.PortVO;


@Controller
public class MainController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
    /** folderPath **/
    private final static String folderPath = "/ft/main/";
    private String layout = ".fLayout:";

	  
    @SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "main.do")
	public String mainDo(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		    
    	HttpSession session = request.getSession();
    	CeoVO ceoVO = (CeoVO)session.getAttribute("ceoVO");
    	 
    	FileVO fileVO = new FileVO();         
		fileVO.setAtchFileId(ceoVO.getCeAtchFileId());
		List<FileVO> ceoFileSnList = fileMngService.selectFileInfs(fileVO);
		model.addAttribute("ceoFileSnList", ceoFileSnList);
		
		List<NtcVO> ntcList = (List<NtcVO>) cmmnService.selectList(searchVO, "Ntc.selectMainList" );
		model.addAttribute("ntcList", ntcList);
		 
		List<BannerVO> bannerList = (List<BannerVO>) cmmnService.selectList(searchVO, "Banner.selectMainList" );
		model.addAttribute("bannerList", bannerList);
		    
		List<PopVO> popList = (List<PopVO>) cmmnService.selectList(searchVO, "Pop" );
		model.addAttribute("popList", popList);
		 
		return folderPath + "main";
	}
                
    
    
    @SuppressWarnings("unchecked")     
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, String category,ModelMap model, HttpServletRequest request) throws Exception {
    	  
    	if(category == null || "".equals(category)){
    		searchVO.setSchEtc05("B");
    		category = "buildEx";
    	}else{
    		searchVO.setSchEtc05(category);
    		switch(category) {
    		case "R": 
    			category = "recmnd";
    		    break;
    		case "S": 
    			category = "site";
    			break;
    		case "I": 
    			category = "interior";
    			break;
    		default: 
    			category = "buildEx";
    			break;
    		}	
    	}         
    	 
    	List<PortVO> resultList = (List<PortVO>) cmmnService.selectList(searchVO, "Port.selectMainList" );
    	
		model.addAttribute("category", category);
    	model.addAttribute("resultList", resultList);
		
    	return folderPath + "addList";	
    }
    
    
    
	@RequestMapping("/ft/intro/{procType}/list.do")
	public String intro(@ModelAttribute("searchVO") CmmnDefaultVO searchVO,@PathVariable String procType) throws Exception {
		    
		System.out.println("procType" + procType);
		    
		return layout + "/ft/intro/"+procType+"/list"; 
	}            
	          
	@RequestMapping("/ft/guide/{procType}/list.do")
	public String guide(@ModelAttribute("searchVO") CmmnDefaultVO searchVO,@PathVariable String procType) throws Exception {
		System.out.println("procType" + procType);
		
		 
		return layout + "/ft/guide/"+procType+"/list";
	}
		
	   
	@RequestMapping(folderPath + "fail.do")
	public String fail(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, Model model) throws Exception {
		
		model.addAttribute("message", "비정상적인 접근입니다.");     
		model.addAttribute("cmmnScript", "/ft/main/main.do");
		
		return "cmmn/execute";
	}
 
	@RequestMapping("/banIp.do")
	public String banIp(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, Model model) throws Exception {
		
		model.addAttribute("message", "차단된 IP입니다.");     
		model.addAttribute("cmmnScript", "https://www.naver.com/");
		   
		return "cmmn/execute";
	}
	
	
}  
