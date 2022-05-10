package com.open.ma.kim.banner;

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
import com.open.cmmn.util.StringUtil;
import com.open.ma.kim.banner.service.BannerVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller 
public class BannerController {

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Banner";

    /** folderPath **/
    private final static String folderPath = "/ma/kim/banner/";
    
    private String message = "";
    
	private String pName = "";
    
    private String pValue = "";
    
    private String cmmnScript = "";

	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mLayout:"+ folderPath + "list";
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
		List<BannerVO> resultList = (List<BannerVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		

		
		return folderPath + "addList";
	}

 
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") BannerVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		BannerVO bannerVO = new BannerVO(); 
		bannerVO = (BannerVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("bannerVO", bannerVO); 
		
		FileVO fileVO = new FileVO();   
		fileVO.setAtchFileId(bannerVO.getBaAtchFileId());
		List<FileVO> fileSnList = fileMngService.selectFileInfs(fileVO);
		model.addAttribute("fileSnList", fileSnList); 
		  
		return ".mLayout:"+ folderPath + "view";
	} 

	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") BannerVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		BannerVO bannerVO = new BannerVO();
		if (procType.equals("update")) {
			bannerVO = (BannerVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("bannerVO", bannerVO);

		return ".mLayout:"+ folderPath + "form";
	}

	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") BannerVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		if(procType != null){
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				message = "등록되었습니다.";
				cmmnScript = "list.do";
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				message = "수정되었습니다.";
				cmmnScript = "view.do";
				pName = "baSeq";
				pValue = searchVO.getBaSeq();
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				message = "삭제되었습니다.";
				cmmnScript = "list.do";
			} 
		}
		model.addAttribute("message", message);     
		model.addAttribute("pName", pName);     
		model.addAttribute("pValue", pValue);     
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";
	}

}
