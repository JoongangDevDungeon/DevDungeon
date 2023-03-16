package com.team.devdungeon.service;

import com.team.devdungeon.dao.StoreDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.*;

@RequiredArgsConstructor
@Service
public class StoreServiceImpl implements StoreService {

    private final StoreDAO storeDAO;

    @Override
    public List<Map<String, Object>> iconList() {
        List<Map<String, Object>> result = storeDAO.iconList();

        InputStream inputStream = null;
        ByteArrayOutputStream baos = null;
        byte[] buffer = null;
        byte[] imageData = null;

//        List<Map<String, Object>> resutList = new ArrayList<>();
//
//        for(Map<String, Object> map : result) {
//            try {
//                JSch jsch = new JSch();
//                Session session = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
//                session.setPassword(FTP_PASSWORD);
//                session.setConfig("StrictHostKeyChecking", "no");
//                session.connect();
//                ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
//                sftpChannel.connect();
//
//                String emo_img_name = (String) map.get("emo_img_name");
//                String emo_img_extension = (String) map.get("emo_img_extension");
//                inputStream = sftpChannel.get(remotePath + emo_img_name + "." + emo_img_extension);
//
//                baos = new ByteArrayOutputStream();
//                buffer = new byte[1024 * 8];
//                int len;
//                while ((len = inputStream.read(buffer)) > -1) {
//                    baos.write(buffer, 0, len);
//                }
//                baos.flush();
//                imageData = baos.toByteArray();
//
//                String icon_image = Base64.getEncoder().encodeToString(imageData);
//                map.put("icon_image", icon_image);
//                sftpChannel.exit();
//                session.disconnect();
//            } catch (Exception e) {
//                e.printStackTrace();
//                System.out.println("아이콘 이미지 로딩중 에러 발생");
//            }
//            resutList.add(map);
//        }

        return result;
    }

    @Override
    public int shoppingBagInsert(String userId, String[] shoppingBag, String sellType) {
        Map<String, Object> cartInfo = new HashMap<>();
        List<String> cart = new ArrayList<>();

        for(String ele : shoppingBag) {
            cart.add(ele);
        }

        cartInfo.put("member_id", userId);
        cartInfo.put("cart", cart);
        cartInfo.put("sell_type", sellType);

        return storeDAO.shoppingBagInsert(cartInfo);
    }

}
