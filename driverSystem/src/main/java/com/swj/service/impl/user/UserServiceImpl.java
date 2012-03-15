package com.swj.service.impl.user;

import org.springframework.dao.DataAccessException;

import com.swj.dao.user.UserDAO;
import com.swj.model.user.User;
import com.swj.model.user.UserAccount;
import com.swj.service.impl.BaseServiceImpl;
import com.swj.service.user.UserService;

public class UserServiceImpl extends BaseServiceImpl implements UserService{

	private UserDAO userDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public User selectUser(String username) throws DataAccessException {
		
		return userDAO.selectUser(username);
	}
	
	public User saveUser(User user) throws DataAccessException {
		User uBack = userDAO.saveUser(user);
		saveUserAuthority(uBack);
		saveUserAccount(uBack);
		return uBack;
	}
	
	public boolean saveUserAuthority(User user) throws DataAccessException{
		
		return userDAO.saveUserAuthority(user);
	}
	
	public boolean saveUserAccount(User user) throws DataAccessException {
		
		return userDAO.saveUserAccount(user);
	}
	
	public UserAccount viewAccount(int userid) throws DataAccessException{
		
		return userDAO.viewAccount(userid);
	}
	
	public void plusAccount(UserAccount userAccount) throws DataAccessException {
		
		userDAO.plusAccount(userAccount);
	}

}
