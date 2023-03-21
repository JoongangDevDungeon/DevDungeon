package com.team.devdungeon.controller;

import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.MyPageService;
import com.team.devdungeon.service.StoreService;
import com.team.devdungeon.util.SFTPFileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView store(HttpServletRequest request, HttpSession session, @RequestParam(value="pageNo", defaultValue = "1") int pageNo) {
        ModelAndView mv = new ModelAndView();

        if(session.getAttribute("member_id") != null || session.getAttribute("id") != null ) {
            MyPageDTO profile = myPageService.profile((String)session.getAttribute("member_id"));

            Map<String, Object> pages = new HashMap<String, Object>();

            String searchValue = request.getParameter("searchValue");
            pages.put("searchValue", searchValue);

            int startPage = (pageNo*8)-8;
            int totalCount = storeService.iconListCount(pages);
            int lastPage = (int)Math.ceil((double)totalCount/8);

            pages.put("startPage", startPage);
            pages.put("lastPage", lastPage);

            List<Map<String, Object>> iconList = storeService.iconList(pages);

            mv.addObject("pages", pages);
            mv.addObject("iconList", iconList);
            mv.addObject("profile", profile);
            mv.addObject("pageNo", pageNo);

            System.out.println(totalCount);
            System.out.println(startPage);
            System.out.println(lastPage);

            System.out.println("pages : " + pages);
            System.out.println("iconList : " + iconList);
            System.out.println("profile : " + profile);
            System.out.println("pageNo : " + pageNo);

            mv.setViewName("content/store");
        } else {
            mv.setViewName("redirect:/index?error=not_login");
        }

        return mv;
    }

    @PostMapping("/shoppingBag")
    @ResponseBody
    public int shoppingBag(HttpServletRequest request) {
        HttpSession session = request.getSession();

        String userId = (String) session.getAttribute("member_id");
        String[] shoppingBag = request.getParameterValues("shoppingBag[]");
        String sellType = request.getParameter("sell_type");

        int result = storeService.selectProductLog(userId, shoppingBag);
        if(result < 1) {    // 구매한 아이콘이 없을 때
            result = storeService.shoppingBagInsert(userId, shoppingBag, sellType);
            if(result != 0) {
                result = 1;
            } else {
                result = 3;
            }
        } else {
            result = 2;
        }

        return result;
    }


    @GetMapping("/payShoppingBag")
    public ModelAndView payShoppingBag(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        if(session.getAttribute("member_id") != null) {
            List<Map<String, Object>> cart = storeService.selectPayShoppingBag(session.getAttribute("member_id"));
            System.out.println("cart : " + cart);
            if(cart.size() == 0) {
                mv.addObject("error", "empty_payBag");
                mv.setViewName("content/payShoppingBag");
            } else {
                mv.addObject("cart", cart);
                mv.setViewName("content/payShoppingBag");
            }
        } else {
            mv.setViewName("redirect:/index?error=not_login");
        }
        return mv;
    }
    @GetMapping("/giftShoppingBag")
    public ModelAndView giftShoppingBag(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        if(session.getAttribute("member_id") != null) {
            mv.setViewName("content/giftShoppingBag");
            List<Map<String, Object>> cart = storeService.selectGiftShoppingBag(session.getAttribute("member_id"));
            mv.addObject("cart", cart);
        } else {
            mv.setViewName("redirect:/index?error=not_login");
        }
        return mv;
    }

    @GetMapping("/couponChoice")
    public ModelAndView couponChoice() {
        ModelAndView mv = new ModelAndView("content/couponChoice");
        List<Map<String, Object>> couponList = storeService.couponList();
        mv.addObject("couponList", couponList);
        return mv;
    }

    @PostMapping("/payProduct")
    @ResponseBody
    public int payProduct(@RequestParam int result_price, HttpSession session) {
        int member_point = storeService.checkPoint(session.getAttribute("member_id"));
        int result = 0;
        System.out.println(member_point);
        System.out.println(result_price);
        System.out.println(member_point >= result_price);
        if(member_point >= result_price) {
            result = storeService.payProduct(result_price, session.getAttribute("member_id"));
        }
        System.out.println(result);
        return result;
    }

}
