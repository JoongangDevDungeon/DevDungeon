package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class MyPageDTO {
    String member_id, member_name, member_intro, pfp_name, pfp_extension;
    int member_no, pfp_size, member_point, icon_no;
}
