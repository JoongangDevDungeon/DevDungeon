package com.team.devdungeon.service;

import com.team.devdungeon.dao.SignDAO;
import com.team.devdungeon.dto.SignDTO;

public interface SignService {

    SignDTO signup(SignDTO signDTO);

    SignDTO checkid(SignDTO signDTO);

    SignDTO mail_code(SignDTO signDTO);

    SignDTO check_code(SignDTO signDTO);

    SignDTO check_name(SignDTO signDTO);

    SignDTO check_final(SignDTO signDTO);
}
