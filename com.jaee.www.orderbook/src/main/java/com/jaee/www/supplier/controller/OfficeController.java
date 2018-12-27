package com.jaee.www.supplier.controller;

import java.io.*;
//import java.util.Date;
import java.util.List;

import javax.swing.filechooser.FileSystemView;

//import org.apache.poi.hssf.usermodel.HSSFCell;
//import org.apache.poi.hssf.usermodel.HSSFCellStyle;
//import org.apache.poi.hssf.usermodel.HSSFCreationHelper;
//import org.apache.poi.hssf.usermodel.HSSFDataFormat;
//import org.apache.poi.hssf.usermodel.HSSFFont;
//import org.apache.poi.hssf.usermodel.HSSFFormulaEvaluator;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.jaee.www.entity.custom.ReviewedBookVo;
//import org.apache.poi.hssf.util.HSSFColor;



public class OfficeController {
	public static void createExcel(List<ReviewedBookVo> books) throws IOException{
	    // 获取桌面路径
	    FileSystemView fsv = FileSystemView.getFileSystemView();
	    String desktop = fsv.getHomeDirectory().getPath();
	    String filePath = desktop + "/已添加教材.xls";

	    File file = new File(filePath);
	    OutputStream outputStream = new FileOutputStream(file);
	    HSSFWorkbook workbook = new HSSFWorkbook();
	    HSSFSheet sheet = workbook.createSheet("Sheet1");
	    HSSFRow row = sheet.createRow(0);
	    row.createCell(0).setCellValue("书名");
	    row.createCell(1).setCellValue("ISMN");
	    row.createCell(2).setCellValue("印刷日期");
	    row.createCell(3).setCellValue("作者");
	    row.createCell(4).setCellValue("出版社");
	    row.createCell(5).setCellValue("数量");
	    row.createCell(6).setCellValue("状态");
	    row.setHeightInPoints(30); // 设置行的高度
	    sheet.setColumnWidth(0, 20 * 256); // 设置列的宽度
	    sheet.setColumnWidth(1, 20 * 256); // 设置列的宽度
	    sheet.setColumnWidth(3, 20 * 256); // 设置列的宽度
	    sheet.setColumnWidth(4, 20 * 256); // 设置列的宽度
	    for (int i=1;i<=books.size();i++) {
	    	HSSFRow row1 = sheet.createRow(i);
		    row1.createCell(0).setCellValue(books.get(i-1).getBookTitle());
		    row1.createCell(1).setCellValue(books.get(i-1).getIsbn());
		    row1.createCell(2).setCellValue(books.get(i-1).getDateOfPrinting());
		    row1.createCell(3).setCellValue(books.get(i-1).getAuthor());
		    row1.createCell(4).setCellValue(books.get(i-1).getPress());
		    row1.createCell(5).setCellValue(books.get(i-1).getCount());
		    row1.createCell(6).setCellValue(books.get(i-1).getCount());
		}
/*	    HSSFRow row1 = sheet.createRow(1);
	    row1.createCell(0).setCellValue("1");
	    row1.createCell(1).setCellValue("NO00001");

	    // 日期格式化
	    HSSFCellStyle cellStyle2 = workbook.createCellStyle();
	    HSSFCreationHelper creationHelper = workbook.getCreationHelper();
	    cellStyle2.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-MM-dd HH:mm:ss"));
	    sheet.setColumnWidth(2, 20 * 256); // 设置列的宽度

	    HSSFCell cell2 = row1.createCell(2);
	    cell2.setCellStyle(cellStyle2);
	    cell2.setCellValue(new Date());

	    row1.createCell(3).setCellValue(2);


	    // 保留两位小数
	    HSSFCellStyle cellStyle3 = workbook.createCellStyle();
	    cellStyle3.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
	    HSSFCell cell4 = row1.createCell(4);
	    cell4.setCellStyle(cellStyle3);
	    cell4.setCellValue(29.5);


	    // 货币格式化
	    HSSFCellStyle cellStyle4 = workbook.createCellStyle();
	    HSSFFont font = workbook.createFont();
	    font.setFontName("华文行楷");
	    font.setFontHeightInPoints((short)15);
	    font.setColor(HSSFColor.RED.index);
	    cellStyle4.setFont(font);

	    HSSFCell cell5 = row1.createCell(5);
	    cell5.setCellFormula("D2*E2");  // 设置计算公式

	    // 获取计算公式的值
	    HSSFFormulaEvaluator e = new HSSFFormulaEvaluator(workbook);
	    cell5 = e.evaluateInCell(cell5);
	    System.out.println(cell5.getNumericCellValue());
*/

	    workbook.setActiveSheet(0);
	    workbook.write(outputStream);
	    outputStream.close();
	}

}
