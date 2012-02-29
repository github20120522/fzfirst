package com.swj.action.sample;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.swj.action.BaseAction;
import com.swj.model.sample.UserSample;
import com.swj.service.sample.UserSampleService;

public class UserSampleAction extends BaseAction {

	private static final long serialVersionUID = -1800046802970864841L;
	
	private UserSampleService userSampleService;
	
	private UserSample userSample;
	
	private InputStream inputStream;
	
	// 获取id为1的UserSample的对象信息
	public String viewUserSample() throws Exception{
		
		log.info("UserSampleAction.viewUserSample");
		userSample = userSampleService.selectUserSample(1);
		// SecurityContextHolder 用于获取security当前环境 获取当前用户信息
		Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Object auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth instanceof Principal){
			System.out.println(((Principal)auth).getName());
		}
		if(pri instanceof UserDetails){
			System.out.println(((UserDetails)pri).getUsername());
		}
		return "getUserSample";
	}
	
	// struts2原生ajax调用方法1，使用inputSteam进行ajax调用
	public String ajaxUserSampleInputStream() throws UnsupportedEncodingException{
		
		log.info("UserSampleAction.ajaxUserSampleInputStream");
		String result = "Hello Ajax in Struts2 , I'am InputStream Ajax ! 原生ajax方法1";
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}
	
	// struts2原生ajax调用方法2，使用servlet的response进行ajax调用
	public String ajaxUserSampleResponse() throws IOException{
		
		log.info("UserSampleAction.ajaxUserSampleResponse");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/xml");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader ("Expires", 0);
		String result = "Hello Ajax in Struts2 , I'am Response Ajax ! 原生ajax方法2";
		response.getWriter().print(result);
		return null;
	}
	
	// json ajax
	public String jsonAjaxUserSample() throws Exception{
		
		log.info("UserSampleAction.jsonAjaxUserSample");
		userSample = new UserSample();
		userSample.setId(2);
		userSample.setName("json");
		userSample.setPassword("hello json");
		return "json";
	}
	
	@JSON(serialize=false)
	public UserSampleService getUserSampleService() {
		return userSampleService;
	}

	public void setUserSampleService(UserSampleService userSampleService) {
		this.userSampleService = userSampleService;
	}
	
	public UserSample getUserSample() {
		return userSample;
	}

	public void setUserSample(UserSample userSample) {
		this.userSample = userSample;
	}
	
	@JSON(serialize=false)
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
}
