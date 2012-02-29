package com.swj.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;

import com.swj.dao.BaseDAO;
import com.swj.service.BaseService;

public class BaseServiceImpl implements BaseService{

	protected transient final Log log = LogFactory.getLog(getClass());// »’÷æ
	
	private BaseDAO baseDAO;
	
	public Object getObjectById(String mapName,String id) throws DataAccessException {
		return null;
	}

	public Object getObjectById(String mapName,int id) throws DataAccessException {
		return null;
	}
	
	public BaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
}
