package com.team.devdungeon.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class MyPageDTO {
    String member_id, member_name, member_intro, member_email, member_tel, pfp_name, pfp_extension, profile_image, emo_img_name, emo_img_extension, icon_image;
    int member_no, pfp_size, member_point, icon_no, member_level;
    LocalDate member_birth;
}
