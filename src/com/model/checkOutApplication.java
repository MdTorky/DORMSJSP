package com.model;

import java.sql.*;

/**
 * checkOutApplication
 */
public class checkOutApplication {

	private int checkOutApplicationId;
	private int userId;
	private Date checkOutApplicationDate;
	private Date userCheckOutDate;
	private String userCheckOutTime;
	private String checkOutApplicationStatus;

	public int getCheckOutApplicationId() {
		return checkOutApplicationId;
	}

	public void setCheckOutApplicationId(int checkOutApplicationId) {
		this.checkOutApplicationId = checkOutApplicationId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCheckOutApplicationDate() {
		return checkOutApplicationDate;
	}

	public void setCheckOutApplicationDate(Date checkOutApplicationDate) {
		this.checkOutApplicationDate = checkOutApplicationDate;
	}

	public Date getUserCheckOutDate() {
		return userCheckOutDate;
	}

	public void setUserCheckOutDate(Date userCheckOutDate) {
		this.userCheckOutDate = userCheckOutDate;
	}

	public String getUserCheckOutTime() {
		return userCheckOutTime;
	}

	public void setUserCheckOutTime(String userCheckOutTime) {
		this.userCheckOutTime = userCheckOutTime;
	}

	public String getCheckOutApplicationStatus() {
		return checkOutApplicationStatus;
	}

	public void setCheckOutApplicationStatus(String checkOutApplicationStatus) {
		this.checkOutApplicationStatus = checkOutApplicationStatus;
	}
}