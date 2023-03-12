package com.team.devdungeon.controller;

import com.team.devdungeon.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class StoreController {

    private final StoreService storeService;

    @GetMapping("/store")
    public String level() {
        return "content/store";
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
