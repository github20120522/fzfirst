package com.swj.dao.mybatis.driver;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.swj.dao.driver.DriverDAO;
import com.swj.dao.mybatis.BaseDAOMybatis;
import com.swj.model.driver.DriverBill;
import com.swj.model.driver.DriverInfo;

public class DriverDAOMybatis extends BaseDAOMybatis implements DriverDAO {
	
	public List listDriverInfo(DriverInfo di) throws DataAccessException{
		
		List list = this.getSqlSession().selectList("org.swj.model.driver.DriverInfo.listDriverInfo",di);
		return list;
	}
	
	public DriverBill saveDriverBill(DriverBill driverBill) throws DataAccessException {
		this.getSqlSession().insert("org.swj.model.driver.DriverBill.addDriverBill", driverBill);
		return driverBill;
	}
	
	public int selectDbCount(DriverBill driverBill) throws DataAccessException{
		
		return (Integer)this.getSqlSession().selectOne("org.swj.model.driver.DriverBill.selectCount", driverBill);
	}
	
	public List viewUserBill(DriverBill driverBill) throws DataAccessException{
		
		return this.getSqlSession().selectList("org.swj.model.driver.DriverBill.viewUserBill",driverBill);
	}
	
	public DriverBill getDriverBill(String billcode) throws DataAccessException{
		
		return (DriverBill)this.getSqlSession().selectOne("org.swj.model.driver.DriverBill.getDriverBill", billcode);
	}
	
	public void delDriverBill(int id) throws DataAccessException{
		
		this.getSqlSession().delete("org.swj.model.driver.DriverBill.delDriverBill", id);
	}
}
