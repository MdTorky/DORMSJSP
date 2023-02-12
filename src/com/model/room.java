package com.model;

/**
 * room
 */
public class room {

    int roomId;
    int userId;
    String roomBlockName;
    int roomLevel;
    int roomNo;
    String roomStatus;
    
    public int getRoomId() {
        return roomId;
    }
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getRoomBlockName() {
        return roomBlockName;
    }
    public void setRoomBlockName(String roomBlockName) {
        this.roomBlockName = roomBlockName;
    }
    public int getRoomLevel() {
        return roomLevel;
    }
    public void setRoomLevel(int roomLevel) {
        this.roomLevel = roomLevel;
    }
    public int getRoomNo() {
        return roomNo;
    }
    public void setRoomNo(int roomNo) {
        this.roomNo = roomNo;
    }
    public String getRoomStatus() {
        return roomStatus;
    }
    public void setRoomStatus(String roomStatus) {
        this.roomStatus = roomStatus;
    }
}