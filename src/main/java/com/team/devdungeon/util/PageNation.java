package com.team.devdungeon.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class PageNation {

	public List<Integer> paging(int totalCount) {
		List<Integer> pages = new ArrayList<Integer>();
		int pageNo=0;
		if(totalCount/10==0) {
			pageNo = totalCount/10;
		}else {
			pageNo = (totalCount/10)+1;
		}
		for (int i = 0; i < pageNo; i++) {
			pages.add(i+1);
		}
		return pages;
				
	}

}
