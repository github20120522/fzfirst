package com.swj.action;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.swj.service.BaseService;

/**
 * 基础Action类，所有Action都继承与此类，此类包含有request，session，application对象
 * @author fz 2011-12-29
 *
 */
public class BaseAction extends ActionSupport implements RequestAware, SessionAware, ApplicationAware {

	private static final long serialVersionUID = -5129165971586309226L;

	protected transient final Log log = LogFactory.getLog(getClass());// 日志

	private BaseService baseService;
	
	private Map request;// request.put("foo",foo);

	private Map session;// session.put("foo",foo);

	private Map application;// application.put("foo",foo);

	public Map getApplication() {
		return application;
	}

	public void setApplication(Map application) {
		this.application = application;
	}

	public Map getRequest() {
		return request;
	}

	public void setRequest(Map request) {
		this.request = request;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public BaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}

}
