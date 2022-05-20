package com.open.ma.develop.ceo;


import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.StringUtil;
import com.open.ma.kim.banner.service.BannerVO;
import com.open.ma.kim.ceo.service.CeoVO;


@Controller
public class DeCeoController { 

	@Resource(name = "cmmnService")     
    protected CmmnService cmmnService;
	
    private final static String PROGRAM_ID = "Ceo";
     
    private final static String folderPath = "/ma/develop/deCeo/";
    
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "{procType}form.do")    
	public String form(@ModelAttribute("searchVO") CeoVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		     
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO);
		}     
		      
		List<CeoVO> upBannerList = (List<CeoVO>)cmmnService.selectList(searchVO, "Banner.upBannerSelectList");
		model.addAttribute("upBannerList", upBannerList); 
		 
		List<CeoVO> downBannerList = (List<CeoVO>)cmmnService.selectList(searchVO, "Banner.downBannerSelectList");
		model.addAttribute("downBannerList", downBannerList);
		
		return ".mLayout:"+ folderPath + "form";
	}        
  
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "updateProc.do")
	public String proc(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		CeoVO ceoVO = new CeoVO();
		ceoVO = (CeoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		if (ceoVO != null) {        
			model.addAttribute("ceoVO", ceoVO);
		}      
		  
		List<BannerVO> upBannerList = (List<BannerVO>)cmmnService.selectList(searchVO, "Banner.upBannerSelectList"); 
		for(BannerVO vo : upBannerList){
			System.out.println("배너 시퀀스 확인 : "+ vo.getBaSeq());
		}
		     
		ceoVO.setBannerList(upBannerList);              
		System.out.println("배열 제목 체크 : "+ searchVO.getBaTitle());
		   
		 
		  
//		String [] baSeq = searchVO.getBaSeq();
//		for (String seq : baSeq) {
//			System.out.println("배열 체크 : "+ seq);
//		} 
		 
		try {   
			System.out.println("if 전");           
			if(ceoVO.getBannerList() != null && ceoVO.getBannerList().size() > 0) { 
				System.out.println("if 후");   
				System.out.println("ceoVO.getBannerList() : " + ceoVO.getBannerList());
				System.out.println("ceoVO.getBannerList() 시퀀스 : " + ceoVO.getBannerList());
				Iterator<BannerVO> tempList = ceoVO.getBannerList().iterator();
				System.out.println("tempList : " + tempList);  
				System.out.println("tempList.hasNext() : " + tempList.hasNext());
				while(tempList.hasNext()) {       
					BannerVO tempVO = tempList.next();
					System.out.println("tempVO : " + tempVO);
					System.out.println("tempVO 꺼내기 : " + tempVO.getBaSeq());
					if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {
						System.out.println("빈 값 삭제");
						tempList.remove();     		      
					}else{   
						System.out.println("delete 실행 baSeq :" + tempVO.getBaSeq());
						cmmnService.deleteContents(tempVO, "Banner"); 
					}
				}       
				                           
				System.out.println("forEach 전 : " + ceoVO.getBannerList());
				for (BannerVO tempVO : ceoVO.getBannerList()) { 
					System.out.println("아래쪽 tempVO : " + tempVO.getBaSeq());
					if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {  
						cmmnService.insertContents(tempVO, "Banner");  
					}else {   
						System.out.println("reverse 실행 baSeq : "+ tempVO.getBaSeq());
						cmmnService.updateContents(tempVO, "Banner.updateReverse"); 
					}  
				}
				
			}  
			
		}catch(Exception e) { 

		}finally {
		   	 
		}	     
	        
		model.addAttribute("upBannerList", upBannerList); 
		return ".mLayout:"+ folderPath + "form";
	}        
		   
	@ResponseBody
	@RequestMapping(folderPath + "delUpBanner.do")
	public void delUpBanner(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		searchVO.setCol1(searchVO.getBaSeq()[0]);
		cmmnService.deleteContents(searchVO, "Banner.deleteBannerContents");    
		 
	}     
	
}
