package com.model;

//import java.util.Date;

import java.sql.*;

public class checkInApplication {

	int checkInApplicationId;
	int userId;
	Date userCheckInDate;
	Date checkInApplicationDate;
	String checkInApplicationStatus;
	String approveRejectRemark;

	public int getCheckInApplicationId() {
		return checkInApplicationId;
	}

	public void setCheckInApplicationId(int checkInApplicationId) {
		this.checkInApplicationId = checkInApplicationId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getUserCheckInDate() {
		return userCheckInDate;
	}

	public void setUserCheckInDate(Date userCheckInDate) {
		this.userCheckInDate = userCheckInDate;
	}

	public Date getCheckInApplicationDate() {
		return checkInApplicationDate;
	}

	public void setCheckInApplicationDate(Date checkInApplicationDate) {
		this.checkInApplicationDate = checkInApplicationDate;
	}

	public String getCheckInApplicationStatus() {
		return checkInApplicationStatus;
	}

	public void setCheckInApplicationStatus(String checkInApplicationStatus) {
		this.checkInApplicationStatus = checkInApplicationStatus;
	}

	public String getApproveRejectRemark() {
		return approveRejectRemark;
	}

	public void setApproveRejectRemark(String approveRejectRemark) {
		this.approveRejectRemark = approveRejectRemark;
	}

}
