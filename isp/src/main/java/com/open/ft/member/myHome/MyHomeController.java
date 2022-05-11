package com.open.ft.member.myHome;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.member.join.service.MemberVO;

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

	   
	@RequestMapping(folderPath + "checkPwFrm.do")
	public String chceckPwFrm(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		return layout + folderPath + "checkPwFrm";
	}   
               
	@RequestMapping(folderPath + "myHomeFrm.do")
	public String myHomeFrm(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		 
		HttpSession session = request.getSession();  
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if("".equals(StringUtil.isNullToString(memberVO))){ 
			message = "비정상적인 접근입니다.";
			cmmnScript = "/ft/member/login/loginFrm.do";
			model.addAttribute("message", message);
			model.addAttribute("cmmnScript", cmmnScript); 
			return "cmmn/execute";  
		}else{   
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
}

