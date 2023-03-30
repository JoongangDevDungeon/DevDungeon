package com.team.devdungeon.dao;

import com.team.devdungeon.dto.SignDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SignDAO {

    @Autowired
    private SqlSession sqlSession;

    public void signup(SignDTO signDTO) {/*회원 가입*/
    sqlSession.insert("sign.signup",signDTO);/*회원 정보 insert*/
    sqlSession.insert("sign.new_account",signDTO);
    sqlSession.insert("sign.signup_agree",signDTO);/*회원 약관 동의 insert*/
    sqlSession.insert("sign.point_new",signDTO);/*회원 포인트 생성*/
    }

    public SignDTO checkid(SignDTO signDTO) {/*아이디 중복 검사*/
        return sqlSession.selectOne("sign.check",signDTO);
    }/*ID 중복 검사*/

    public void mail_code(SignDTO signDTO) {/*인증 코드*/
        sqlSession.insert("sign.code", signDTO);
    }/*임시 테이블 저장*/

    public SignDTO check_code(SignDTO signDTO) {/*인증 코드 인증*/
        return sqlSession.selectOne("sign.check_code",signDTO);
    }/*인증번호 검사*/

    public SignDTO check_name(SignDTO signDTO) {/*닉네임 중복 검사*/
        return sqlSession.selectOne("sign.check_name",signDTO);
    }/*닉네임 중복 검사*/

    public SignDTO check_final(SignDTO signDTO) {
        return sqlSession.selectOne("sign.check_final",signDTO);
    }/*최종 검사*/

    public int accountInquiry(SignDTO signDTO) {

     return sqlSession.update("sign.accountInquiry",signDTO);
    }

    public SignDTO find_account(SignDTO signDTO) {

        return sqlSession.selectOne("sign.check_account", signDTO);
    }

    public int change_pw(SignDTO signDTO) {



        return sqlSession.update("sign.change_pw",signDTO);
    }

    public String getMemberId(String memberEmail) {
        return sqlSession.selectOne("sign.getMemberId", memberEmail);
    }
}
