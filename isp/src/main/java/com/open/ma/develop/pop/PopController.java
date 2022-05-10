package com.open.ma.develop.pop;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.develop.pop.service.PopVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller 
public class PopController {

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties; 
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView; 
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Pop";  

    /** folderPath **/
    private final static String folderPath = "/ma/develop/pop/";
    

    private String message = "";

    private String cmmnScript = "";
     
    private String pName = "";
    
    private String pValue = "";

	Logger log = Logger.getLogger(this.getClass());  

	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ folderPath + "list";
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
		List<PopVO> resultList = (List<PopVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
 
		
		return folderPath + "addList";
	} 


	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") PopVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		PopVO popVO = new PopVO();
		popVO = (PopVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("popVO", popVO);
		
		PopVO pre = new PopVO();
		pre = (PopVO) cmmnService.selectContents(searchVO, PROGRAM_ID +".preSelectContents" );
		model.addAttribute("pre", pre);
		
		PopVO next = new PopVO();  
		next = (PopVO) cmmnService.selectContents(searchVO, PROGRAM_ID +".nextSelectContents" );
		model.addAttribute("next", next);
		
		
		return ".fLayout:"+ folderPath + "view";
	}

	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") PopVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		PopVO popVO = new PopVO();
		if (procType.equals("update")) {
			popVO = (PopVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("popVO", popVO);

		return ".fLayout:"+ folderPath + "form";
	}  

	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") PopVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		if(procType != null){ 
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				message = "등록되었습니다.";
				cmmnScript = "list.do";
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);	
				message = "수정되었습니다.";
				cmmnScript = "view.do";   
				pName = "poSeq"; 
				pValue = searchVO.getPoSeq();
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
