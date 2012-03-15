package com.swj.dao.sample;

import org.springframework.dao.DataAccessException;

import com.swj.dao.BaseDAO;
import com.swj.model.sample.UserSample;

public interface UserSampleDAO extends BaseDAO{
	
	public UserSample selectUserSample(int id) throws DataAccessException;
}
