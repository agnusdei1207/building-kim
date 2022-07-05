package com.open.ma.develop.stc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.ibm.icu.text.SimpleDateFormat;
import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.ma.develop.excel.service.ExcelVO;
import com.open.ma.develop.stc.service.StcVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class StcController {

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
	
	@Resource
	private MappingJackson2JsonView ajaxView;
	
	@Autowired 
	ExcelView excelView;
	  
	
    /** Program ID **/
	private final static String PROGRAM_ID = "Stc";

    /** folderPath **/  
    private final static String folderPath = "/ma/develop/stc/";
  
    
    @SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception {
		
    	
    	List<StcVO> yearsList = (List<StcVO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".yearsSelectList" );
		List<ExcelVO> comList = (List<ExcelVO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".comSelectList" );
		List<ExcelVO> areaList = (List<ExcelVO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".areaSelectList" );
		String thisYear = String.valueOf(DateUtils.getThisYear());
		 
		model.addAttribute("thisYear", thisYear);     
		model.addAttribute("yearsList", yearsList);     
		model.addAttribute("comList", comList);   
		model.addAttribute("areaList", areaList);   
  
		
		return ".mLayout:"+ folderPath + "list";
	}    
	
	  
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception {
		   
		System.out.println("클릭했다~~ :  " + searchVO.getPageCnt());
		            
		if(searchVO.getPageCnt() == 0){
			searchVO.setPageCnt(9);
		}
		 
		searchVO.setPageSize(9);   
		searchVO.setPageUnit(searchVO.getPageCnt());
               
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		  
		
		List<ExcelVO> resultList = (List<ExcelVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);   
		
		return folderPath + "addList";
	}    
	  
	/* 통계 그래프 */
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "chart.do") 
	public String chart(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String divn = "";
		if("".equals(StringUtil.nullString(searchVO.getSchEtc01())) || "Y".equals(searchVO.getSchEtc01())){
			divn = "year";
		}else{ 
			divn = "month";  
		}    
		    
		List<ExcelVO> resultList = (List<ExcelVO>) cmmnService.selectList(searchVO, PROGRAM_ID + "." + divn + "SelectList");
		model.addAttribute("resultList", resultList);
		 
		return folderPath + "chart";
	}  
	  
	/* 파입 업로드 모달 Form */   
	@RequestMapping(folderPath + "addFileForm.do")
	public String addFileForm(@ModelAttribute("searchVO") CmmnDefaultVO searchVO) throws Exception {
		
		return folderPath + "addFileForm";
	}
	
	/* 엑셀 업로드 요청 */
	@RequestMapping(folderPath+"saveExcel.json")
	public ModelAndView saveExcel(@ModelAttribute("searchVO") StcVO searchVO, ModelMap model , HttpServletRequest request) throws Exception {
		  
		List<StcVO> list = null;  
		FileVO fileVO = new FileVO();
		 
		String filePath   = "";		// 파일경로
		String atchFileId = "";		// 첨부파일ID
		String fileSn	  = "";		// 첨부파일순번
		String fileEncodingNm 	= "";	// 변환된 파일이름 (ex : ATCH201709190721371290)
    	String fileExtnnNm 		= "";	// 확장자
    	
    	atchFileId = StringUtil.nullString(searchVO.getAtchFileId());
		fileSn	   = "0";
		
		// 첨부파일ID, 순번 셋팅
	    fileVO.setAtchFileId(atchFileId);
	    fileVO.setFileSn(fileSn);
	    // 첨부파일정보 조회
	    FileVO fvo = fileMngService.selectFileInf(fileVO);
	      
	    // 첨부파일이 있다면
	    if(fvo != null){           
	    	  
	    	fileEncodingNm  = fvo.getStreFileNm(); //변환파일명
	    	fileExtnnNm 	= fvo.getFileExtsn();  //파일확장자
	    	
	    	// 파일경로   
	    	filePath = fvo.getFileStreCours() + "/" + fileEncodingNm;
	    	// 확장자 : 엑셀 97-2003  
		    if("xls".equals(fileExtnnNm)){
		    	//model.addAttribute("error", "엑셀파일확장자가 xlsx이 아닙니다.\n엑셀2007 이상 버전을 사용해주세요.");
		    	list = this.xlsReadList(filePath);
		    // 확장자 : 엑셀 2007 이상
		    }else if("xlsx".equals(fileExtnnNm)){
		    	list = this.xlsxReadList(filePath);
		    }else{  
		    	model.addAttribute("error", "확장자가 엑셀파일이 아닙니다.");
		    }  
		    // 엑셀에서 추출한 데이터 DB 저장
		    if(list != null){
		    	   
	    		StcVO inData = new StcVO();
	    		inData.setExcelList(list);     
	    		System.out.println("값 나와라 뚝딱~! : " + inData.getAddress());
	    		       
	    		cmmnService.deleteContents(inData, PROGRAM_ID); // 기존 데이터 삭제
	    		cmmnService.insertContents(inData, PROGRAM_ID +".excelInsertContents");
		    }
		    
	    }else{ 
	    	model.addAttribute("error", "파일이 없습니다.");
	    }
		return new ModelAndView(ajaxView,model);
	}	
	  
	/* 확장자 xls 읽기 */
	@SuppressWarnings({ "resource", "deprecation" })
	public List<StcVO> xlsReadList(String filePath){
		
		List<StcVO> outArray = new ArrayList<>();
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		
		try{
	    	
	    	fis = new FileInputStream(filePath);
	    	workbook = new HSSFWorkbook(fis);
	    	
	    	HSSFSheet curSheet;
	    	HSSFRow	curRow;
	    	HSSFCell curCell;
	    	StcVO outData;
	    	
	    	// sheet 탐색 for문
	    	//for(int sheetIndex=0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++){
	    		
	    	// 현재 sheet 반환 (첫번째시트 : 0)
    		curSheet = workbook.getSheetAt(0);
    		
    		// row 길이
    		int rowLength = curSheet.getPhysicalNumberOfRows();
    		
    		// row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
    		for(int rowIndex=1; rowIndex < rowLength; rowIndex++){
			
				// 현재 row 반환
				curRow = curSheet.getRow(rowIndex);
				outData = new StcVO();
				String value;
				
				// cell 길이 
				int cellLength = 4;
				if(curRow != null){
				// cell(가로데이터) 탐색 for문
				for(int cellIndex = 0; cellIndex <= cellLength; cellIndex++){
					
					curCell = curRow.getCell(cellIndex);
					
					// cell 스타일이 다르더라도 String으로 변환 받음
					if(curCell != null){
						switch (curCell.getCellType()){
						case HSSFCell.CELL_TYPE_FORMULA :
							value = curCell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC :
							if( DateUtil.isCellDateFormatted(curCell)) {
								Date date = curCell.getDateCellValue();
								value = new SimpleDateFormat("yyyyMMdd").format(date);
							}else{
								value = (int)curCell.getNumericCellValue()+"";
							}

							break;
						case HSSFCell.CELL_TYPE_STRING :
							value = curCell.getStringCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_BLANK :
							//value = curCell.getBooleanCellValue()+"";
							value = "";
							break;
						case HSSFCell.CELL_TYPE_ERROR :
							value = curCell.getErrorCellValue()+"";
							break;
						default :   
							value = new String();
							break;
						}
					}else{
						value="";   
					}
					if(cellIndex == 0 ){ outData.setCom(value); }
					if(cellIndex == 1 ){ outData.setArea(value); }
					if(cellIndex == 2 ){ outData.setAddress(value); }
					if(cellIndex == 3 ){ outData.setVisitDate(value); }
				}
				
				outArray.add(outData);
				}
    		}
	    	
	    }catch(FileNotFoundException e){
	    	e.printStackTrace();
	    }catch(IOException e){
	    	e.printStackTrace();
	    }finally{
	    	try{
	    		if(workbook != null) {
	    			workbook = null;
	    		}
	    		if(fis != null){
	    			fis.close();
	    		}
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	}
	    }

		return outArray;
	}
	 
	/* 확장자 xlsx 읽기 */
	@SuppressWarnings({ "resource", "deprecation" })
	public List<StcVO> xlsxReadList(String filePath) throws Exception{
		
		List<StcVO> outArray = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try{
	    	
	    	fis = new FileInputStream(filePath);
	    	workbook = new XSSFWorkbook(fis);
	    	
	    	XSSFSheet curSheet;
	    	XSSFRow	curRow;
	    	XSSFCell curCell;
	    	StcVO outData;
    		// 현재 sheet 반환 (첫번째시트 : 0)
    		curSheet = workbook.getSheetAt(0);
    		
    		// row 길이
    		int rowLength = curSheet.getPhysicalNumberOfRows();

    		// row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
    		for(int rowIndex=1; rowIndex < rowLength; rowIndex++){
			
				// 현재 row 반환
				curRow = curSheet.getRow(rowIndex);
				outData = new StcVO();
				String value;
				
				// cell 길이
				int cellLength = 4;
				if(curRow != null){
				
				// cell(가로데이터) 탐색 for문
				for(int cellIndex = 0; cellIndex <= cellLength; cellIndex++){
					curCell = curRow.getCell(cellIndex);
					// cell 스타일이 다르더라도 String으로 변환 받음
					if(curCell != null){
						switch (curCell.getCellType()){
						case HSSFCell.CELL_TYPE_FORMULA :
							value = curCell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC :
							if( DateUtil.isCellDateFormatted(curCell)) {
								Date date = curCell.getDateCellValue();
								value = new SimpleDateFormat("yyyyMMdd").format(date);
							}else{
								value = (int)curCell.getNumericCellValue()+"";
							}
							break;
						case HSSFCell.CELL_TYPE_STRING :
							value = curCell.getStringCellValue()+"";
							break;
						case HSSFCell.CELL_TYPE_BLANK :
//						value = curCell.getBooleanCellValue()+"";
							value = "";
							break;
						case HSSFCell.CELL_TYPE_ERROR :
							value = curCell.getErrorCellValue()+"";
							break;
						default :
							value = new String();
							break;
						}
					}else{
						value = "";
					}
					if(cellIndex == 1 ){ outData.setCom(value); }
					if(cellIndex == 2 ){ outData.setArea(value); }
					if(cellIndex == 3 ){ outData.setAddress(value); }
					if(cellIndex == 4 ){ outData.setVisitDate(value); }
				}// for
				outArray.add(outData);
				}
    		}
	    	 
	    }catch(FileNotFoundException e){
	    	e.printStackTrace();
	    }catch(IOException e){
	    	e.printStackTrace();
	    }finally{
	    	try{
	    		if(workbook != null) {
	    			workbook = null;
	    		}
	    		if(fis != null){
	    			fis.close();
	    		}
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	}
	    }
		
		return outArray;
	}	
	 
	/* 엑셀 다운 */  
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "excelDown.do")
	public ModelAndView excelDown1(@ModelAttribute("searchVO") StcVO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
		 
		ModelAndView mav = new ModelAndView(excelView);
		String tit = "전자파 민원 통계";
		String url = "/stc.xlsx"; 
		 
		List<StcVO> resultList =  (List<StcVO>) cmmnService.selectList(searchVO, PROGRAM_ID);;
		  
		mav.addObject("target", tit);
		mav.addObject("source", url);
		if(resultList.size() > 0){
			mav.addObject("result", resultList);
		}
		return mav;
	}
}
