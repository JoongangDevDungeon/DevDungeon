package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
    List<Map<String, Object>> iconList(Map<String, Object> pages);
    int iconListCount(Map<String, Object> pages);
    int shoppingBagInsert(String userId, String[] shoppingBag, String sellType);
    List<Map<String, Object>> selectPayShoppingBag(Object memberId, String view_type);
    List<Map<String, Object>> selectGiftShoppingBag(Object memberId);
    List<Map<String, Object>> couponList(String member_id);
    int payProduct(int resultPrice, Object memberId, String pay_type, Integer coupon_no);
    int selectProductLog(String userId, String[] shoppingBag);
    int checkPoint(Object memberId);
    List<Map<String, Object>> checkProductCount(Object memberId);
    void deleteCart(Map<String, Object> deleteCartList, Object memberId);
    void deleteCartOne(String userId, Integer product_no, String sellType);
}
