package com.open.ft.member.join;

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
public class JoinController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
    private final static String PROGRAM_ID = "Member";
    
    private final static String folderPath = "/ft/member/join/";
     
    private String message = "";
    
    private String cmmnScript = ""; 
    
    
	@RequestMapping(folderPath + "joinFrm.do")
	public String joinFrm(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		 
		System.out.println("pass : "+ pass);
		if("YES".equals(pass)){
			return ".fLayout:" + folderPath + "joinFrm";
		}else{
			message = "비정상적인 접근입니다.";
			cmmnScript = folderPath + "agreeFrm.do";
		}
		      
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript); 
		return "cmmn/execute";  
	}   
                          
   
	@RequestMapping(folderPath + "agreeFrm.do")
	public String agreeFrm(@ModelAttribute("searchVO") MemberVO searchVO) throws Exception {
		
		return ".fLayout:" + folderPath + "agreeFrm";
	}   
	 
	  
	@ResponseBody
	@RequestMapping(folderPath + "duplicateId.do")
	public Map duplicateId(@ModelAttribute("searchVO") MemberVO searchVO, Model model, String pass, HttpServletRequest request) throws Exception {
		
		Map<String, Boolean> map = new HashMap<>();  
		int result = (Integer)cmmnService.selectCount(searchVO, PROGRAM_ID + ".duplicateId");  
		if(result > 0){
			map.put("result", true);
		}else{
			map.put("result", false);
		}
		
		return map;
	}  
	  
	@RequestMapping(folderPath + "insertProc.do")
	public String insertProc(@ModelAttribute("searchVO") MemberVO searchVO, Model model) throws Exception {
		
		if(!StringUtil.isNullToString(searchVO).equals("")){
			searchVO.setMePw(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getMePw().getBytes("UTF-8"))));
			cmmnService.insertContents(searchVO, PROGRAM_ID);   
			message = "회원가입이 완료되었습니다.";
			cmmnScript = "/ft/member/login/loginFrm.do";
		}else{  
			message = "회원정보가 잘못 입력되었습니다.";       
			cmmnScript = "/ft/main/main.do";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript); 
		return "cmmn/execute"; 
	}  
	
	

}
