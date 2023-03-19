package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
    List<Map<String, Object>> iconList();
    int shoppingBagInsert(String userId, String[] shoppingBag, String sellType);
    List<Map<String, Object>> selectPayShoppingBag(Object memberId);
}
