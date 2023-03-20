package com.team.devdungeon.service;

import com.team.devdungeon.dto.PointDTO;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface PointService {

    List<Map<String, Objects>> levelList();

    PointDTO name_check(PointDTO pointDTO);

    int send_point(PointDTO pointDTO);
}
