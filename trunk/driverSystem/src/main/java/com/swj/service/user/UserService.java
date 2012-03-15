package com.swj.service.user;

import org.springframework.dao.DataAccessException;

import com.swj.model.user.User;
import com.swj.model.user.UserAccount;
import com.swj.service.BaseService;

public interface UserService extends BaseService {
	
	public User selectUser(String username) throws DataAccessException;
	
	public User saveUser(User user) throws DataAccessException;
	
	public boolean saveUserAuthority(User user) throws DataAccessException;
	
	public boolean saveUserAccount(User user) throws DataAccessException;
	
	public UserAccount viewAccount(int userid) throws DataAccessException;
	
	public void plusAccount(UserAccount userAccount) throws DataAccessException;
}
