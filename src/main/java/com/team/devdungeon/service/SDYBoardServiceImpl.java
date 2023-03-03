package com.team.devdungeon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.SDYBoardDAO;

@Service
public class SDYBoardServiceImpl implements SDYBoardService {

    @Autowired
    private SDYBoardDAO sdyBoardDAO;

    @Override
    public int boardCount() {
        return sdyBoardDAO.boardCount();
    }
}
