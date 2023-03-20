package com.team.devdungeon.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointDTO {

    String member_name, send_member_name, receive_member_name;

    int count, point, member_no;
    int send_member_no, receive_member_no;
}
