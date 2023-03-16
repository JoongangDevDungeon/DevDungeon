package com.team.devdungeon.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;

import java.util.Random;

public class Email {

    private static String emailAddr = "lms1994@outlook.kr";
    private static String passwd = "wnsgh1533";
    private static String hostName = "smtp.office365.com";
    private static int    port = 587;
    private static String name = "가지 커뮤니티";

    public static String att_num() {
        Random r = new Random();
        int num = r.nextInt(999999 - 100000 + 1)+ 100000;
        return Integer.toString(num);
    }

    public static void Mail(String email, String toName, String title, String msg) throws EmailException {
        HtmlEmail mail = new HtmlEmail();//메일정보
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
