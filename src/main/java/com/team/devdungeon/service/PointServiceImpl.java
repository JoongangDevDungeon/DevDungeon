package com.team.devdungeon.service;

import com.team.devdungeon.dao.PointDAO;
import com.team.devdungeon.dao.SignDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Service
public class PointServiceImpl implements PointService {

    private final PointDAO pointDAO;


    @Override
    public List<Map<String, Objects>> levelList() {
        return pointDAO.levelList();
    }
}
