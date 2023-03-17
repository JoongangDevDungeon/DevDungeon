package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Repository
public class StoreDAO {

    private final SqlSession sqlSession;

    public List<Map<String, Object>> iconList() {
        return sqlSession.selectList("store.iconList");
    }

    public int shoppingBagInsert(Map<String, Object> cartInfo) {
        System.out.println(cartInfo);
        int result = 0;
        try {
            result = sqlSession.insert("store.shoppingBagInsert", cartInfo);
        } catch (DuplicateKeyException e) {
            System.out.println("데이터 삽입 중 중복된 데이터가 있습니다.");
        }

        return result;
    }
}
