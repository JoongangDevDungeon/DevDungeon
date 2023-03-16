package com.team.devdungeon;

import com.jcraft.jsch.JSchException;
import com.team.devdungeon.util.SFTPFileUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DevDungeonApplication {

    public static void main(String[] args) throws JSchException {
        SpringApplication.run(DevDungeonApplication.class, args);
        SFTPFileUtil sftpFileUtil = new SFTPFileUtil();
        sftpFileUtil.connect();
    }

}
