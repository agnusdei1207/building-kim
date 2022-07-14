package com.open.ft.port;

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
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.kim.port.service.PortVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtPortController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
     
    /** Program ID **/
    private final static String PROGRAM_ID = "Port";

    /** folderPath **/
    private final static String folderPath = "/ft/port/";
 
	 
	@RequestMapping(folderPath + "{procType}/list.do") 
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model,@PathVariable String procType,  HttpServletRequest request) throws Exception {

		if("buildEx".equals(procType)){
			searchVO.setSchEtc05("B");
		}else if("recmnd".equals(procType)){
			searchVO.setSchEtc05("R");
		}else if("site".equals(procType)){
			searchVO.setSchEtc05("S");  
		}else{    
			searchVO.setSchEtc05("I");
		}                 
		  
		return ".fLayout:"+ folderPath + "list";
	}
	   
 
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "{procType}/addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, @PathVariable String procType,HttpServletRequest request) throws Exception {
		
		   
		if("buildEx".equals(procType)){
			searchVO.setSchEtc05("B");
		}else if("recmnd".equals(procType)){
			searchVO.setSchEtc05("R");
		}else if("site".equals(procType)){
			searchVO.setSchEtc05("S");
		}else{   
			searchVO.setSchEtc05("I");
		} 
		searchVO.setPageUnit(6); 
		searchVO.setPageSize(7);    
    
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		  
		           
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".selectKindCount");
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<PortVO> resultList = (List<PortVO>) cmmnService.selectList(searchVO, PROGRAM_ID +".selectKindList");
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}  

  
   
	@RequestMapping(folderPath +"{procType}/view.do")
	public String view(@ModelAttribute("searchVO") PortVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		PortVO portVO = new PortVO();
		portVO = (PortVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("portVO", portVO);
		 
		FileVO fileVO = new FileVO();   
		fileVO.setAtchFileId(portVO.getPoAtchFileId());
		
		
		List<FileVO> fileSnList = fileMngService.selectFileInfs(fileVO);
		model.addAttribute("fileSnList", fileSnList);    
		
		return ".fLayout:"+ folderPath + "view";
	}

	

	
		

}
