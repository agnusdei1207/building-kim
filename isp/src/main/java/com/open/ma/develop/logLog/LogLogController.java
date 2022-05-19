package com.open.ma.develop.logLog;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.ddf.EscherColorRef.SysIndexProcedure;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
import com.open.ma.develop.logLog.service.LogLogVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller 
public class LogLogController {

	@Resource(name = "cmmnService")      
    protected CmmnService cmmnService;
	
    private final static String PROGRAM_ID = "LogLog"; 

    private final static String folderPath = "/ma/develop/logLog/";
        
	Logger log = Logger.getLogger(this.getClass());  

	@RequestMapping(folderPath + "list.do") 
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
         
		String time = DateUtils.getCurrentDate("yyyy.MM.dd");
		searchVO.setSearchStartDate(time);
		searchVO.setSearchEndDate(time);
		
		
		return ".mLayout:"+ folderPath + "list";
	}    
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String gooboon = searchVO.getSchEtc03();
		
		searchVO.setPageUnit(3);
		searchVO.setPageSize(4);      
		  
		PaginationInfo paginationInfo = new PaginationInfo();  
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		 
		if("".equals(gooboon) || "1".equals(gooboon)){
		
			int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
	
			List<LogLogVO> resultList = (List<LogLogVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
			model.addAttribute("resultList", resultList);
			
		}else if("2".equals(gooboon)){ 
			
			int totCnt = cmmnService.selectCount(searchVO, "LoginLog");
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			List<LogLogVO> resultList = (List<LogLogVO>) cmmnService.selectList(searchVO, "LoginLog" );
			model.addAttribute("resultList", resultList);
			 
		}else if("3".equals(gooboon)){  
			
			int totCnt = cmmnService.selectCount(searchVO, "LogLog");
			paginationInfo.setTotalRecordCount(totCnt); 
			model.addAttribute("paginationInfo", paginationInfo);
			List<LogLogVO> resultList = (List<LogLogVO>) cmmnService.selectList(searchVO, "LogLog" );
			model.addAttribute("resultList", resultList);
			    
		}else if("4".equals(gooboon)){
			
			int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".selectStrangeCount" );
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
	
			List<LogLogVO> resultList = (List<LogLogVO>) cmmnService.selectList(searchVO, PROGRAM_ID +".selectStrangeList" );
			model.addAttribute("resultList", resultList);
		}
		 
		return folderPath + "addList";
	}
	   
	@RequestMapping(folderPath + "resetFailCnt.do") 
	public String resetFailCnt(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
          
		String [] array = searchVO.getCol1().split("//");
		for(int i = 1; i < array.length; i++){   
			searchVO.setCol2(array[i].split("_")[1]);
			if("ma".equals(array[i].split("_")[0])){ 
				cmmnService.updateContents(searchVO, PROGRAM_ID +".maResetFailCnt");
			}else{
				cmmnService.updateContents(searchVO, PROGRAM_ID +".ftResetFailCnt");
			}
		}     
		  
		model.addAttribute("cmmnScript", "list.do");
		model.addAttribute("message", "초기화 완료");
		return "cmmn/execute";
	}    
		

}
