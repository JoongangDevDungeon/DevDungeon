package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class AnswerDTO {
    private int answer_board_no, question_board_no;
    private String answer_board_title, answer_board_content;
}
