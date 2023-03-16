package com.team.devdungeon.service;

import java.util.Map;

public interface MessageService {

	void msgReceive(Map<String, Object> map);

	int messageIdCheck(String member_name);



}
