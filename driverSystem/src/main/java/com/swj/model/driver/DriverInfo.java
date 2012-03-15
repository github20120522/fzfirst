package com.swj.model.driver;


public class DriverInfo {
	
	private String id;
	
	private String from_city;
	
	private String to_city;

	private String from_time;
	
	private String to_time;
	
	private Integer mileage;
	
	private String usetime;
	
	private Double price_first;
	
	private Double price_second;
	
	private String price_note;

	public String getFrom_city() {
		return from_city;
	}

	public void setFrom_city(String from_city) {
		this.from_city = from_city;
	}

	public String getFrom_time() {
		return from_time;
	}

	public void setFrom_time(String from_time) {
		this.from_time = from_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getMileage() {
		return mileage;
	}

	public void setMileage(Integer mileage) {
		this.mileage = mileage;
	}

	public Double getPrice_first() {
		return price_first;
	}

	public void setPrice_first(Double price_first) {
		this.price_first = price_first;
	}

	public String getPrice_note() {
		return price_note;
	}

	public void setPrice_note(String price_note) {
		this.price_note = price_note;
	}

	public Double getPrice_second() {
		return price_second;
	}

	public void setPrice_second(Double price_second) {
		this.price_second = price_second;
	}

	public String getTo_city() {
		return to_city;
	}

	public void setTo_city(String to_city) {
		this.to_city = to_city;
	}

	public String getTo_time() {
		return to_time;
	}

	public void setTo_time(String to_time) {
		this.to_time = to_time;
	}

	public String getUsetime() {
		return usetime;
	}

	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}

}
