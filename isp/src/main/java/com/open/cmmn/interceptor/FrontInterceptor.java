package com.open.cmmn.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ft.member.join.service.MemberVO;
import com.open.ma.develop.ipLog.service.IpLogVO;
import com.open.ma.develop.logLog.service.LogLogVO;
import com.open.ma.kim.ceo.service.CeoVO;
import com.open.ma.sys.mn.service.MnVO;
public class FrontInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {

	private static final Logger LOGGER = LogManager.getLogger(FrontInterceptor.class.getName());

	private static long loadingTime = 0;

	@Autowired
	private CmmnService cmmnService; 
  
	@Override
	@SuppressWarnings("unchecked")
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler) throws Exception {
		
		String clientIp = StringUtil.getClientIp(request);
		String currentUrl = request.getRequestURI();
		CmmnDefaultVO cmmnDefaultVO = new  CmmnDefaultVO();
		LogLogVO logLogVO = new LogLogVO();
		
		// IP 차단
		int chkIp = (Integer)cmmnService.selectContents(clientIp, "IpLog.selectIp");
		if(chkIp > 0){ 
			logLogVO.setLogClientIp(clientIp);
			logLogVO.setLogIpErrYn("Y");
			cmmnService.insertContents(logLogVO, "LogLog");
			response.sendRedirect("/banIp.do");
			return false;  
		} 
		    
		   
		
		List<MnVO> allMenu = (List<MnVO>)cmmnService.selectList(cmmnDefaultVO, "Mn.selectMainList");
		for (MnVO mnVO : allMenu) {
			List<MnVO> subList = (List<MnVO>)cmmnService.selectList(mnVO, "Mn.selectSubList");
			mnVO.setMenuList(subList);
		}
		  
		HttpSession session = request.getSession();   
		session.setAttribute("allMenu", allMenu); 
		             
		CeoVO ceoVO = new CeoVO();    
		ceoVO = (CeoVO) cmmnService.selectContents(cmmnDefaultVO, "Ceo");
		if(!"".equals(StringUtil.nullString(ceoVO.getCeName()))){
			session.setAttribute("ceoVO", ceoVO);  
		} 
		 
		  
		// 로그 기록  
		logLogVO.setLogClientIp(clientIp);
		logLogVO.setLogUrl(currentUrl);
		logLogVO.setLogDivn("ft");
		 
		System.out.println("사용자 로그인 확인 : "+SessionUtil.isFrtLogined(request));
		if (SessionUtil.isFrtLogined(request)){
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			logLogVO.setLogId(memberVO.getMeId());
			System.out.println("아이디 확인 : "+ memberVO.getMeId());
		}  
		       
		String menuCd = ""; 
		menuCd = currentUrl.split("/")[3];
		logLogVO.setLogMenuCd(menuCd);
		logLogVO.setLogIpErrYn("N");     
		   
		// 로그 찍기
		if(request.getRequestURI().indexOf("addList") < 0){
			cmmnService.insertContents(logLogVO, "LogLog");
		}
		 
		return true;
	}

	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final Exception ex) throws Exception {
		long endTime = System.currentTimeMillis();
		LOGGER.debug("=================================== Loading Report afterHandle ::: " + (endTime - loadingTime));
		LOGGER.debug("=================================== request URI ::: " + request.getRequestURI());
	}
}