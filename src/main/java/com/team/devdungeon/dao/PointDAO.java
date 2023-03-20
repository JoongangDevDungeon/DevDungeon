package com.team.devdungeon.dao;

import com.team.devdungeon.dto.PointDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Repository
public class PointDAO {

    private final SqlSession sqlSession;

    public List<Map<String, Objects>> levelList() {

        return sqlSession.selectList("level.list");
    }

    public PointDTO name_check(PointDTO pointDTO) {

        return sqlSession.selectOne("point.name_check",pointDTO);
    }

    public int send_point(PointDTO pointDTO) {

        System.err.println("보내는 사람 :" + pointDTO.getSend_member_name());
        System.err.println("받는 사람 :" + pointDTO.getReceive_member_name());
        System.err.println("보낼 포인트 :" + pointDTO.getPoint());

        PointDTO receive_member_no = sqlSession.selectOne("point.receive_member_no",pointDTO);
        PointDTO send_member_no = sqlSession.selectOne("point.send_member_no",pointDTO);
        System.err.println("받는 사람 멤버 넘버 "+receive_member_no.getMember_no());
        System.err.println("보내는 사람 멤버 넘버 "+send_member_no.getMember_no());

        sqlSession.update("point.send_point", pointDTO);

        return sqlSession.update("point.receive_point", pointDTO);
    }
}
