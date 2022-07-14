package com.open.ft.cs.estQst;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.ft.member.join.service.MemberVO;
import com.open.ma.kim.estQst.service.EstQstVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller 
public class FtEstQstController {

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService") 
    private FileMngService fileMngService;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "EstQst";

    /** folderPath **/
    private final static String folderPath = "/ft/cs/estQst/";
    
    private final static String subFolderPath = "/ft/cs/estimate/";
    
    private String message = "";

    private String cmmnScript = "";
    
    private String pName = "";
    
    private String pValue = "";
      
	@RequestMapping(subFolderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ subFolderPath + "list";
	}    
	   
	@RequestMapping(subFolderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		searchVO.setPageUnit(6);
		searchVO.setPageSize(7);
 
		/** pageing setting */
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
		List<EstQstVO> resultList = (List<EstQstVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		
		return subFolderPath + "addList";
	} 
  

	@RequestMapping(subFolderPath +"view.do")
	public String view(@ModelAttribute("searchVO") EstQstVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		EstQstVO estQstVO = new EstQstVO();
		estQstVO = (EstQstVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("estQstVO", estQstVO);
		
		return ".fLayout:"+ subFolderPath + "view";
	}    
         
	@RequestMapping(folderPath + "form.do")
	public String basicForm(@ModelAttribute("searchVO") EstQstVO searchVO, Model model, HttpServletRequest request) throws Exception {
		 
		HttpSession session = request.getSession();  
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if("".equals(StringUtil.isNullToString(memberVO))){
			model.addAttribute("message", "비정상적인 접근입니다.");
			model.addAttribute("cmmnScript", "/ft/member/login/loginFrm.do"); 
			return "cmmn/execute"; 
		}else{
			return ".fLayout:"+ folderPath + "form";
		} 
	} 
    
	
	@RequestMapping(subFolderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") EstQstVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		
		EstQstVO estQstVO = new EstQstVO();
		if (procType.equals("update")) {
			estQstVO = (EstQstVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("estQstVO", estQstVO);

		return ".fLayout:"+ folderPath + "form";
	} 
  
	@RequestMapping(value = folderPath + "insertProc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") EstQstVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		 
		cmmnService.insertContents(searchVO, PROGRAM_ID);
		model.addAttribute("message", "등록되었습니다.");
		model.addAttribute("cmmnScript", subFolderPath + "list.do");
			
		return "cmmn/execute";
	} 
      
	@RequestMapping(value = subFolderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("searchVO") EstQstVO searchVO, Model model, SessionStatus status, @PathVariable String procType, HttpServletRequest request) throws Exception {
		 
				   
			if (procType.equals("update") ) {				 
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				message = "수정되었습니다.";
				pName = "eqSeq";
				pValue = searchVO.getEqSeq();
				cmmnScript = subFolderPath + "view.do";				
			} else if (procType.equals("delete")) {				 
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				message = "삭제되었습니다.";
				cmmnScript = subFolderPath + "list.do";
			}
		
			model.addAttribute("pName", pName);
			model.addAttribute("pValue", pValue);
			model.addAttribute("message", message);
			model.addAttribute("cmmnScript", cmmnScript);
			return "cmmn/execute";
	}
	
	   
	@ResponseBody
	@SuppressWarnings("rawtypes")
	@RequestMapping(subFolderPath + "checkPw.do")
	public Map checkPw(@ModelAttribute("searchVO") EstQstVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		      
		Map<String, Boolean> map = new HashMap<>();  
		EstQstVO result = (EstQstVO)cmmnService.selectContents(searchVO, PROGRAM_ID);  
		if(result.getEqPw().equals(searchVO.getEqPw())){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		  
		return map;
	} 
	
		 

}
