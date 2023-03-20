package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
    List<Map<String, Object>> iconList();
    int shoppingBagInsert(String userId, String[] shoppingBag, String sellType);
    List<Map<String, Object>> selectPayShoppingBag(Object memberId);
    List<Map<String, Object>> selectGiftShoppingBag(Object memberId);
    List<Map<String, Object>> couponList();
    int payProduct(int resultPrice, Object memberId);
    int selectProductLog(String userId, String[] shoppingBag);
    int checkPoint(Object memberId);
}
