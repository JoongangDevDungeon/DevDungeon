package com.team.devdungeon.service;

import com.team.devdungeon.dao.PointDAO;
import com.team.devdungeon.dto.PointDTO;
import lombok.RequiredArgsConstructor;
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

    @Override
    public PointDTO name_check(PointDTO pointDTO) {
        return pointDAO.name_check(pointDTO);
    }

    @Override
    public int send_point(PointDTO pointDTO) {
        return pointDAO.send_point(pointDTO);
    }

    @Override
    public int mypoint(PointDTO pointDTO) {

        return pointDAO.mypoint(pointDTO);
    }


}
