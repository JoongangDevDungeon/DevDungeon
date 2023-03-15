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

    public SignDTO checkid(SignDTO signDTO) {/*중복 확인*/
        return sqlSession.selectOne("sign.check",signDTO);
    }

    public void mail_code(SignDTO signDTO) {
        System.out.println(signDTO.getMember_id());
        System.out.println(signDTO.getVerify_code());
        System.out.println(signDTO.getMember_email());

        sqlSession.insert("sign.code", signDTO);
    }

}
