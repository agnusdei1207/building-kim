package com.open.ma.develop.calendar;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.develop.calendar.service.CalendarVO;
 

@Controller   
public class CalendarController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService; 
	
	 /** Program ID **/
    private final static String PROGRAM_ID = "Calendar";

    /** folderPath **/
    private final static String folderPath = "/ma/develop/calendar/";
     
    private String message = ""; 

    @SuppressWarnings("unchecked") 
    @RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CalendarVO searchVO, Model model, HttpServletRequest request) throws IOException, InvocationTargetException, SQLException, Exception {
		   
    	// 현재 날짜 조회 
		if(StringUtil.nullString(searchVO.getCaSelectedYear()).equals("") || StringUtil.nullString(searchVO.getCaSchYearMonth()).equals("")){
			String nowDate = DateUtils.getNowDate("yyyyMM");
			searchVO.setCaSelectedYear(nowDate.substring(0,4));     
			searchVO.setCaSelectedMonth(nowDate.substring(4)); 
			searchVO.setCaSchYearMonth(nowDate); 
		}  
		    
		List<CalendarVO> resultList=(List<CalendarVO>)cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		 
		return ".mLayout:"+folderPath+"list"; 
	}        
    
    @RequestMapping(folderPath+"form.do") 
    public String form(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
    	 
		List<CalendarVO> resultList=(List<CalendarVO>)cmmnService.selectList(searchVO, PROGRAM_ID + ".selectContentsList");
    	if(!"".equals(StringUtil.isNullToString(resultList))){
    		model.addAttribute("resultList", resultList);
    	}
    	    
    	int cnt = (Integer)cmmnService.selectCount(searchVO, PROGRAM_ID);
    	if(cnt > 0){
    		model.addAttribute("cnt", cnt);
    	}
    	 
    	return ".mLayout:"+folderPath+"form";
    }
    
    
    @RequestMapping(folderPath+"{procType}Proc.do")
    public String proc(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String procType, SessionStatus status) throws Exception{
    	 
    		 
    	if(procType.equals("update")){ 
    		cmmnService.updateContents(searchVO, PROGRAM_ID);
    	}else if(procType.equals("insert")){
    		cmmnService.insertContents(searchVO, PROGRAM_ID);
    	}else if(procType.equals("delete")){
			cmmnService.deleteContents(searchVO, PROGRAM_ID);
    	} 
    	status.setComplete();  
    	if(procType.equals("update")){ 
    		message = "수정되었습니다.";
    	}else if(procType.equals("insert")){
    		message = "등록되었습니다."; 
    	}else if(procType.equals("delete")){
    		message = "삭제되었습니다.";
    	}
    	         
    	model.addAttribute("message", message); 
    	model.addAttribute("pValue", searchVO.getCaDataDate());
    	model.addAttribute("pName", "caDataDate");
    	model.addAttribute("cmmnScript", "form.do");
    	return "cmmn/execute";
    	  
    }  
                       
 
    
}
