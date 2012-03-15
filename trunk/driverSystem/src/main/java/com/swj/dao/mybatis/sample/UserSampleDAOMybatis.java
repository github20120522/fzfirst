package com.swj.dao.mybatis.sample;

import org.springframework.dao.DataAccessException;

import com.swj.dao.mybatis.BaseDAOMybatis;
import com.swj.dao.sample.UserSampleDAO;
import com.swj.model.sample.UserSample;

public class UserSampleDAOMybatis extends BaseDAOMybatis implements UserSampleDAO {

	public UserSample selectUserSample(int id) throws DataAccessException {
		UserSample userSample = (UserSample)this.getSqlSession().selectOne("org.swj.model.userSample.UserSample.selectUserSample", 1);
		return userSample;
	}
	
}
