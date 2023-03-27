package com.team.devdungeon.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;

public class Excel {

//	public void createExcelFromHashMap(HttpServletResponse response, List<Map<String, Object>> result) throws IOException {
//	    Workbook wb = new XSSFWorkbook();
//	    Sheet sheet = wb.createSheet("첫번째 시트");
//	    Row row = null;
//	    Cell cell = null;
//	    int rowNum = 0;
//
//	    // Header
//	    row = sheet.createRow(rowNum++);
//	    int cellNum = 0;
//	    for (String key : ((Map<String, Object>) result).keySet()) {
//	        cell = row.createCell(cellNum++);
//	        cell.setCellValue(key);
//	    }
//
//	    // Body
//	    row = sheet.createRow(rowNum++);
//	    cellNum = 0;
//	    for (Object value : ((Map<String, Object>) result).values()) {
//	        cell = row.createCell(cellNum++);
//	        cell.setCellValue((double) value);
//	    }
//
//	    // 컨텐츠 타입과 파일명 지정
//	    response.setContentType("ms-vnd/excel");
//	    response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");
//
//	    // Excel File Output
//	    wb.write(response.getOutputStream());
//	    wb.close();
//	}

	public void createExcelFromHashMap(HttpServletResponse response, List<Map<String, Object>> result) throws IOException {
	    Workbook wb = new XSSFWorkbook();
	    Sheet sheet = wb.createSheet("방문자 통계");
	    Row row = null;
	    Cell cell = null;
	    int rowNum = 0;
	    
	    
	    // Header
	    row = sheet.createRow(rowNum++);
	    int cellNum = 0;
	    Map<String, Object> firstRow = result.get(0);
	    System.out.println(firstRow);
	    for (String key : firstRow.keySet()) {
	        cell = row.createCell(cellNum++);
	        cell.setCellValue(key);
	    }
	    
	 // Body
	    for (Map<String, Object> data : result) {
	        row = sheet.createRow(rowNum++);
	        cellNum = 0;
	        for (Object value : data.values()) {
	            cell = row.createCell(cellNum++);
	            if (value instanceof String) {
	                cell.setCellValue((String) value);
	            } else if (value instanceof Integer) {
	                cell.setCellValue(value.toString());
	            } else if (value instanceof Double) {
	                cell.setCellValue((Double) value);
	            } else {
	            	cell.setCellValue(value.toString());
	            }
	        }
	    }

	    
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=Statistics.xlsx");

	    // Excel File Output
	    wb.write(response.getOutputStream());
	    response.getOutputStream().close();//이거 꼭 닫으셔야 합니다. 꼭 
	    wb.close();
	}
	
	
}
