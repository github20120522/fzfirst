package com.swj.action.driver;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.swj.action.BaseAction;
import com.swj.model.driver.DriverBill;
import com.swj.model.driver.DriverInfo;
import com.swj.model.user.User;
import com.swj.model.user.UserAccount;
import com.swj.service.driver.DriverService;
import com.swj.service.user.UserService;

public class DriverAction extends BaseAction {

	private static final long serialVersionUID = 895222790788291556L;
	
	// 信息列表
	private List<DriverInfo> list;
	
	// 用户购票历史
	private List<DriverBill> dbList;
	
	private DriverService driverService;
	
	private UserService userService;
	
	// 车辆信息
	private DriverInfo driverInfo;
	
	// 购票日期
	private String date;
	
	// 第一次进入标志
	private String oneOnce;
	
	// 购票时的车次
	private String driverid;
	
	// 票号
	private String billcode;
	
	@SuppressWarnings("unchecked")
	public String listDriverInfo() throws Exception{
		
		log.info("DriverAction.listDriverInfo");
		if(StringUtils.isBlank(oneOnce)){
			DriverInfo di = new DriverInfo();
			di = driverInfo;
			list = driverService.listDriverInfo(di);
		}
		return "listDriverInfo";
	}
	
	@SuppressWarnings("unchecked")
	public String buyBill() throws Exception{
		
		if(StringUtils.isNotBlank(oneOnce)){
			// 先查询车票表driver_bill，如果选择日期的车票数量不足10票则可以继续购买，否则显示票已售完
			DriverBill driverBill = new DriverBill();
			driverBill.setCreatetime(date);
			driverBill.setDriverid(driverid);
			int count = driverService.selectDbCount(driverBill);
			if(count >= 20){
				// 票已售完
				return "buyFailed";
			}else{
				// 如果可以购票，将该车次的票价显示在页面上
				this.getRequest().put("date", date);
				this.getRequest().put("driverid", driverid);
				DriverInfo di = new DriverInfo();
				di.setId(driverid);
				List list = driverService.listDriverInfo(di);
				if(list != null && list.size()>0){
					driverInfo = (DriverInfo)list.get(0);
				}
			}
		}else{
			// 购票成功，将数据保存到车票表中
			System.out.println(driverInfo.getPrice_first());
			System.out.println(driverInfo.getPrice_second());
			System.out.println(date);
			// 获取当前登录用户信息
			Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(pri instanceof UserDetails){
				User u = userService.selectUser(((UserDetails)pri).getUsername());
				// 保存票据，同时扣除该用户的购票费
				UserAccount userAccount = userService.viewAccount(u.getId());
				DriverBill db = new DriverBill();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				db.setBillcode(driverid+sdf.format(new Date()));
				db.setCreatetime(date);
				db.setDriverid(driverid);
				if(driverInfo.getPrice_first() != null){
					db.setPrice(driverInfo.getPrice_first());
					userAccount.setNowPrice(userAccount.getNowPrice()-driverInfo.getPrice_first());
					userAccount.setHistoryPrice(userAccount.getHistoryPrice()+driverInfo.getPrice_first());
				}
				if(driverInfo.getPrice_second() != null){
					db.setPrice(driverInfo.getPrice_second());
					userAccount.setNowPrice(userAccount.getNowPrice()-driverInfo.getPrice_second());
					userAccount.setHistoryPrice(userAccount.getHistoryPrice()+driverInfo.getPrice_second());
				}
				userService.plusAccount(userAccount);
				db.setUserid(u.getId());
				driverService.saveDriverBill(db);
			}
			return "buySuccess";
		}
		return "buyBill";
	}
	
	@SuppressWarnings("unchecked")
	public String showUserBill()throws Exception{
		
		// 获取当前登录用户信息
		Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(pri instanceof UserDetails){
			User u = userService.selectUser(((UserDetails)pri).getUsername());
			DriverBill db = new DriverBill();
			db.setUserid(u.getId());
			dbList = driverService.viewUserBill(db);
		}
		return "showUserBill";
	}
	
	public String retreatBill() throws Exception{
		
		// 跳转到退票页面
		return "retreatBill";
	}
	
	public String retreatBillEnd() throws Exception{
		
		if(StringUtils.isNotBlank(billcode)){
			DriverBill driverBill = driverService.getDriverBill(billcode);
			if(driverBill != null){
				// 获取当前登录用户信息
				Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				if(pri instanceof UserDetails){
					User u = userService.selectUser(((UserDetails)pri).getUsername());
					UserAccount userAccount = userService.viewAccount(u.getId());
					userAccount.setHistoryPrice(userAccount.getHistoryPrice()-(driverBill.getPrice()*4/5));
					userAccount.setNowPrice(userAccount.getNowPrice()+(driverBill.getPrice()*4/5));
					userService.plusAccount(userAccount);
				}
				driverService.delDriverBill(driverBill.getId());
			}else{
				// 票不存在
				return "retreatBillFailed";
			}
		}
		return "retreatBillSuccess";
	}
	
	public String getOneOnce() {
		return oneOnce;
	}

	public void setOneOnce(String oneOnce) {
		this.oneOnce = oneOnce;
	}

	public DriverService getDriverService() {
		return driverService;
	}

	public void setDriverService(DriverService driverService) {
		this.driverService = driverService;
	}

	public List<DriverInfo> getList() {
		return list;
	}

	public void setList(List<DriverInfo> list) {
		this.list = list;
	}
	
	public DriverInfo getDriverInfo() {
		return driverInfo;
	}

	public void setDriverInfo(DriverInfo driverInfo) {
		this.driverInfo = driverInfo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDriverid() {
		return driverid;
	}

	public void setDriverid(String driverid) {
		this.driverid = driverid;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<DriverBill> getDbList() {
		return dbList;
	}

	public void setDbList(List<DriverBill> dbList) {
		this.dbList = dbList;
	}

	public String getBillcode() {
		return billcode;
	}

	public void setBillcode(String billcode) {
		this.billcode = billcode;
	}

}