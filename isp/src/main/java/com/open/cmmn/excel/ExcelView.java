package com.open.cmmn.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.AbstractView;

import net.sf.jxls.transformer.Configuration;
import net.sf.jxls.transformer.XLSTransformer;

@Service
public class ExcelView extends AbstractView {

	//private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ExcelView() {
		this.setContentType("application/vnd.ms-excel");
	}

	
	/**
	 * @uml.property  name="excelPath"
	 */
	@Value("excel")
	private String excelPath;
	private static SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.view.document.AbstractExcelView#buildExcelDocument(java.util.Map, org.apache.poi.hssf.usermodel.HSSFWorkbook, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, SQLException, Exception, InvalidFormatException {
		// TODO Auto-generated method stub	
		XLSTransformer xls = new XLSTransformer();
		
		Configuration cf = xls.getConfiguration();
		cf.setUTF16(true);	// 
		xls.setConfiguration(cf);

		InputStream is = null; 

		try {
			is = readTemplate((String)model.get("source") );
			Map<String, Object> beans = new HashMap<String, Object>();

			SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			beans.put("date", df.format( new Date() ) );
			beans.put("now", new Date() );
			
			Set key = model.keySet();
			for (Iterator iterator = key.iterator(); iterator.hasNext();) {
			    String keyName = (String) iterator.next();
			    beans.put( keyName,  model.get(keyName) );
			          
			    if( keyName.endsWith("List") ) {
			        List list = (List)model.get(keyName);
			    	if( list.size() == 0 ) {
						String str = "<script>alert('????????? ???????????? ????????????.'); history.back(-1);</script>";
						response.setContentType("text/html; charset=utf-8");
						response.getOutputStream().write(str.getBytes("UTF-8"));
						return;
			    	}			
			    }
			}
			writeWorkbook((String)model.get("target") + "_" + sf.format(new Date() ), response, xls.transformXLS(is, beans) );


		}finally {
			if( is != null ) {
				try {
					is.close();

				}catch (IOException e) {
					//////System.out.println("Exception occured");
				}
			}
		}
	}
    
    private InputStream readTemplate(String finalTemplate) throws FileNotFoundException {
    	String CONTEXT_PATH = getServletContext().getRealPath("");
        String templateFilePath = CONTEXT_PATH+ "WEB-INF" +File.separator + excelPath + File.separator + finalTemplate; 
	    //System.out.println("templateFilePath ================>"+templateFilePath); 
        return new FileInputStream(templateFilePath);
    }

    private void writeWorkbook(
        String filename, HttpServletResponse response, org.apache.poi.ss.usermodel.Workbook workbook)
        throws IOException {
        response.setHeader("Content-disposition", "attachment;filename=" + encodeFileName(filename + ".xlsx"));
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "-1");
        workbook.write(response.getOutputStream());
    }

    private String encodeFileName(String filename) {
        try {
            return URLEncoder.encode(filename, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}

