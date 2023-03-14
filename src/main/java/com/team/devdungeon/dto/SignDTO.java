package com.team.devdungeon.dto;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class SignDTO {
    String member_name, member_id, member_pw, member_email, member_tel, member_birth;
    String agree1, agree2, agree3;
    String verify_code;
    int year, month, day;
    int count;/*아이디 중복 검사 서치용*/
}
