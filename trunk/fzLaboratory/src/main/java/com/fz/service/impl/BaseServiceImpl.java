package com.fz.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.fz.dao.BaseDAO;
import com.fz.service.BaseService;

public class BaseServiceImpl implements BaseService{

	protected transient final Log log = LogFactory.getLog(getClass());// »’÷æ
	
	private BaseDAO baseDAO;
	
	public BaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
}
