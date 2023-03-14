package com.team.devdungeon.dao;

import com.team.devdungeon.dto.SignDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;

@Repository
public class SignDAO {

    @Autowired
    private SqlSession sqlSession;


    public void signup(SignDTO signDTO) {/*회원 가입*/
    sqlSession.insert("sign.signup",signDTO);
    }


    public void checkid(SignDTO signDTO) {
        System.out.println("DAO 전달 값" + signDTO.getMember_id());

        sqlSession.selectOne("sign.check",signDTO);
    }


}
