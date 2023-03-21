package com.team.devdungeon.util;

import org.springframework.stereotype.Component;

@Component
public class TextChangeUtil {

	public String changeText(String txt) {
		txt = txt.replaceAll("<", "&lt;");
		txt = txt.replaceAll(">", "&gt;");
		return txt;
	}
}
