package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class LoginDTO {
    private int member_no, login_count, ban_count, member_grade;
    private String member_name, member_id, member_pw, member_birth, pass_update;
}
