package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.room;

import databaseConnection.DbConnect;

/**
 * roomController
 */
@Controller
public class roomController {

	@RequestMapping("/accommodationReport")
	public ModelAndView accommodationReport() {

		Connection conn = DbConnect.openConnection();
		ModelAndView model = new ModelAndView("accommodationReport");

		String sql = "SELECT * from room";
		ResultSet resultSet;
		ArrayList<room> rooms = new ArrayList<room>();
		int totalRooms = 0, totalAvailable = 0, totalFull = 0, alphaAvailable = 0, alphaFull = 0, betaAvailable = 0,
				betaFull = 0, deltaAvailable = 0, deltaFull = 0;

		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				room roomInstance = new room();
				int roomId = resultSet.getInt("roomId");
				String roomBlockName = resultSet.getString("roomBlockName");
				int roomLevel = resultSet.getInt("roomLevel");
				int roomNo = resultSet.getInt("roomNo");
				String roomStatus = resultSet.getString("roomStatus");
				int userId = resultSet.getInt("userId");

				roomInstance.setRoomId(roomId);
				roomInstance.setRoomBlockName(roomBlockName);
				roomInstance.setRoomLevel(roomLevel);
				roomInstance.setRoomNo(roomNo);
				roomInstance.setRoomStatus(roomStatus);
				roomInstance.setUserId(userId);

				if (roomInstance.getRoomBlockName().equalsIgnoreCase("alpha")) {
					if (roomInstance.getRoomStatus().equalsIgnoreCase("empty"))
						alphaAvailable++;
					else if (roomInstance.getRoomStatus().equalsIgnoreCase("full")) {
						alphaFull++;
					}
				} else if (roomInstance.getRoomBlockName().equalsIgnoreCase("beta")) {
					if (roomInstance.getRoomStatus().equalsIgnoreCase("empty"))
						betaAvailable++;
					else if (roomInstance.getRoomStatus().equalsIgnoreCase("full")) {
						betaFull++;
					}
				} else if (roomInstance.getRoomBlockName().equalsIgnoreCase("delta")) {
					if (roomInstance.getRoomStatus().equalsIgnoreCase("empty"))
						deltaAvailable++;
					else if (roomInstance.getRoomStatus().equalsIgnoreCase("full")) {
						deltaFull++;
					}
				}
				rooms.add(roomInstance);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		totalRooms = rooms.size();
		totalAvailable = alphaAvailable + betaAvailable + deltaAvailable;
		totalFull = alphaFull + betaFull + deltaFull;

		// System.out.println("Total Rooms: " + totalRooms);
		// System.out.println("totalAvailable: " + totalAvailable);
		// System.out.println("totalFull: " + totalFull);
		// System.out.println("alphaAvailable: " + alphaAvailable);
		// System.out.println("alphaFull: " + alphaFull);
		// System.out.println("betaAvailable: " + betaAvailable);
		// System.out.println("betaFull: " + betaFull);
		// System.out.println("deltaAvailable: " + deltaAvailable);
		// System.out.println("deltaFull: " + deltaFull);

		model.addObject("rooms", rooms);
		model.addObject("totalRooms", totalRooms);
		model.addObject("totalAvailable", totalAvailable);
		model.addObject("totalFull", totalFull);
		model.addObject("alphaAvailable", alphaAvailable);
		model.addObject("alphaFull", alphaFull);
		model.addObject("betaAvailable", betaAvailable);
		model.addObject("betaFull", betaFull);
		model.addObject("deltaAvailable", deltaAvailable);
		model.addObject("deltaFull", deltaFull);

		return model;
	}

}