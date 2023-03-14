package com.team.devdungeon.service;

import com.team.devdungeon.dto.SignDTO;

public interface SignService {

    SignDTO signup(SignDTO signDTO);

    SignDTO checkid(SignDTO signDTO);
}
