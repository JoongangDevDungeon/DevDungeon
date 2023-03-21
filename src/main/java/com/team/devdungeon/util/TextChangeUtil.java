package com.team.devdungeon.util;

public class TextChangeUtil {

	public String changeText(String txt) {
		txt = txt.replaceAll("<", "&lt;");
		txt = txt.replaceAll(">", "&gt;");
		return txt;
	}
}
