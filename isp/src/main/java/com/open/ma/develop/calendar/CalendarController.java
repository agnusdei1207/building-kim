package com.open.ma.develop.calendar;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
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
		    
		List<CalendarVO> resultList = (List<CalendarVO>)cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		  
		return ".mLayout:" + folderPath + "list"; 
	}        
    
    @RequestMapping(folderPath+"form.do") 
    public String form(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
    	
    	int caCnt = (Integer)cmmnService.selectCount(searchVO, PROGRAM_ID);
    	model.addAttribute("caCnt", caCnt);
    	 
    	return ".mLayout:" + folderPath + "form";
    }     
          
    @SuppressWarnings("unchecked")  
    @RequestMapping(folderPath+"addView.do") 
    public String addView(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
    	
    	List<CalendarVO> resultList = (List<CalendarVO>)cmmnService.selectList(searchVO, PROGRAM_ID + ".selectContentsList");
    	if(resultList.size() > 0){ 
    		model.addAttribute("resultList", resultList); 
    	}   
    	 
    	return folderPath + "addView";
    }      
    
    
    @ResponseBody
    @RequestMapping(folderPath+"{procType}Proc.do")
    public HashMap<String,Object> procContents(@ModelAttribute("searchVO") CalendarVO searchVO, ModelMap model, @PathVariable String procType) throws Exception{
    	
    	HashMap<String,Object> returnMap = new HashMap<>();
    	
    	System.out.println("procType = " + procType); 
    	System.out.println("searchVO = " + searchVO.getCaSeq());
    	       
    	if("insert".equals(procType)){      
			cmmnService.insertContents(searchVO, PROGRAM_ID);
		}else if("update".equals(procType)){
			cmmnService.updateContents(searchVO, PROGRAM_ID); 
    	}else if("delete".equals(procType)){ 
    		cmmnService.deleteContents(searchVO, PROGRAM_ID);
    	}
    	
    	returnMap.put("result","success");
    	
		return returnMap;
    }         
    
}
