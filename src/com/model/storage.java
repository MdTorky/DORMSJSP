package com.model;

import java.sql.*;

public class storage {

	int storageId;
	int userId;
	String storageStartDate;
	String storageStartEnd;
	int storageBoxesNo;
	String storageStatus;
	String storageApproveRejectRemark;

	public int getStorageId() {
		return storageId;
	}

	public void setStorageId(int storageId) {
		this.storageId = storageId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getStorageStartDate() {
		return storageStartDate;
	}

	public void setStorageStartDate(String storageStartDate) {
		this.storageStartDate = storageStartDate;
	}

	public String getStorageStartEnd() {
		return storageStartEnd;
	}

	public void setStorageStartEnd(String storageStartEnd) {
		this.storageStartEnd = storageStartEnd;
	}

	public int getStorageBoxesNo() {
		return storageBoxesNo;
	}

	public void setStorageBoxesNo(int storageBoxesNo) {
		this.storageBoxesNo = storageBoxesNo;
	}

	public String getStorageStatus() {
		return storageStatus;
	}

	public void setStorageStatus(String storageStatus) {
		this.storageStatus = storageStatus;
	}

	public String getStorageApproveRejectRemark() {
		return storageApproveRejectRemark;
	}

	public void setStorageApproveRejectRemark(String storageApproveRejectRemark) {
		this.storageApproveRejectRemark = storageApproveRejectRemark;
	}

}