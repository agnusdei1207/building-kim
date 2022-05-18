package com.open.ma.develop.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import org.apache.poi.xssf.usermodel.XSSFPictureData;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.ibm.icu.text.SimpleDateFormat;
import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.ma.develop.excel.service.ExcelVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller  
public class ExcelController {

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
	
	@Resource(name = "fileUploadProperties")
	private Properties fileUploadProperties;
	
	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService idgenService;
	 
	@Resource
	private MappingJackson2JsonView ajaxView;
	
	
    /** Program ID **/ 
    private final static String PROGRAM_ID = "Excel";

    /** folderPath **/
    private final static String folderPath = "/ma/develop/excel/";
    
    private String message = "";

    private String cmmnScript = "";
    
    private String pName = "";
    
    private String pValue = "";
    
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mLayout:"+ folderPath + "list";
	}
	
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		 
		searchVO.setPageUnit(6);
		searchVO.setPageSize(7);

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
		  
		@SuppressWarnings("unchecked") 
		List<ExcelVO> resultList = (List<ExcelVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}


	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") ExcelVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		ExcelVO excelVO = new ExcelVO();
		excelVO = (ExcelVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("excelVO", excelVO);
		
		return ".mLayout:"+ folderPath + "view";
	}

	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") ExcelVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		ExcelVO excelVO = new ExcelVO();
		if (procType.equals("update")) {
			excelVO = (ExcelVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("excelVO", excelVO);

		return ".mLayout:"+ folderPath + "form";
	}
   
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") ExcelVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		if(procType != null){
			if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				message = "수정되었습니다.";
				cmmnScript = "view.do"; 
				pName = "xlSeq"; 
				pValue = searchVO.getXlSeq();
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				message = "삭제되었습니다.";
				cmmnScript = "list.do";
			} else if (procType.equals("insert")) {				
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				message = "등록되었습니다.";
				cmmnScript = "list.do";
			} 
		}
		
		model.addAttribute("pName", pName);
		model.addAttribute("pValue", pValue);
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";

	}

	  
	 @ResponseBody
	 @RequestMapping(folderPath+"saveExcel.json")
	    public ModelAndView COUNTRY_01_excelProc(@ModelAttribute("searchVO") ExcelVO searchVO, ModelMap model , HttpServletRequest request) throws Exception {
		  
	    List<ExcelVO> list = null;
	    FileVO fileVO = new FileVO(); 

	    int total = 0;// 총건수 
        int cnt   = 0;// 성공건수 
        int fail  = 0;// 실패건수 
          
	    String filePath   = "";// 파일경로
	    String atchFileId = "";// 첨부파일ID
	    String fileSn  = "";// 첨부파일순번
	    String fileEncodingNm = "";// 변환된 파일이름 (ex : ATCH201709190721371290)
        String fileExtnnNm = "";// 확장자
	          
        atchFileId = StringUtil.nullString(searchVO.getAtchFileId());
	    fileSn   = "0";
	    	  
	    	// 첨부파일ID, 순번 셋팅
	        fileVO.setAtchFileId(atchFileId);
	        fileVO.setFileSn(fileSn);
	        // 첨부파일정보 조회
	        FileVO fvo = fileMngService.selectFileInf(fileVO);
	        
	        // 첨부파일이 있다면 
	        if(fvo != null){
	        	
		        fileEncodingNm  = fvo.getStreFileNm(); //변환파일명
		        fileExtnnNm = fvo.getFileExtsn();  //파일확장자
		        
		        // 파일경로
		        filePath = fvo.getFileStreCours() + "/" + fileEncodingNm;
		        // 확장자 : 엑셀97-2003 버전
		        if("xls".equals(fileExtnnNm)){
			        model.addAttribute("error", "엑셀파일확장자가 xlsx이 아닙니다.\n엑셀2007 이상 버전을 사용해주세요.");
			        // 확장자 : 엑셀2007 이상 버전  
		        }else if("xlsx".equals(fileExtnnNm)){
		        	list = this.xlsxReadList(filePath);
		        }else{
		        	model.addAttribute("error", "확장자가 엑셀파일이 아닙니다.");
		        }
	         
		        // 엑셀에서 추출한 데이터 DB 저장
		        if(list != null){
			        total = list.size();// 총건수
			        cnt   = 0;// 성공건수
			        fail  = 0;// 실패건수
			        
			        ExcelVO inData = new ExcelVO();
			        inData.setExcelList(list);
			        try{
			        	cmmnService.insertContents(inData, PROGRAM_ID+".excelInsertContents");
			        	cnt++;
			        }catch(FileNotFoundException fe){
			        	fail++;
			        	fe.printStackTrace();
			        }
		        }
	        
	        }else{
	        	model.addAttribute("error", "파일이 없습니다.");
	        }
	        
	        model.addAttribute("total", total);
	        model.addAttribute("cnt", cnt);
	        model.addAttribute("fail", fail);
	        
	    return new ModelAndView(ajaxView,model);
	    }
 

	    public String getFolderPath() {
	    Calendar calVal = Calendar.getInstance();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
	    String today = dateFormat.format(calVal.getTime());

	    StringBuffer datePath = new StringBuffer();
	    datePath.append(File.separator).append(today.substring(0, 4)).append(File.separator).append(today.substring(4, 6)).append(File.separator)
	    .append(today.substring(6, 8)).append(File.separator).append(today.substring(8, 10));

	    return datePath.toString();
	    }

	 

	@SuppressWarnings({ "resource", "deprecation" })
	    public List<ExcelVO> xlsxReadList(String filePath) throws Exception{

	    List<ExcelVO> outArray = new ArrayList<>();
	    FileInputStream fis = null;
	    XSSFWorkbook workbook = null;

	    try{
	        
	        fis = new FileInputStream(filePath);
	        workbook = new XSSFWorkbook(fis);
	        
	        XSSFSheet curSheet;
	        XSSFRow curRow;
	        XSSFCell curCell;
	        ExcelVO outData;
	        String tarDir = "c:\\test";
	        // 현재 sheet 반환 (첫번째시트 : 0)
	        curSheet = workbook.getSheetAt(0);
	        
	        // row 길이
	        int rowLength = curSheet.getPhysicalNumberOfRows();

	        // row(세로데이터) 탐색 for문 (row 0은 헤더정보이기 때문에 1부터 시작)
	        for(int rowIndex=1; rowIndex < rowLength; rowIndex++){

	    // 현재 row 반환
	    curRow = curSheet.getRow(rowIndex);
	    outData = new ExcelVO();
	    String value;

	    // cell 길이
	    int cellLength = curRow.getPhysicalNumberOfCells();

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
	    value = (int)curCell.getNumericCellValue()+"";
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
	    value = ""; 
	    }
	    if(cellIndex ==  0){  outData.setXlRcpNum(value);}            
	    if(cellIndex ==  1){  outData.setXlSeq(value);}               
	    if(cellIndex ==  2){  outData.setXlLcnsNum(value);}           
	    if(cellIndex ==  3){  outData.setXlWatSum(value);}            
	    if(cellIndex ==  4){  outData.setXlFromMhz(value);}           
	    if(cellIndex ==  5){  outData.setXlToMhz(value);}             
	    if(cellIndex ==  6){  outData.setXlAddrsNum(value);}          
	    if(cellIndex ==  7){  outData.setXlAddrs1(value);}            
	    if(cellIndex ==  8){  outData.setXlAddrs2(value);}            
	    if(cellIndex ==  9){  outData.setXlAddrsGooboon(value);}      
	    if(cellIndex == 10){  outData.setXlMeasMeth(value);}          
	    if(cellIndex == 11){  outData.setXlMsrUnt(value);}            
	    if(cellIndex == 12){  outData.setXlEmIntStd(value);}          
	    if(cellIndex == 13){  outData.setXlMsrVl(value);}           
	    if(cellIndex == 14){  outData.setXlExpIdx(value);}            
	    if(cellIndex == 15){  outData.setXlRadioStnm(value);}         
	    if(cellIndex == 16){  outData.setXlCallName(value);}          
	    if(cellIndex == 17){  outData.setXlLatAng(value);}            
	    if(cellIndex == 18){  outData.setXlLatMin(value);}            
	    if(cellIndex == 19){  outData.setXlLatSec(value);}            
	    if(cellIndex == 20){  outData.setXlLngtdAng(value);}          
	    if(cellIndex == 21){  outData.setXlLngtdMin(value);}          
	    if(cellIndex == 22){  outData.setXlLngtdSec(value);}          
	    if(cellIndex == 23){  outData.setXlAntTyp(value);}            
	    if(cellIndex == 24){  outData.setXlAntTypName(value);}        
	    if(cellIndex == 25){  outData.setXlAntnDeuk(value);}          
	    if(cellIndex == 26){  outData.setXlAntnHght(value);}          
	    if(cellIndex == 27){  outData.setXlGrndClrnc(value);}         
	    if(cellIndex == 28){  outData.setXlAntBeamCnt(value);}        
	    if(cellIndex == 29){  outData.setXlAntBeamFrm(value);}        
	    if(cellIndex == 30){  outData.setXlEqvlnIsrdp(value);}        
	    if(cellIndex == 31){  outData.setXlCtrFreq(value);}           
	    if(cellIndex == 32){  outData.setXlBandwidth(value);}         
	    if(cellIndex == 33){  outData.setXlRefSigMeasFreq(value);}    
	    if(cellIndex == 34){  outData.setXlAntTildedAng(value);}      
	    if(cellIndex == 35){  outData.setXlMaxVrtBeamAng(value);}     
	    if(cellIndex == 36){  outData.setXlMxmHrzBmAng(value);}       
	    if(cellIndex == 37){  outData.setXlRgsSgnGrpCyc(value);}      
	    if(cellIndex == 38){  outData.setXlNbrSlotFormats(value);}    
	    if(cellIndex == 39){  outData.setXlNbrFreqRcBlocks(value);}   
	    if(cellIndex == 40){  outData.setXlNbrAuxCaWaves(value);}     
	    if(cellIndex == 41){  outData.setXlNmbUpwGrdSym(value);}      
	    if(cellIndex == 42){  outData.setXlSglSlotSymCnt(value);}     
	    if(cellIndex == 43){  outData.setXlSlotFmtInfo(value);}       
	    if(cellIndex == 44){  outData.setXlCalcSBoundary(value);}     
	    if(cellIndex == 45){  outData.setXlDstWrlessSta(value);}      
	    if(cellIndex == 46){  outData.setXlMsrnPnt(value);}           
	    if(cellIndex == 47){  outData.setXlNotes(value);}           
	    if(cellIndex == 48){  outData.setXlMsrmDate(value);}          
	    if(cellIndex == 49){  outData.setXlMsrmFromTime(value);}      
	    if(cellIndex == 50){  outData.setXlMsrmToTime(value);}     
	    if(cellIndex == 51){  outData.setXlTemperature(value);}     
	    if(cellIndex == 52){  outData.setXlHumidity(value);}     
	    if(cellIndex == 53){  outData.setXlWeather(value);}     
	    if(cellIndex == 54){  outData.setXlProvModelName(value);}     
	    if(cellIndex == 55){  outData.setXlProvSrlNmbr(value);}     
	    if(cellIndex == 56){  outData.setXlProvMnfct(value);}     		
	    if(cellIndex == 57){  outData.setXlProvFromFrqncBand(value);}         
	    if(cellIndex == 58){  outData.setXlProvToFrqncBand(value);}         
	    if(cellIndex == 59){  outData.setXlProvClbrtDate(value);}         
	    if(cellIndex == 60){  outData.setXlRcvrModelName(value);}         
	    if(cellIndex == 61){  outData.setXlRcvrSrlNmbr(value);}         
	    if(cellIndex == 62){  outData.setXlRcvrMnfct(value);}         
	    if(cellIndex == 63){  outData.setXlRcvrFromFrqncBand(value);}         
	    if(cellIndex == 64){  outData.setXlRcvrToFrqncBand(value);}         
	    if(cellIndex == 65){  outData.setXlRcvrClbrtDate(value);}         
	    if(cellIndex == 66){  outData.setXlMeasureVal1(value);}         
	    if(cellIndex == 67){  outData.setXlMeasureVal2(value);}         
	    if(cellIndex == 68){  outData.setXlMeasureVal3(value);}         
	    if(cellIndex == 69){  outData.setXlCalcVal1(value);}         
	    if(cellIndex == 70){  outData.setXlCalcVal2(value);}         
	    if(cellIndex == 71){  outData.setXlCalcVal3(value);}         
	    if(cellIndex == 72){  outData.setXlAvrgMstmMin(value);}         
	    if(cellIndex == 73){  outData.setXlRwrdCfcnt(value);}         
	    if(cellIndex == 74){  outData.setXlCmpCfcDueTrf(value);}         
	    if(cellIndex == 75){  outData.setXlMeasMax(value);}         
	    if(cellIndex == 76){  outData.setXlCalcMax(value);}         
	    if(cellIndex == 77){  outData.setXlFromElctrInrfv(value);}         
	    if(cellIndex == 78){  outData.setXlToElctrInrfv(value);}         
	    if(cellIndex == 79){  outData.setXlRfrncFrqnc(value);}         
	    if(cellIndex == 80){  outData.setXlPwrmsCnvrs(value);}         
	    if(cellIndex == 81){  outData.setXlDatePrprt(value);}         
	    if(cellIndex == 82){  outData.setXlNmmsInstt(value);}         
	    if(cellIndex == 83){  outData.setXlMsrnInstAdrs(value);}         
	    if(cellIndex == 84){  outData.setXlMeasurersHumanName(value);}         
	    if(cellIndex == 85){  outData.setXlWriter(value);}         
	    if(cellIndex == 86){  outData.setXlSystemLoss(value);}         
	    if(cellIndex == 87){  outData.setXlMsrngIntrv(value);}         
	    if(cellIndex == 88){  outData.setXlNbrMeasPts(value);}         
	    if(cellIndex == 89){  outData.setXlNmbrCps(value);}         
	    if(cellIndex == 90){  outData.setXlMltplRdexn(value);}         
	    if(cellIndex == 91){  outData.setXlMobileCrrrArea(value);}         
	      
	    if(cellIndex == 92){  
	        String atchFileId = imageUp(curSheet,rowIndex,cellIndex);
	        System.out.println("첨부파일 찍기 : "+ atchFileId);  
	        if(!StringUtil.nullConvert(atchFileId).equals("")){
	            outData.setXlAtchFileId(atchFileId); 
	        }
	    }                                                                   //첫번째 첨부파일
	    if(cellIndex == 93){  
	    	String atchFileId = imageUp(curSheet,rowIndex,cellIndex);
	    	System.out.println("첨부파일 찍기 : "+ atchFileId);  
	    	if(!StringUtil.nullConvert(atchFileId).equals("")){
	    		outData.setXlAtchFileId(atchFileId); 
	    	}
	    }                                                             
	    if(cellIndex == 94){  
	    	String atchFileId = imageUp(curSheet,rowIndex,cellIndex);
	    	System.out.println("첨부파일 찍기 : "+ atchFileId);  
	    	if(!StringUtil.nullConvert(atchFileId).equals("")){
	    		outData.setXlAtchFileId(atchFileId); 
	    	}
	    }                                                            
	    } 
	    outArray.add(outData);
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

	 

	    public String imageUp(XSSFSheet curSheet,int rowIdx, int cellIdx ) throws Exception {
	          double beforeTime = System.currentTimeMillis();
	          double afterTime = 0; 
	          String reTime = "-1";
	          XSSFDrawing drawing = curSheet.createDrawingPatriarch(); 
	          String atchFileIdString = ""; // 첨부파일 아이디
	          for (XSSFShape shape : drawing.getShapes()) { 
	             if (shape instanceof XSSFPicture) { 
	                XSSFPicture picture = (XSSFPicture) shape; 
	                if (picture.getPictureData()==null) {
	                      continue; 
	                   } 
	                    XSSFPictureData xssfPictureData = picture.getPictureData();
	                    ClientAnchor anchor = picture.getPreferredSize(); 
	                    int row1 = anchor.getRow1(); 
	                    int row2 = anchor.getRow2(); 
	                    int col1 = anchor.getCol1();  
	                    int col2 = anchor.getCol2(); 
	                    if(rowIdx == row1 && cellIdx == col1){ // 시트,셀위치 검사
	                       
	                       String ext = xssfPictureData.suggestFileExtension(); // 확장자
	                       String fileType = xssfPictureData.getMimeType(); //파일타입
	                       byte[] data = xssfPictureData.getData(); //파일 byte
	                       String fileUploadPath = fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.", "");
	                       String storePathString = fileUploadPath + getFolderPath();
	                       if (storePathString != null && !"".equals(storePathString)) {
	                          File saveFolder = new File(storePathString);
	                          if (!saveFolder.exists() || saveFolder.isFile()) {
	                             saveFolder.mkdirs();
	                          }
	                       }
	                       atchFileIdString = idgenService.getNextStringId();
	                       String newName= "EXCEL" + StringUtil.getTimeStamp() + atchFileIdString;
	                       FileOutputStream out = new FileOutputStream(storePathString + File.separator + newName); 
	                       out.write(data); 
	                       out.close(); 
	                       
	                       FileVO fileVO = new FileVO();
	                       fileVO.setFileStreCours(storePathString);
	                       fileVO.setAtchFileId(atchFileIdString);
	                       fileVO.setOrignFileNm("다운 받을 이미지 : "+ext);
	                       fileVO.setStreFileNm(newName);
	                       fileVO.setFileExtsn(ext);
	                       fileVO.setFileType(fileType);
	                       fileMngService.insertFileInf(fileVO);
	                       break;
	                    }
	                } 
	             }
	          
	             afterTime = System.currentTimeMillis(); 
	             double secDiffTime = (afterTime - beforeTime)/1000;
	             reTime = String.format("%.1f",secDiffTime);
	             System.out.println("re :: "+reTime);
	          return atchFileIdString;

	       }    
	
	
	
	
	

	
		

}
