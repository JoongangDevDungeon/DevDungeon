package com.team.devdungeon.service;

import com.team.devdungeon.dao.MessageDAO;
import lombok.RequiredArgsConstructor;

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

}
