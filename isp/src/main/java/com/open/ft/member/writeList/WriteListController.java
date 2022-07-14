package com.open.ft.member.writeList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.ft.member.join.service.MemberVO;
import com.open.ft.member.writeList.service.WriteListVO;
import com.open.ma.kim.free.service.FreeVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller    
public class WriteListController {
	
	@Resource(name = "cmmnService")
    protected CmmnService cmmnService; 
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;  
	
    private final static String PROGRAM_ID = "WriteList";
    
    private final static String folderPath = "/ft/member/writeList/";
      
    private String layout = ".fLayout:";
  
	/* 내가 작성한 글 리스트  */
	@RequestMapping(folderPath + "writeList.do")
	public String writedList(@ModelAttribute("searchVO") WriteListVO searchVO) throws Exception {
		
		return layout + folderPath + "list";  
	}     
	 
	/* 내가 작성한 글 전체 목록  */   
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		  
		HttpSession session = request.getSession();	        
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if(memberVO != null && !"".equals(StringUtil.nullString(memberVO.getMeId()))){    
			searchVO.setFrontLoginId(memberVO.getMeId());
		}
		      
		searchVO.setPageUnit(6);    
		searchVO.setPageSize(5);      
  
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());   
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		    
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);  
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo); 
		   
		@SuppressWarnings("unchecked")   
		List<WriteListVO> resultList = (List<WriteListVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList"; 
	}  
     
	/* 내가 작성한 글  */ 
	@RequestMapping(folderPath + "viewList.do")  
	public String viewList(@ModelAttribute("searchVO") WriteListVO searchVO) throws Exception {
		        
		System.out.println("viewList 구분 값 schEtc02 : " + searchVO.getSchEtc02());
		System.out.println("viewList 시퀀스 schEtc03 : " + searchVO.getSchEtc03());
		
		return layout + folderPath + "viewList";  
	}  
	
	
	
}

