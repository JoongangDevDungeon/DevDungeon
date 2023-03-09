package com.team.devdungeon.service;

import com.team.devdungeon.dao.SignDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignServiceImpl implements SignService {

    @Autowired
    private SignDAO signDAO;


}
