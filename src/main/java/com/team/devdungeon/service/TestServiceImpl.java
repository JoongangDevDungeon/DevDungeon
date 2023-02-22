package com.team.devdungeon.service;

import com.team.devdungeon.dao.TestDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDAO testDAO;

    @Override
    public int boardCount() {
        return testDAO.boardCount();
    }
}
