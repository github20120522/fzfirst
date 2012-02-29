package com.swj.service.impl.sample;

import org.springframework.dao.DataAccessException;

import com.swj.dao.sample.UserSampleDAO;
import com.swj.model.sample.UserSample;
import com.swj.service.impl.BaseServiceImpl;
import com.swj.service.sample.UserSampleService;

public class UserSampleServiceImpl extends BaseServiceImpl implements UserSampleService{

	private UserSampleDAO userSampleDAO;
	
	public UserSample selectUserSample(int id) throws DataAccessException {
		
		return userSampleDAO.selectUserSample(id);
	}
	
	public UserSampleDAO getUserSampleDAO() {
		return userSampleDAO;
	}

	public void setUserSampleDAO(UserSampleDAO userSampleDAO) {
		this.userSampleDAO = userSampleDAO;
	}
}
