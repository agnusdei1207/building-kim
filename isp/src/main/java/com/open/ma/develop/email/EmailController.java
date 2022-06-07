package com.open.ma.develop.email;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.ma.develop.email.service.EmailVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller 
public class EmailController {   

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Email";

    /** folderPath **/
    private final static String folderPath = "/ma/develop/email/";
    
    private String message = "";
 
    private String cmmnScript = ""; 
       
    private String pName = ""; 
    
    private String pValue = "";
    
	@RequestMapping(folderPath + "list.do") 
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mLayout:"+ folderPath + "list";
	}
	          
	@RequestMapping(folderPath + "pop.do")
	public String pop(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
  
		String result = folderPath + "pop"; 
		          
		if("pop".equals(searchVO.getSchEtc03())){ 
			result = ".mPopLayout:/" + folderPath + "pop";
		} 
		   
		return result; 
	}
	
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "popList.do")
	public String popList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		 
		System.out.println("getSchEtc01 : " + searchVO.getSchEtc01());
		System.out.println("getSchEtc03 : " + searchVO.getSchEtc03());
		    
		searchVO.setPageUnit(3);  
		searchVO.setPageSize(4);
		 
		PaginationInfo paginationInfo = new PaginationInfo();
		 
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".selectPopCount" );  
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo); 
		          
		List<EmailVO> resultList = (List<EmailVO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".selectPopList");
		model.addAttribute("resultList", resultList);
		    
		return folderPath + "popList";
	}
	
	
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		 
		searchVO.setPageUnit(6);
		searchVO.setPageSize(7);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		  
		@SuppressWarnings("unchecked")
		List<EmailVO> resultList = (List<EmailVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}
 

	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") EmailVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		EmailVO emailVO = new EmailVO();
		emailVO = (EmailVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("emailVO", emailVO);
		
		return ".mLayout:"+ folderPath + "view"; 
	}

	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") EmailVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		EmailVO emailVO = new EmailVO(); 
		if (procType.equals("update")) {
			emailVO = (EmailVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("emailVO", emailVO);

		return ".mLayout:"+ folderPath + "form";
	}
   
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") EmailVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		if(procType != null){
			if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				message = "수정되었습니다.";
				cmmnScript = "view.do";
				pName = "emSeq";
				pValue = searchVO.getEmSeq();
			} else if (procType.equals("insert")) {				
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				message = "등록되었습니다.";
				cmmnScript = "list.do";     
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				message = "삭제되었습니다.";
				cmmnScript = "list.do";
			} 
		}
		
		model.addAttribute("pName", pName);
		model.addAttribute("pValue", pValue);
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";

	}

	

	
		

}
