package com.open.ft.member.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.ft.member.join.service.MemberVO;
import com.open.ma.kim.ceo.service.CeoVO;
import com.open.ma.login.service.LoginVO;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */  
@Controller
public class MemberController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	
    private final static String PROGRAM_ID = "Member";
    
    private final static String folderPath = "/ft/member/login/";
    
    private String layout = ".fLayout:";
 
	    
	@RequestMapping(folderPath + "loginFrm.do")  
	public String mainDo(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		  
		return layout + folderPath + "loginFrm";   
	} 
                      
 	@RequestMapping(folderPath + "loginProcess.do")
	public String loginProcess(@ModelAttribute("searchVO") MemberVO searchVO	, HttpServletRequest request	, ModelMap model	, SessionStatus status) throws Exception {

 		if(searchVO.getMeId() != null && searchVO.getMePw() != null && !"".equals(searchVO.getMeId()) && !"".equals(searchVO.getMePw())){
			searchVO.setMePw(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getMePw().getBytes("UTF-8"))));
			   
			MemberVO userLoginVO  = (MemberVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
			    
	    	if(userLoginVO == null || userLoginVO.getMeId() == null || "".equals(userLoginVO.getMeId())){
	    		model.addAttribute("message", "아이디 또는 패스워드를 확인하시기 바랍니다.");
	    		model.addAttribute("cmmnScript", folderPath + "loginFrm.do");
	    	}else{ 
	    		 	/** 세션 정보 입력 */ 
					HttpSession session = request.getSession();					
					session.setAttribute(SessionUtil.SESSION_FRONT_KEY, userLoginVO);
					session.setAttribute("memberVO", userLoginVO);
					model.addAttribute("message", userLoginVO.getMeId()+" 님 환영합니다.");
		    		model.addAttribute("cmmnScript", "/ft/main/main.do");
		    }    	 
		}else{ 
    		status.setComplete();
			model.addAttribute("message", "로그인정보가 넘어오지 않았습니다.");
			model.addAttribute("cmmnScript", folderPath + "loginFrm.do");
		} 
		return "cmmn/execute";
	} 
 
	@RequestMapping(folderPath + "logout.do")
	public String adminLogout(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
  
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
		model.addAttribute("message", memberVO.getMeId() +" 님 다시 만나요.");
		model.addAttribute("cmmnScript", "/ft/main/main.do");
		session.removeAttribute("memberVO");
		
		return "cmmn/execute"; 
	}	
	

}
