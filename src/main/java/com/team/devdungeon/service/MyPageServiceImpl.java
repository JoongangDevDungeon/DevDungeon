package com.team.devdungeon.service;

import com.team.devdungeon.dao.MyPageDAO;
import com.team.devdungeon.dao.PointDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {

    private final MyPageDAO myPageDAO;


}
