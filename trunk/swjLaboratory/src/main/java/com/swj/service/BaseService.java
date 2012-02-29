package com.swj.service;

import org.springframework.dao.DataAccessException;

/**
 * 业务类的基础类，所有业务类都集成此类
 * @author fz 2011-12-29
 *
 */
public interface BaseService {
	
	public Object getObjectById(String mapName,String id) throws DataAccessException;
	
	public Object getObjectById(String mapName,int id) throws DataAccessException;
}
