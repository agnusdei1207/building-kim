package com.open.ft.member.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.ft.member.join.service.MemberVO;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */  
@Controller
public class MemberController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
    private final static String PROGRAM_ID = "Member";
    
    private final static String folderPath = "/ft/member/login/";
    
    private String message = "";
    
    private String cmmnScript = ""; 
    
    private String layout = ".fLayout:"; 
     
    
	@RequestMapping(folderPath + "loginFrm.do")  
	public String mainDo(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		return layout + folderPath + "loginFrm";   
	}  
                       
 	@RequestMapping(folderPath + "loginProcess.do")
	public String loginProcess(@ModelAttribute("searchVO") MemberVO searchVO	, HttpServletRequest request	, ModelMap model) throws Exception {
 
 		if(searchVO.getMeId() != null && searchVO.getMePw() != null && !"".equals(searchVO.getMeId()) && !"".equals(searchVO.getMePw())){
			searchVO.setMePw(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getMePw().getBytes("UTF-8"))));
			   
			MemberVO userLoginVO  = (MemberVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
			MemberVO checkFailCnt  = (MemberVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".checkPwSelectContents");
			
			if(userLoginVO == null || userLoginVO.getMeId() == null || "".equals(userLoginVO.getMeId())){
				if(checkFailCnt != null && checkFailCnt.getMeId() != null && checkFailCnt.getMeId() != ""){
					cmmnService.updateContents(checkFailCnt, PROGRAM_ID + ".updateFailCnt");
					if(Integer.parseInt(checkFailCnt.getMeFailCnt()) > 5){
						message = "비밀번호 입력회수 초과! 관리자에게 문의바랍니다.";
			    		cmmnScript = folderPath + "loginFrm.do";
			    		model.addAttribute("message", message); 
			    		model.addAttribute("cmmnScript", cmmnScript);   
			    		return "cmmn/execute";
					}
				}   
				      
	    		message = "아이디 또는 패스워드를 확인하시기 바랍니다.";
	    		cmmnScript = folderPath + "loginFrm.do"; 
	    		
	    	}else{      
	    		
	    		if(Integer.parseInt(userLoginVO.getMeFailCnt()) > 5){
	    			message = "비밀번호 입력회수 초과! 관리자에게 문의바랍니다.";
		    		cmmnScript = folderPath + "loginFrm.do";
	    		}else{
	    			HttpSession session = request.getSession();		
	    			session.setAttribute(SessionUtil.SESSION_FRONT_KEY, userLoginVO);
	    			session.setAttribute("memberVO", userLoginVO);
	    			cmmnService.updateContents(userLoginVO, PROGRAM_ID + ".resetFailCnt");
	    			  
	    			message = userLoginVO.getMeId()+" 님 환영합니다!";
	    			cmmnScript = "/ft/main/main.do";
	    		}
		    }    	 
		}else{ 
			message = "로그인정보가 넘어오지 않았습니다.";
			cmmnScript = folderPath + "loginFrm.do";
		} 
 		
 		model.addAttribute("message", message); 
		model.addAttribute("cmmnScript", cmmnScript);   
		return "cmmn/execute";
	}  
 
	@RequestMapping(folderPath + "logout.do")
	public String adminLogout(@ModelAttribute("searchVO") MemberVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession(); 
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		 
		message = memberVO.getMeId() +" 님 다시 만나요.";
		cmmnScript = "/ft/main/main.do";
		  
		session.removeAttribute(SessionUtil.SESSION_FRONT_KEY);
		session.removeAttribute("memberVO");
		
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute"; 
	}	
	

}
