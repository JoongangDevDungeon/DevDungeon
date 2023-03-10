package com.team.devdungeon.service;

import com.team.devdungeon.dao.StoreDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class StoreServiceImpl implements StoreService {

    private final StoreDAO storeDAO;

}
