package com.open.ft.member.find;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.member.join.service.MemberVO;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FindController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	
    private final static String PROGRAM_ID = "Member";
    
    private final static String folderPath = "/ft/member/find/";
    
    private String layout = ".fLayout:";

	  
	@RequestMapping(folderPath + "findFrm.do")
	public String mainDo(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();  
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if(!"".equals(StringUtil.isNullToString(memberVO))){
			model.addAttribute("message", "비정상적인 접근입니다.");
			model.addAttribute("cmmnScript", "/ft/main/main.do"); 
			return "cmmn/execute";  
		}else{     
			return ".fLayout:"+ folderPath + "findFrm";
		} 
		
	}   
               
	
	@ResponseBody
	@SuppressWarnings("rawtypes")
	@RequestMapping(folderPath + "findId.do")
	public Map findId(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		Map<String, String> map = new HashMap<>();  
		MemberVO result = (MemberVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".findIdSelectContents");  
		if(!StringUtil.isNullToString(result).equals("")){
			map.put("result", result.getMeId());
		}else{
			map.put("result", "");	    
		}
		return map;
	} 
   
	
	@ResponseBody
	@SuppressWarnings("rawtypes")
	@RequestMapping(folderPath + "findPw.do")
	public Map findPw(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		   
		Map<String, String> map = new HashMap<>();  
		MemberVO result = (MemberVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".findPwSelectContents");  
		if(!StringUtil.isNullToString(result).equals("")){
			map.put("result", result.getMeId());
		}else{ 
			map.put("result", "");	   
		}    
		return map;
	} 
	  
	@RequestMapping(folderPath + "setNewPwFrm.do")
	public String setNewPwFrm(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		 
		HttpSession session = request.getSession();  
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if(!"".equals(StringUtil.isNullToString(memberVO))){
			model.addAttribute("message", "비정상적인 접근입니다.");
			model.addAttribute("cmmnScript", "/ft/main/main.do"); 
			return "cmmn/execute"; 
		}else{
			return layout + folderPath + "setNewPwFrm";
		} 
	}   
	    
	@RequestMapping(folderPath + "updateNewPw.do")
	public String updateNewPw(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		searchVO.setMePw(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getMePw().getBytes("UTF-8"))));
		cmmnService.updateContents(searchVO, PROGRAM_ID + ".updateNewPw");
		  
		model.addAttribute("message", "새로운 비밀번호가 설정되었습니다.");
		model.addAttribute("cmmnScript", "/ft/member/login/loginFrm.do");
		return "cmmn/execute";
	}  
	

}
