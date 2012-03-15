package com.swj.dao;

import org.springframework.dao.DataAccessException;

/**
 * 基础DAO类，所有DAO类都集成此类
 * @author fz 2011-12-29
 *
 */
public interface BaseDAO {
	
	public Object getObjectById(String mapName,String id) throws DataAccessException;
	
	public Object getObjectById(String mapName,int id) throws DataAccessException;
}
