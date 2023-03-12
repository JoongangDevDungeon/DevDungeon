package com.team.devdungeon.service;

import com.team.devdungeon.dao.LoginDAO;
import com.team.devdungeon.dto.LoginDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
@RequiredArgsConstructor
@Service
public class LoginServiceImpl implements  LoginService{

    private final LoginDAO loginDAO;

    @Override
    public LoginDTO login(LoginDTO loginInfo) {
        return loginDAO.login(loginInfo);
    }
}
