package com.swj.service.driver;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.swj.model.driver.DriverBill;
import com.swj.model.driver.DriverInfo;
import com.swj.service.BaseService;

public interface DriverService extends BaseService {
	
	public List listDriverInfo(DriverInfo di)throws DataAccessException;
	
	public DriverBill saveDriverBill(DriverBill driverBill) throws DataAccessException;
	
	public int selectDbCount(DriverBill driverBill) throws DataAccessException;
	
	public List viewUserBill(DriverBill driverBill) throws DataAccessException;
	
	public DriverBill getDriverBill(String billcode) throws DataAccessException;
	
	public void delDriverBill(int id) throws DataAccessException;
}
