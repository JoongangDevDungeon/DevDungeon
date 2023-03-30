package com.team.devdungeon.service;

import com.team.devdungeon.dto.SignDTO;

public interface SignService {

    SignDTO signup(SignDTO signDTO);

    SignDTO checkid(SignDTO signDTO);

    SignDTO mail_code(SignDTO signDTO);

    SignDTO check_code(SignDTO signDTO);

    SignDTO check_name(SignDTO signDTO);

    SignDTO check_final(SignDTO signDTO);

    int accountInquiry(SignDTO signDTO);

    SignDTO find_account(SignDTO signDTO);

    int change_pw(SignDTO signDTO);

    String getMemberId(String memberEmail);
}
