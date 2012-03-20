package com.fz.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * spring context 辅助类，用于在任何类中获取想要使用的bean
 * 
 * @author fz
 * @time 2011-7-6
 */
public class SpringContextHelper implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	// 日志
	protected transient final Log log = LogFactory.getLog(getClass());

	/*
	 * 注入ApplicationContext
	 */
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// 在加载Spring时自动获得applicationContext
		SpringContextHelper.applicationContext = applicationContext;
	}

	/*
	 * 获取bean
	 */
	public static Object getBean(String beanName) {
		return applicationContext.getBean(beanName);
	}
}