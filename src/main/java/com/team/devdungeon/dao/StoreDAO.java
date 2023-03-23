package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Repository
public class StoreDAO {

    private final SqlSession sqlSession;

    public List<Map<String, Object>> iconList(Map<String, Object> pages) {
        return sqlSession.selectList("store.iconList", pages);
    }

    public int selectProductLog(Map<String, Object> cartInfo) {
        return sqlSession.selectOne("store.selectProductLog", cartInfo);
    }

    public int shoppingBagInsert(Map<String, Object> cartInfo) {
        int result = 0;
        try {
            result = sqlSession.insert("store.shoppingBagInsert", cartInfo);
        } catch (DuplicateKeyException e) {
            System.out.println("데이터 삽입 중 중복된 데이터가 있습니다.");
        }

        return result;
    }

    public List<Map<String, Object>> selectPayShoppingBag(Map<String, Object> cartInfo) {
        return sqlSession.selectList("store.selectPayShoppingBag", cartInfo);
    }

    public List<Map<String, Object>> selectGiftShoppingBag(Object memberId) {
        return sqlSession.selectList("store.selectGiftShoppingBag", memberId);
    }

    public List<Map<String, Object>> couponList(String member_id) {
        return sqlSession.selectList("store.couponList", member_id);
    }

    public int checkPoint(Object memberId) {
        return sqlSession.selectOne("store.checkPoint", memberId);
    }

    public int payProduct(Map<String, Object> payInfo) {
        int result = sqlSession.update("store.updatePoint", payInfo);
        if(result == 1) {
            List<Map<String, Object>> cart = sqlSession.selectList("store.selectPayShoppingBag", payInfo.get("member_id"));
            List<Object> icons = new ArrayList<>();
            for(Map<String, Object> map : cart) {
                icons.add(map.get("product_no"));
            }
            payInfo.put("icons", icons);

            sqlSession.insert("store.insertProductNo", payInfo);
            sqlSession.update("store.productSellCountDown", payInfo);
            result = sqlSession.delete("store.deleteCart", payInfo);
        }

        if(result != 0) {
            result = 1;
        }

        return result;
    }

    public int iconListCount(Map<String, Object> pages) {
        return sqlSession.selectOne("store.iconListCount", pages);
    }

    public List<Map<String, Object>> checkProductCount(Object memberId) {
        return sqlSession.selectList("store.checkProductCount", memberId);
    }

    public void deleteCart(Map<String, Object> info) {
        sqlSession.delete("store.deleteCartList", info);
    }

    public void deleteCartOne(Map<String, Object> cartInfo) {
        sqlSession.delete("store.deleteCartOne", cartInfo);
    }
}
