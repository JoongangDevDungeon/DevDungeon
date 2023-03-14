package com.team.devdungeon.service;

import com.team.devdungeon.dao.IconDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class IconServiceImpl implements IconService{

    private final IconDAO iconDAO;

}
