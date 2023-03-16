package com.team.devdungeon.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CSJshowDTO {
	private int pageNo,pageSize,category;
	private String searchType,searchValue,member_id;
}
