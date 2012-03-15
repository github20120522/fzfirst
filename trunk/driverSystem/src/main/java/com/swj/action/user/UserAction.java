package com.swj.action.user;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.swj.action.BaseAction;
import com.swj.model.user.User;
import com.swj.model.user.UserAccount;
import com.swj.service.user.UserService;
import com.swj.utils.MD5;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = -1800046802970864841L;
	
	private UserService userService;
	
	private InputStream inputStream;
	
	private String name;
	
	private User user;
	
	private UserAccount userAccount;

	public UserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccount userAccount) {
		this.userAccount = userAccount;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String checkUser() throws UnsupportedEncodingException{
		
		log.info("UserAction.checkUser");
		String username = "";
		String result = "Y";
		if(name != null){
			username = name;
			User u = userService.selectUser(username);
			if(u != null){
				result = "N";
			}
		}else{
			result = "N";
		}
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}
	
	public String saveUser() throws Exception{
		
		log.info("UserAction.saveUser");
		User u = new User();
		if(StringUtils.isNotBlank(user.getUsername()) && StringUtils.isNotBlank(user.getPassword())){
			// 后台二次确认，防止前台恶意注册
			User uCheck = userService.selectUser(user.getUsername());
			// 如果用户存在则不插入新用户
			if(uCheck == null){
				u.setEnabled("1");
				u.setUsername(user.getUsername());
				u.setPassword(MD5.getMD5(user.getPassword()));
				userService.saveUser(u);
			}
		}
		return "saveUser";
	}
	
	public String viewAccount() throws Exception{
		
		log.info("UserAction.viewAccount");
		// 获取当前登录用户信息
		Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(pri instanceof UserDetails){
			User u = userService.selectUser(((UserDetails)pri).getUsername());
			userAccount = userService.viewAccount(u.getId());
		}
		return "viewAccount";
	}
	
	public String plusAccount() throws UnsupportedEncodingException{
		
		String result = "";
		Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(pri instanceof UserDetails){
			User u = userService.selectUser(((UserDetails)pri).getUsername());
			UserAccount ua = userService.viewAccount(u.getId());
			result = ua.getNowPrice()+1000.00+"";
			ua.setNowPrice(ua.getNowPrice()+1000);
			userService.plusAccount(ua);
		}
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}
}