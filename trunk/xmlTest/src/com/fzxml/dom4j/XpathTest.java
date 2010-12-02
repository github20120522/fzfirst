package com.fzxml.dom4j;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

public class XpathTest {
	@SuppressWarnings("unchecked")
	public static void main(String[] args){
		SAXReader saxReader =  new SAXReader();
		try {
		/**
		 *  先通过 org.dom4j.io.SAXReader 读入整份XML文档
		 */
		Document xmlDoc = saxReader.read(new FileInputStream(new File("dom4jTest.xml")));
		List<Node> list = xmlDoc.selectNodes("//dom4j/dom/property"); //通过xpath获取指定节点的list
		for(int i=0; i<list.size(); i++){
			Node node = list.get(i);
			//node.valueOf("@name");获取该节点下的name属性的值
			System.out.println("<"+node.getName()
					+" name="+node.valueOf("@name")
					+" value="+node.valueOf("@value")
					+" />");
		}
		
		Node node2 = xmlDoc.selectSingleNode("//dom4j/dom/property");
		System.out.println(node2.getText());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
