package com.team.devdungeon.controller;

import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.MyPageService;
import com.team.devdungeon.service.StoreService;
import com.team.devdungeon.util.SFTPFileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class StoreController {

    private final StoreService storeService;
    private final MyPageService myPageService;
    private final SFTPFileUtil sftpFileUtil;

    @GetMapping("/store")
    public ModelAndView store(HttpSession session) {
        ModelAndView mv = new ModelAndView("content/store");

        List<Map<String, Object>> iconList = (List<Map<String, Object>>) storeService.iconList();
        MyPageDTO profile = myPageService.profile((String)session.getAttribute("member_id"));

        mv.addObject("iconList", iconList);
        mv.addObject("profile", profile);

        return mv;
    }

    @GetMapping("/payShoppingBag")
    public String payShoppingBag() {
        return "content/payShoppingBag";
    }
    @GetMapping("/giftShoppingBag")
    public String giftShoppingBag() {
        return "content/giftShoppingBag";
    }

    @GetMapping("/couponChoice")
    public String couponChoice() {
        return "content/couponChoice";
    }

}
