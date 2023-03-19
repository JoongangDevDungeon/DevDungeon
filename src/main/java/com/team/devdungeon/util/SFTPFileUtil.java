package com.team.devdungeon.util;

import com.jcraft.jsch.*;
import org.springframework.stereotype.Component;

import java.io.*;

@Component
public class SFTPFileUtil {
    public static Session session;
    public static ChannelSftp channelSftp;

    public static final String FTP_USER = "woori";
    public static final String FTP_PASSWORD = "0326655522";
    public static final String FTP_HOST = "172.30.1.91";
    public static final int FTP_PORT = 22;
    public static final String remotePath = "/home/woori/ftp/files/";

    // SSH 연결 생성
    public void connect() throws JSchException {
        System.out.println("FTP 연결 시작");
        JSch jsch = new JSch();
        session = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
        session.setPassword(FTP_PASSWORD);
        session.setConfig("StrictHostKeyChecking", "no");
        session.connect();
//        Channel channel = session.openChannel("sftp");
//        channel.connect();
//        channelSftp = (ChannelSftp) channel;
        System.out.println("FTP 연결 완료");
    }

    // SSH 연결 종료
    public void disconnect() {
        if (channelSftp != null) {
            channelSftp.disconnect();
        }
        if (session != null) {
            session.disconnect();
        }
    }

    // 파일 업로드
    public void upload(String filePath, String fileName) throws JSchException, SftpException, IOException {
        FileInputStream inputStream = new FileInputStream(new File(filePath));
        channelSftp.put(inputStream, fileName);
    }

    // 파일 다운로드
    public void download(String filePath, String fileName, String localFilePath) throws JSchException, SftpException, IOException {
        OutputStream outputStream = new FileOutputStream(new File(localFilePath));
        channelSftp.get(filePath + fileName, outputStream);
    }


}
