package com.fzlog.log4jTest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Log4jTest {
	
	/**
	 * 日志
	 */
	protected final Log log = LogFactory.getLog(getClass());
	//使用静态变量初始化的时候,不能用getClass()来加载类
	//private static Log log = LogFactory.getLog(Log4jTest.class);
	
	public void logTest(){
		log.info("infoTest");
		log.debug("debugTest");
		log.error("errorTest");
		log.trace("traceTest");
		log.warn("warnTest");
		log.fatal("fatalTest");
	}
	
	public static void main(String[] args){
		Log4jTest log4jTest = new Log4jTest();
		log4jTest.logTest();
	}
}
