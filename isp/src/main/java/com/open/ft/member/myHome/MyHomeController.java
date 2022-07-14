package com.open.ft.member.myHome;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.member.join.service.MemberVO;
import com.open.ft.member.writeList.service.WriteListVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller    
public class MyHomeController {
	
	@Resource(name = "cmmnService")
    protected CmmnService cmmnService; 
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;  
	
    private final static String PROGRAM_ID = "Member";
    
    private final static String folderPath = "/ft/member/myHome/";
    
    private String message = "";
    
    private String cmmnScript = "";
    
    private String layout = ".fLayout:";

    private String pName = ""; 
    
    private String pValue = "";
    
	@RequestMapping(folderPath + "checkPwFrm.do")
	public String chceckPwFrm(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();  
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if("".equals(StringUtil.isNullToString(memberVO))){
			model.addAttribute("message", "비정상적인 접근입니다.");
			model.addAttribute("cmmnScript", "/ft/member/login/loginFrm.do"); 
			return "cmmn/execute"; 
		}else{
			return layout + folderPath + "checkPwFrm";
		} 
	}        
               
	@RequestMapping(folderPath + "myHomeFrm.do")
	public String myHomeFrm(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request, String divn) throws Exception {

		HttpSession session = request.getSession();  
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if("".equals(StringUtil.isNullToString(memberVO))){ 
			message = "비정상적인 접근입니다.";
			cmmnScript = "/ft/member/login/loginFrm.do";
			model.addAttribute("message", message); 
			model.addAttribute("cmmnScript", cmmnScript);   
			return "cmmn/execute";   
		}else{       
			if("".equals(searchVO.getSchEtc02()) || "free".equals(searchVO.getSchEtc02())){  
				searchVO.setSchEtc02("free");  
			}else{
				searchVO.setSchEtc02("estQst");  
			}
			
			
			return layout + folderPath + "myHomeFrm"; 
		} 
	}       
	 
	@RequestMapping(folderPath + "checkPw.do")
	public String checkPw(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		if(!"".equals(StringUtil.isNullToString(searchVO.getMePw()))){
			String pw = ((String)EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getMePw().getBytes("UTF-8"))));
			MemberVO userLoginVO  = (MemberVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".checkPwSelectContents");
			 
			if(pw.equals(userLoginVO.getMePw())){
				message = "마이홈으로 이동합니다.";    
				cmmnScript = folderPath + "myHomeFrm.do";
			}else{
				message = "비밀번호가 틀렸습니다.";
				cmmnScript = folderPath + "checkPwFrm.do";
			}
		}  
		               
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript );
		return "cmmn/execute"; 
	}         
	     
	@RequestMapping(folderPath + "updateMyHomeProess.do")
	public String updateMyHomeProess(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		       
		if(!"".equals(StringUtil.isNullToString(searchVO.getMePw()))){
			searchVO.setMePw(((String)EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getMePw().getBytes("UTF-8")))));
		}       
 		
 		message = "마이홈 수정이 완료되었습니다."; 
 		cmmnScript = "/ft/main/main.do";
 		
 		cmmnService.updateContents(searchVO, PROGRAM_ID); 
 		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute"; 
	}  
	    
	/* 내가 작성한 글 리스트  */
	@RequestMapping(folderPath + "writeList.do")
	public String writedList(@ModelAttribute("searchVO") WriteListVO searchVO) throws Exception {
		
		return layout + folderPath + "list";    
	}       
	   
	  
	 
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		  
		HttpSession session = request.getSession();	        
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if(memberVO != null && !"".equals(StringUtil.nullString(memberVO.getMeId()))){    
			searchVO.setFrontLoginId(memberVO.getMeId());
		}  
		    
		/* 게시판 종류 구분  */
		String sql = "";       
		if("".equals(searchVO.getSchEtc02()) || "free".equals(searchVO.getSchEtc02())){
			sql = "Free"; // default : 자유게시판
		}else{ 
			sql = "EstQst";      
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
		      
		int totCnt = cmmnService.selectCount(searchVO, sql + ".myhomeSelectCount");  
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo); 
		     
		@SuppressWarnings("unchecked")        
		List<WriteListVO> resultList = (List<WriteListVO>) cmmnService.selectList(searchVO, sql + ".myhomeSelectList");
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList"; 
	}  
	       
	         
	/* 마이홈 검색 리스트  */  
	@RequestMapping(folderPath + "list.do") 
	public String list(@ModelAttribute("searchVO") WriteListVO searchVO) throws Exception {
		
		if("".equals(searchVO.getSchEtc02()) || "free".equals(searchVO.getSchEtc02())){
			searchVO.setDivn("free");
		}else{ 
			searchVO.setDivn("estQst"); 
		}             
		  
		return folderPath + "list";   
	}    
	
	@RequestMapping(folderPath + "view.do")
	public String view(@ModelAttribute("searchVO") WriteListVO searchVO, Model model) throws Exception {
		
		String sql = "";
		if("".equals(searchVO.getSchEtc02()) || "free".equals(searchVO.getSchEtc02())){
			sql = "Free"; // default : 자유게시판
		}else{    
			sql = "EstQst";              
		}                    
		   
		String searchKeyword = searchVO.getSearchKeyword();
		int pageIndex = searchVO.getPageIndex();
		searchVO = (WriteListVO)cmmnService.selectContents(searchVO, sql + ".selectContentsMyhome");  
		searchVO.setPageIndex(pageIndex); // 페이지 인덱스 저장 
		searchVO.setSearchKeyword(searchKeyword); // 검색어 저장  
		model.addAttribute("searchVO", searchVO);  
		 
		return folderPath + "view";   
	}    
	       
	     
	/* 등록 및 업데이트 form 열기  */    
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") WriteListVO searchVO, @PathVariable String procType, Model model) throws Exception {
		   
		/* 게시판 종류 구분 */     
		String sql = "";       
		if("".equals(searchVO.getSchEtc02()) || "free".equals(searchVO.getSchEtc02())){
			sql = "Free"; // default : 자유게시판
		}else{         
			sql = "EstQst";        
		}               
		
		if("update".equals(procType)){
			searchVO = (WriteListVO)cmmnService.selectContents(searchVO, sql + ".selectContentsMyhome");  
		}
		   
		model.addAttribute("searchVO", searchVO);
		return folderPath + "form";   
	}  
	      
	
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") WriteListVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		/* 게시판 종류 구분 */     
		String sql = "";       
		if("".equals(searchVO.getSchEtc02()) || "free".equals(searchVO.getSchEtc02())){
			sql = "Free"; // default : 자유게시판
		}else{     
			sql = "EstQst";          
		}           
		  
		if(procType != null){ 
			if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, sql + ".updateContentsMyhome");   
				/* ajax 응답 */
				searchVO = (WriteListVO)cmmnService.selectContents(searchVO, sql + ".selectContentsMyhome"); 
				model.addAttribute("searchVO", searchVO);
				return folderPath + "view";     
				
			} else if (procType.equals("insert")) {			
				cmmnService.insertContents(searchVO, sql + ".insertContentsMyhome");
				message = "입력되었습니다.";
				cmmnScript = "myHomeFrm.do";
			} else if (procType.equals("delete")) {				      
				cmmnService.deleteContents(searchVO, sql + ".deleteContentsMyhome"); 
				message = "삭제되었습니다.";   
				cmmnScript = "myHomeFrm.do";  
			}   
		}
		
		model.addAttribute("pName", pName);
		model.addAttribute("pValue", pValue);
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";

	}
	
}

