package com.fzxml.dom4j;

import java.io.FileWriter;
import java.io.IOException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class xmlWriteTest {
	
	//创建dom对象
	public static Document createDocument(){
		//创建一个dom对象
		Document document = DocumentHelper.createDocument();
		//创建一个根节点
		Element rootElement = document.addElement("top");
		rootElement
			.addElement("class")
			.addAttribute("name", "zzo")
			.addElement("property")
			.addAttribute("id", "001")
			.addAttribute("password", "001");
		return document;
	}
	
	/**
	 * 写入xml文件地址
	 * @param document 所属要写入的内容
	 * @param outFile 文件存放的地址
	 */
	public static void writeDocument(Document document, String outFile){
		try{
			//要存放的文件
			FileWriter fileWriter = new FileWriter(outFile);
			//OutoutFormat美化输出格式
			OutputFormat xmlFormat = OutputFormat.createPrettyPrint();
			//设置文件编码
			xmlFormat.setEncoding("GB2312");
			//创建写文件方法
			XMLWriter xmlWriter = new XMLWriter(fileWriter,xmlFormat);
			//写入文件
			xmlWriter.write(document);
			//关闭
			xmlWriter.close();
		}catch(IOException e){
			System.out.println("文件没有找到");
			e.printStackTrace();
		}
    }
	
	//xml生成测试
	public static void main(String[] args){
		String outFile = "xmlCreateTest.xml";
		xmlWriteTest.writeDocument(xmlWriteTest.createDocument(), outFile);
		System.out.println("Ok,it's done!");
	}
}
