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
    sqlSession.insert("sign.signup",signDTO);/*회원 정보 insert*/
    sqlSession.insert("sign.signup_agree",signDTO);/*회원 약관 동의 insert*/
    sqlSession.insert("sign.point_new",signDTO);/*회원 포인트 생성*/
    }

    public SignDTO checkid(SignDTO signDTO) {/*아이디 중복 검사*/
        return sqlSession.selectOne("sign.check",signDTO);
    }

    public void mail_code(SignDTO signDTO) {/*인증 코드*/
        sqlSession.insert("sign.code", signDTO);
    }

    public SignDTO check_code(SignDTO signDTO) {/*인증 코드 인증*/
        return sqlSession.selectOne("sign.check_code",signDTO);
    }

    public SignDTO check_name(SignDTO signDTO) {/*닉네임 중복 검사*/
        return sqlSession.selectOne("sign.check_name",signDTO);
    }

    public SignDTO check_final(SignDTO signDTO) {
        return sqlSession.selectOne("sign.check_final",signDTO);
    }
}
