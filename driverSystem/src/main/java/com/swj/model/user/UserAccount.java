package com.swj.model.user;

public class UserAccount {
	
	private Integer id;
	
	private Integer userid;
	
	private Double nowPrice;
	
	private Double historyPrice;

	public Double getHistoryPrice() {
		return historyPrice;
	}

	public void setHistoryPrice(Double historyPrice) {
		this.historyPrice = historyPrice;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(Double nowPrice) {
		this.nowPrice = nowPrice;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

}
