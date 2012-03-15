package com.swj.service.impl.driver;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.swj.dao.driver.DriverDAO;
import com.swj.model.driver.DriverBill;
import com.swj.model.driver.DriverInfo;
import com.swj.service.driver.DriverService;
import com.swj.service.impl.BaseServiceImpl;

public class DriverServiceImpl extends BaseServiceImpl implements DriverService{

	private DriverDAO driverDAO;

	public DriverDAO getDriverDAO() {
		return driverDAO;
	}

	public void setDriverDAO(DriverDAO driverDAO) {
		this.driverDAO = driverDAO;
	}
	
	public List listDriverInfo(DriverInfo di)throws DataAccessException{
		
		return driverDAO.listDriverInfo(di);
	}
	
	public DriverBill saveDriverBill(DriverBill driverBill) throws DataAccessException{
		
		return driverDAO.saveDriverBill(driverBill);
	}
	
	public int selectDbCount(DriverBill driverBill) throws DataAccessException{
		
		return driverDAO.selectDbCount(driverBill);
	}
	
	public List viewUserBill(DriverBill driverBill) throws DataAccessException{
		
		return driverDAO.viewUserBill(driverBill);
	}
	
	public DriverBill getDriverBill(String billcode) throws DataAccessException{
		
		return driverDAO.getDriverBill(billcode);
	}
	
	public void delDriverBill(int id) throws DataAccessException{
		
		driverDAO.delDriverBill(id);
	}
}
