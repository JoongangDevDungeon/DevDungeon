package com.team.devdungeon.util;

import java.io.IOException;
import java.util.HashMap;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;

public class Excel {

	public void createExcelFromHashMap(HttpServletResponse response, HashMap<String, String> data) throws IOException {
	    Workbook wb = new XSSFWorkbook();
	    Sheet sheet = wb.createSheet("첫번째 시트");
	    Row row = null;
	    Cell cell = null;
	    int rowNum = 0;

	    // Header
	    row = sheet.createRow(rowNum++);
	    int cellNum = 0;
	    for (String key : data.keySet()) {
	        cell = row.createCell(cellNum++);
	        cell.setCellValue(key);
	    }

	    // Body
	    row = sheet.createRow(rowNum++);
	    cellNum = 0;
	    for (String value : data.values()) {
	        cell = row.createCell(cellNum++);
	        cell.setCellValue(value);
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	    // Excel File Output
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	
}
