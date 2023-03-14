package com.team.devdungeon.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class Email {

    private static String emailAddr = "gazicom902@gmail.com";
    private static String name = "가지 커뮤니티";
    private static String passwd = "gazi1234";
    private static String hostName = "smtp.office365.com";
    private static int    port = 587;

    public static void simpleMail(
            String email, String toName, String title, String msg) throws EmailException {
        SimpleEmail mail = new SimpleEmail();//메일정보
        mail.setCharset("UTF-8");
        mail.setDebug(true);
        mail.setHostName(hostName);//보내는 서버 설정 = 고정
        mail.setAuthentication(emailAddr, passwd);//보내는 사람 인증 = 고정
        mail.setSmtpPort(port);//사용할 port = 고정
        mail.setStartTLSEnabled(true);//인증방법 = 고정
        mail.setFrom(emailAddr, name);//보내는 사람 email, 보내는 사람 이름 = 고정


        mail.addTo(email);// 받는 사람
        mail.setSubject(title);//제목
        mail.setMsg(msg);//본문내용
        mail.send();// 전송하기
    }

}
