package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private String member_id, member_pw, member_name, member_email, member_tel, member_birth, join_date, exit_date, pass_update;
	private int ban_count, login_count, icon_no, member_grade, member_no;
}
