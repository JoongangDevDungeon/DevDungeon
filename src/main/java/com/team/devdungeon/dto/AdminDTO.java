package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class AdminDTO {
    private int count, admin_grade;
    private String admin_id, admin_pw;
}
