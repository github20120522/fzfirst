package com.fzxml.dom4j;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class Dom4jTest {
	public static void main(String[] args) {
		SAXReader saxReader =  new SAXReader();
		try {
		/**
		 *  先通过 org.dom4j.io.SAXReader 读入整份XML文档
		 */
		Document xmlDoc = saxReader.read(new FileInputStream(new File("dom4jTest.xml")));
		/**
		 *  取得XML文档的各元素及其值
		 */
		Element rootElement = xmlDoc.getRootElement(); //取得XML文档的根元素
		System.out.println("根节点元素:"+rootElement.getName());  //根节点元素
		Iterator subElementsIt = rootElement.elementIterator(); //以Iterator集合得到根元素下的所有子元素
		while(subElementsIt.hasNext()){
			
			Element subElement = (Element)subElementsIt.next();
			System.out.println("根节点下元素:"+subElement.getName());
			
			//此元素的class属性的名字
			System.out.println(subElement.attribute("class").getName()
					+"="
					+subElement.attribute("class").getValue());
			
			Iterator subAttributeIt = subElement.attributeIterator();
			while(subAttributeIt.hasNext()){
				Attribute subAttribute = (Attribute)subAttributeIt.next();
				System.out.println("此元素下属性:"+subAttribute.getName()+"-"+subAttribute.getValue()); //元素属性
			}
			
			Iterator sub2ElementsIt = subElement.elementIterator("property"); //以"property"属性Iterator集合得到根元素下的所有子元素
			while(sub2ElementsIt.hasNext()){
				Element sub2Element = (Element)sub2ElementsIt.next();
				System.out.println("此元素下元素:"+sub2Element.getName());
				
				Iterator sub2AttributeIt = sub2Element.attributeIterator();
				while(sub2AttributeIt.hasNext()){
					Attribute sub2Attribute = (Attribute)sub2AttributeIt.next();
					System.out.println("此元素下元素下属性:"+sub2Attribute.getName()+"-"+sub2Attribute.getValue());
				}
			}
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
