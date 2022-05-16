package com.open.ma.login;

import java.net.URLDecoder;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.develop.loginLog.service.LoginLogVO;
import com.open.ma.login.service.LoginVO;
import com.open.ma.sys.mn.service.MnVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class LoginController {
	
	/**
	 * globalProperties.
	 */
	@Resource(name = "globalProperties")
	private Properties globalProperties;
	
	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;
	
	/**
	 * MappingJackson2JsonView.
	 */  
	@Resource
	private MappingJackson2JsonView ajaxView;
	
    /** Program ID **/ 
    private final static String PROGRAM_ID = "Login";

	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/login.do")
	public String maLogin(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		LoginVO loginVO = new LoginVO();
		String returnUrl = StringUtil.nullString(request.getParameter("returnUrl"));	
		loginVO.setReturnUrl(URLDecoder.decode(returnUrl, "UTF-8"));	
		model.addAttribute("loginVO", loginVO);
		     
		return  "/ma/login/login"; 
	}
	
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("loginVO") LoginVO loginVO	, HttpServletRequest request, ModelMap model) throws Exception {
		
		String clientIp = StringUtil.getClientIp(request);
		
		if(loginVO.getId() != null && loginVO.getPwd() != null && !"".equals(loginVO.getId()) && !"".equals(loginVO.getPwd())){
			loginVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(loginVO.getPwd().getBytes("UTF-8"))));
			
			LoginVO userLoginVO  = (LoginVO)cmmnService.selectContents(loginVO, PROGRAM_ID);
			LoginVO checkFailCnt  = (LoginVO)cmmnService.selectContents(loginVO, PROGRAM_ID + ".selectWithId");
			
	    	if(userLoginVO == null || userLoginVO.getId() == null || "".equals(userLoginVO.getId())){
	    		if(checkFailCnt != null && checkFailCnt.getId() != null && checkFailCnt.getId() != ""){ 
	    			cmmnService.updateContents(checkFailCnt, PROGRAM_ID+".updateFailCnt");
	    			if(Integer.parseInt(checkFailCnt.getFailCnt()) > 5){ 
	    				model.addAttribute("message", "비밀번호 입력횟수가 초과되었습니다. 관리자에게 문의하세요."); 
	    				return  "/ma/login/login";
	    			}
	    		}
	    		
	    		model.addAttribute("message", "아이디 또는 패스워드를 확인하시기 바랍니다.");
	    		return  "/ma/login/login";   
	    	}else{ 
	    		 	/** 세션 정보 입력 */
	    		if(Integer.parseInt(userLoginVO.getFailCnt()) > 5){ 
    				model.addAttribute("message", "비밀번호 입력횟수가 초과되었습니다. 관리자에게 문의하세요."); 
    				return  "/ma/login/login";
    			}
	    			cmmnService.updateContents(checkFailCnt, PROGRAM_ID+".resetFailCnt");
 
					HttpSession session = request.getSession();					
					session.setAttribute(SessionUtil.SESSION_MANAGE_KEY, userLoginVO);
					
					session.setAttribute("loginMgrId", userLoginVO.getId());		 //사용자 아이디
					session.setAttribute("loginMgrNm", userLoginVO.getName());	//사용자 이름
					session.setAttribute("loginMgrSeq", userLoginVO.getSeq());	//사용자 일련번호
					session.setAttribute("loginMgrAuthCode", userLoginVO.getAuthCode()); //권한
					session.setAttribute("loginMgrAuthCodeNm", userLoginVO.getAuthCodeNm()); //권한명
					session.setAttribute("loginMgrSiteClcd", userLoginVO.getSiteClcd()); //사이트구분
					
					/* 로그인 로그 */ 
					LoginLogVO loginLogVO = new LoginLogVO(); 
					loginLogVO.setLogId(userLoginVO.getId());
					loginLogVO.setLogClientIp(clientIp);
					loginLogVO.setLogDivn("ma");
					cmmnService.insertContents(loginLogVO, "LoginLog");
					 
					MnVO auth = new MnVO();
    				auth.setLvl("2");
    				auth.setMenuCl("ma");
    				auth.setSchEtc03("LAYOUT");
    				auth.setAuthCode(userLoginVO.getAuthCode());
    				List<String> authList = (List<String>) cmmnService.selectList(auth, "Mn.menuAuthSelectList");;
    				auth.setLvl("3");
    				List<String> authList2 = (List<String>) cmmnService.selectList(auth, "Mn.menuAuthSelectList");
					
					
					/* 1차메뉴 목록 */
					MnVO menuVO = new MnVO();
					menuVO.setLvl("1");
					menuVO.setMenuCl("ma");
					menuVO.setSchEtc03("LAYOUT");
					
					menuVO.setAuthCode(userLoginVO.getAuthCode());
					List<MnVO> menuList = (List<MnVO>) cmmnService.selectList(menuVO, "Mn.menuSelectList");
					menuVO.setMenuList(menuList);
					for (MnVO menuVO2 : menuVO.getMenuList()) {
						menuVO2.setLvl("2");
						menuVO2.setMenuCl("ma");
						menuVO2.setSchEtc03("LAYOUT");
						menuVO2.setAuthCode(userLoginVO.getAuthCode());
						List<MnVO> manu2List = (List<MnVO>) cmmnService.selectList(menuVO2, "Mn.menuSelectList");
						menuVO2.setMenuList(manu2List);
						
						for (MnVO menuVO3 : manu2List) {
							menuVO3.setLvl("3");
							menuVO3.setMenuCl("ma");
							menuVO3.setSchEtc03("LAYOUT");
							menuVO3.setAuthCode(userLoginVO.getAuthCode());
							List<MnVO> manu3List = (List<MnVO>) cmmnService.selectList(menuVO3, "Mn.menuSelectList");
							menuVO3.setMenuList(manu3List);
							menuVO2.setMenuvo(menuVO3);
						}
						
						menuVO.setMenuvo(menuVO2);
					}
					/** 세션 정보 입력 */
					session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_KEY, menuVO.getMenuList());//메뉴목록
					session.setAttribute("mgrMenu", menuVO.getMenuList());	//메뉴목록
    				session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_AUTH_KEY, authList);//메뉴권한2차
    				session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_AUTH_KEY2, authList2);//메뉴권한3차
					session.setMaxInactiveInterval(Integer.parseInt(globalProperties.getProperty("Globals.sessionTime")));	
					
			        if (loginVO.getReturnUrl() == null || loginVO.getReturnUrl().equals("")) {	
			        	
			        	
			        	
		        		return "redirect:/ma/sys/mn/list.do";
			        } else { 
						String returnUrl = URLDecoder.decode(loginVO.getReturnUrl(), "UTF-8");
						returnUrl = returnUrl.replaceAll("&amp;", "&");
						returnUrl = returnUrl.replaceAll("amp;", "");
						return "redirect:" + returnUrl;
			        } 
		    }    	
		}else{
			model.addAttribute("message", "로그인정보가 넘어오지 않았습니다.");
			model.addAttribute("cmmnScript", "login");
			return "cmmn/execute";
		}
	}


	 
	
	@RequestMapping(value = "/logout.do")
	public String adminLogout(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		HttpSession session = request.getSession();
		session.removeAttribute("loginMgrId");
		session.removeAttribute("loginMgrNm");
		session.removeAttribute("loginMgrSeq");
		session.removeAttribute("loginMgrAuthCode");
		session.removeAttribute("loginMgrAuthCodeNm");
		session.removeAttribute("loginMgrSiteClcd");
		 
		
		return "/ma/login/login";
	}	
	
	
	@RequestMapping(value = "/cmmn/fail.do")
	public String fail(@ModelAttribute("searchVO") CmmnDefaultVO searchVO ,ModelMap model) throws Exception {
		
		model.addAttribute("message", "비정상적인 접근입니다.");
		model.addAttribute("cmmnScript", "/logout.do");
		
		return "cmmn/execute";
	}	
	

}
