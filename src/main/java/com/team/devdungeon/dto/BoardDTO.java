<<<<<<< HEAD
package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class BoardDTO {
	private int board_no, board_like, status_no, board_read;
	private String board_title, member_id, board_date;

=======
package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class BoardDTO {
	private int board_no, board_like, status_no;
	private String board_title, member_id, board_date;
>>>>>>> branch 'master' of https://github.com/JoongangDevDungeon/DevDungeon.git
}