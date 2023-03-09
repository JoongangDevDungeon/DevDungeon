package com.team.devdungeon.service;

import com.team.devdungeon.dao.PointDAO;
import com.team.devdungeon.dao.SignDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class PointServiceImpl implements PointService {

    private final PointDAO pointDAO;


}
