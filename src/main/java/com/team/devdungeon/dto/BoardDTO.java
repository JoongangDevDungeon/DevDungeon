package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class BoardDTO {
	private int board_no, board_like, status_no;
	private String board_title, member_id, board_date;
}