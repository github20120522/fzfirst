package com.swj.service.sample;

import org.springframework.dao.DataAccessException;

import com.swj.model.sample.UserSample;
import com.swj.service.BaseService;

public interface UserSampleService extends BaseService {
	
	public UserSample selectUserSample(int i) throws DataAccessException; 
}
