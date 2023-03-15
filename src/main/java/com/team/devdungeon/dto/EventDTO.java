package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class EventDTO {
    private int status_no, event_no, tag_no;
    private String event_title, event_content, event_date, event_update;
}
