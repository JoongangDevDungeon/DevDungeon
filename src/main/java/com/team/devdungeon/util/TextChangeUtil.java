package com.team.devdungeon.util;

import org.springframework.stereotype.Component;

@Component
public class TextChangeUtil {

	public String changeText(String txt) {
		txt = txt.replaceAll("<", "&lt;");
		txt = txt.replaceAll(">", "&gt;");
		return txt;
	}
	public String changeEnter(String txt) {
		txt = txt.replaceAll("\n", "<br>");
		return txt;
	}
}
