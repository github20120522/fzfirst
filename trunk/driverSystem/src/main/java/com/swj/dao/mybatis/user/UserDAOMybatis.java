package com.swj.dao.mybatis.user;

import org.springframework.dao.DataAccessException;

import com.swj.dao.mybatis.BaseDAOMybatis;
import com.swj.dao.user.UserDAO;
import com.swj.model.user.Authority;
import com.swj.model.user.User;
import com.swj.model.user.UserAccount;

public class UserDAOMybatis extends BaseDAOMybatis implements UserDAO {

	public User selectUser(String username) throws DataAccessException {
		User user = (User)this.getSqlSession().selectOne("org.swj.model.user.User.selectUser", username);
		return user;
	}

	public User saveUser(User user) throws DataAccessException {
		this.getSqlSession().insert("org.swj.model.user.User.addUser", user);
		User uBack = (User)this.getSqlSession().selectOne("org.swj.model.user.User.selectUser", user.getUsername());
		return uBack;
	}
	
	public boolean saveUserAuthority(User user) throws DataAccessException {
		
		Authority auth = new Authority();
		auth.setUserid(user.getId());
		// ROLE_USER
		auth.setRoleid(2);
		this.getSqlSession().insert("org.swj.model.user.Authority.addAuthority", auth);
		return true;
	}
	
	public boolean saveUserAccount(User user) throws DataAccessException {
		
		UserAccount ua = new UserAccount();
		ua.setUserid(user.getId());
		ua.setNowPrice(1000.00);
		ua.setHistoryPrice(0.00);
		this.getSqlSession().insert("org.swj.model.user.UserAccount.addUserAccount", ua);
		return true;
	}
	
	public UserAccount viewAccount(int userid) throws DataAccessException{
		
		UserAccount ua = (UserAccount)this.getSqlSession().selectOne("org.swj.model.user.UserAccount.selectUserAccount", userid);
		return ua;
	}
	
	public void plusAccount(UserAccount userAccount) throws DataAccessException{
		
		this.getSqlSession().update("org.swj.model.user.UserAccount.updateUserAccount",userAccount);
	}
	
}
