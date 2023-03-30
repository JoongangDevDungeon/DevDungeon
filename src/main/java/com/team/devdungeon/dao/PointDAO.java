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


        int receive_member_no = sqlSession.selectOne("point.receive_member_no",pointDTO);
        int send_member_no = sqlSession.selectOne("point.send_member_no",pointDTO);

        pointDTO.setSend_member_no(send_member_no);
        pointDTO.setReceive_member_no(receive_member_no);

        sqlSession.update("point.send_point", pointDTO);

        return sqlSession.update("point.receive_point", pointDTO);
    }

    public int mypoint(PointDTO pointDTO) {
        int send_member_no = sqlSession.selectOne("point.send_member_no",pointDTO);
        pointDTO.setSend_member_no(send_member_no);


        return sqlSession.selectOne("point.my_point",pointDTO);
    }
}
