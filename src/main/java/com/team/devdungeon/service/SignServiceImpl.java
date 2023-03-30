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

        signDTO.setMember_birth(year + "-" + month + "-" + day);
        signDAO.signup(signDTO);

        return signDTO;
    }

    @Override
    public SignDTO checkid(SignDTO signDTO) {

        return signDAO.checkid(signDTO);
    }


    @Override
    public SignDTO mail_code(SignDTO signDTO) {
        signDAO.mail_code(signDTO);
        return signDTO;
    }

    @Override
    public SignDTO check_code(SignDTO signDTO) {

        return signDAO.check_code(signDTO);
    }

    @Override
    public SignDTO check_name(SignDTO signDTO) {
        return signDAO.check_name(signDTO);
    }

    @Override
    public SignDTO check_final(SignDTO signDTO) {
        return signDAO.check_final(signDTO);
    }

    @Override
    public int accountInquiry(SignDTO signDTO) {

        return signDAO.accountInquiry(signDTO);
    }

    @Override
    public SignDTO find_account(SignDTO signDTO) {

        return signDAO.find_account(signDTO);
    }

    @Override
    public int change_pw(SignDTO signDTO) {

        return signDAO.change_pw(signDTO);
    }

    @Override
    public String getMemberId(String memberEmail) {
        return signDAO.getMemberId(memberEmail);
    }


}
