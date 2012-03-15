package com.swj.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;

import com.swj.dao.BaseDAO;

public class BaseDAOMybatis extends SqlSessionDaoSupport implements BaseDAO {

	public Object getObjectById(String mapName, String id) throws DataAccessException {
		return this.getSqlSession().selectOne(mapName, id);
	}

	public Object getObjectById(String mapName, int id) throws DataAccessException {
		return this.getSqlSession().selectOne(mapName, id);
	}
	
}
