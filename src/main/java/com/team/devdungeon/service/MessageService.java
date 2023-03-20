package com.team.devdungeon.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;

public interface MessageService {

	void msgReceive(Map<String, Object> map);

	int messageIdCheck(String member_name);

	PageInfo<Map<String, Object>> msgList(CSJshowDTO dto);

    int msgRead(String msgNo);

	int msgDel(String msgNo);

	int newMsgCnt(String memberName);
}
