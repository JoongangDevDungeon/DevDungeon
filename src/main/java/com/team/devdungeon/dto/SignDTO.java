package com.team.devdungeon.dto;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class SignDTO {
    String member_name, member_id, member_pw, member_email, member_tel, member_birth;
    String agree_no1,agree1, agree_no2,agree2, agree_no3,agree3;
    String verify_code;
    int year, month, day;

    int number, check_code;
    int count;/*아이디 중복 검사 서치용*/
}
