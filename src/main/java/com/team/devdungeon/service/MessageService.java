package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

public interface MessageService {

	void msgReceive(Map<String, Object> map);

	int messageIdCheck(String member_name);

	List<Map<String, Object>> msgList(String member_id);



}
