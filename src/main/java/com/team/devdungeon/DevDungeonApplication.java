package com.team.devdungeon;

import com.jcraft.jsch.JSchException;
import com.team.devdungeon.util.SFTPFileUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DevDungeonApplication {

    public static void main(String[] args) throws JSchException {
//        SFTPFileUtil sftpFileUtil = new SFTPFileUtil();
//        sftpFileUtil.connect();
        SpringApplication.run(DevDungeonApplication.class, args);
    }

}
