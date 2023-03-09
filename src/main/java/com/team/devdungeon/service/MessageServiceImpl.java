package com.team.devdungeon.service;

import com.team.devdungeon.dao.MessageDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MessageServiceImpl implements MessageService {

    private final MessageDAO messageDAO;

}
