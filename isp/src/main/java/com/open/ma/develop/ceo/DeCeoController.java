package com.open.ma.develop.ceo;


import java.util.HashMap;
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
		
		HashMap<String, Object> returnMap = new HashMap<>();
		String msg = "저장이 실패하였습니다";
		 
		ceoVO.setBannerList(upBannerList);    							    					  
		try { 
			if(ceoVO.getBannerList() != null && ceoVO.getBannerList().size() > 0) {
				System.out.println("ceoVO.getBannerList() ::: " + ceoVO.getBannerList());
				Iterator<CeoVO> tempList = ceoVO.getBannerList().iterator();
				System.out.println("tempList ::: " + tempList);
				while(tempList.hasNext()) {  
					System.out.println("tempList.hasNext() ::: " + tempList.hasNext());
					CeoVO tempVO = tempList.next();
					System.out.println("tempVO ::: " + tempVO);
					if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {
						tempList.remove();     		   
					}     
				}  
				      
				cmmnService.deleteContents(tempList, "Banner"); //
				for (CeoVO tempVO : ceoVO.getBannerList()) {
					System.out.println("아래쪽 tempVO ::: " + tempVO);
					if(StringUtil.isNullToString(tempVO.getBaSeq()).equals("")) {
						cmmnService.insertContents(tempVO, "Banner"); //
					}else {
						cmmnService.updateContents(tempVO, "Banner"); //
					}
				}
				msg = "저장되었습니다";
			}
		}catch(Exception e) {
			msg = ""+e;
		}finally {
			returnMap.put("msg", msg);
		}
		
		
		return ".mLayout:"+ folderPath + "form";
	}     
  
	@RequestMapping(folderPath + "{procType}Proc.do")
	public void proc(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		    
		     
	}      
        
	@ResponseBody
	@RequestMapping(folderPath + "delUpBanner.do")
	public void delUpBanner(@ModelAttribute("searchVO") CeoVO searchVO, Model model, SessionStatus status, HttpServletRequest request) throws Exception {
		
		cmmnService.deleteContents(searchVO, "Banner");    
		
	}     
	
}
