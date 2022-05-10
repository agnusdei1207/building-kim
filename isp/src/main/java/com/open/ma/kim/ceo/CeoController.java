package com.open.ma.kim.ceo;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.service.CmmnService;
import com.open.ma.kim.ceo.service.CeoVO;


@Controller
public class CeoController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Ceo";

    /** folderPath **/
    private final static String folderPath = "/ma/kim/ceo/";
    
    private String message = "";
    
    private String pName = "";
    
    private String pValue = "";
    
    private String cmmnScript = "";
	
	@RequestMapping(folderPath + "{procType}form.do")
	public String form(@ModelAttribute("searchVO") CeoVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		     
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO);
		}   
		
		return ".mLayout:"+ folderPath + "form";
	}    
  
	@RequestMapping(folderPath + "{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		    
		System.out.println("searchVO >> "+ searchVO.getCeAdd());
		System.out.println("procType >> "+ procType);
		
		if(procType != null){
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				message = "등록되었습니다.";
				cmmnScript = "form.do";
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);	
				message = "수정되었습니다";
				cmmnScript = "form.do";
			}  
		}
			model.addAttribute("message", message);     
			model.addAttribute("cmmnScript", cmmnScript);
			return "cmmn/execute";
	}

	

	
		

}
