package com.team.devdungeon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.SDYDAO;

@Service
public class SDYServiceImpl implements SDYService {

    @Autowired
    private SDYDAO sdyDAO;

    @Override
    public int boardCount() {
        return sdyDAO.boardCount();
    }
}
