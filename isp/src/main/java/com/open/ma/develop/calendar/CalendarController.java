package com.open.ma.develop.calendar;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
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
    
	Logger log = Logger.getLogger(this.getClass());
	

    @SuppressWarnings("unchecked") 
    @RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CalendarVO searchVO, Model model,
			HttpServletRequest request) throws IOException, InvocationTargetException, SQLException, Exception {
		
		String nowDate = DateUtils.getNowDate("yyyyMM");
		System.out.println("현재 날짜 : "+ nowDate);
		 
		List<CalendarVO> resultList=(List<CalendarVO>)cmmnService.selectList(searchVO, PROGRAM_ID+".calSelectList");
		model.addAttribute("resultList", resultList);
		
		return ".mLayout:"+folderPath+"list";
	}      
    
    @RequestMapping(value=folderPath+"{procType}proc.do")
    public String proc(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, HttpServletRequest request, 
    		@PathVariable String procType, SessionStatus status) throws Exception{
    	
    		 
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
    	model.addAttribute("pValue", searchVO.getCaSeq());
    	model.addAttribute("pName", "dataDate");
    	model.addAttribute("cmmnScript", "form.do");
    	return "cmmn/execute";
    	
    } 
       
    @RequestMapping(folderPath+"form.do")
    public String form(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
    	
    	CalendarVO calendarVO = new CalendarVO();
    	calendarVO =(CalendarVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
    	if(calendarVO !=null){
    		
    	}    	 
    	model.addAttribute("calendarVO", calendarVO);
    	
    	return ".mLayout:"+folderPath+"form";
    }
    
}
