package com.team.devdungeon.service;

import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dao.MessageDAO;
import com.team.devdungeon.dto.CSJshowDTO;

import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MessageServiceImpl implements MessageService {

    private final MessageDAO messageDAO;

	@Override
	public void msgReceive(Map<String, Object> map) {
		messageDAO.msgReceive(map);
		
	}

	@Override
	public int messageIdCheck(String member_name) {
		return messageDAO.messageIdCheck(member_name);
	}

	@Override
	public PageInfo<Map<String, Object>> msgList(CSJshowDTO dto) {
		return messageDAO.msgList(dto);
	}

	@Override
	public int msgRead(String msgNo) {
		return messageDAO.msgRead(msgNo);
	}

	@Override
	public int msgDel(String msgNo) {
		return messageDAO.msgDel(msgNo);
	}

	@Override
	public int newMsgCnt(String memberName) {
		return messageDAO.newMsgCnt(memberName);
	}

}
