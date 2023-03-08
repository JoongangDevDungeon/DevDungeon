package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class QuestionBoardDTO {
	private String question_board_title, question_board_date, question_board_content;
	private int question_board_no, member_no, question_board_status;
}
