package com.team.devdungeon.service;

import com.team.devdungeon.dao.LoginDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
@RequiredArgsConstructor
@Service
public class LoginServiceImpl {

    private final LoginDAO loginDAO;

}
