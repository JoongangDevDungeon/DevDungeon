package com.team.devdungeon.service;

import com.team.devdungeon.dao.SignDAO;
import com.team.devdungeon.dto.SignDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignServiceImpl implements SignService {
    @Autowired
    private SignDAO signDAO;

    @Override
    public SignDTO signup(SignDTO signDTO) {

        int year = signDTO.getYear();
        int month = signDTO.getMonth();
        int day = signDTO.getDay();

        signDTO.setMember_birth(year+ "-"+ month + "-" + day);
        signDAO.signup(signDTO);
        return signDTO;
    }

    @Override
    public SignDTO checkid(SignDTO signDTO) {


        signDAO.checkid(signDTO);
        return signDTO;
    }
}
