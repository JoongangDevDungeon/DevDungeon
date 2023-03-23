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
        int result = 0;

        String userId = (String) session.getAttribute("member_id");
        String[] shoppingBag = request.getParameterValues("shoppingBag[]");
        String sellType = request.getParameter("sell_type");

        if(sellType.equals("pay")) {
            storeService.deleteCartOne(userId, null, sellType);
        }

        int productLogCount = storeService.selectProductLog(userId, shoppingBag);

        if(productLogCount < 1) {    // 구매한 아이콘이 없을 경우
            int productInsert = storeService.shoppingBagInsert(userId, shoppingBag, sellType);
            if(productInsert != 0) {
                result = 1; // 장바구니 정상 등록
            } else {
                result = 3; // 이미 구매 장바구니에 있을 경우
            }
        } else {
            result = 2; // 이미 구매한 아이콘이 있을 경우
        }

        return result;
    }

    @PostMapping("/deleteCartOne")
    @ResponseBody
    public void deleteCartOne(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");
        int product_no = Integer.parseInt(request.getParameter("product_no"));
        String sell_type = request.getParameter("sell_type");
        storeService.deleteCartOne(member_id, product_no, sell_type);
    }

    @GetMapping("/payShoppingBag")
    public ModelAndView payShoppingBag(HttpSession session, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String view_type = request.getParameter("type");
        if(session.getAttribute("member_id") != null) {
            List<Map<String, Object>> cart = storeService.selectPayShoppingBag(session.getAttribute("member_id"), view_type);
            if(cart.size() == 0) {
                mv.addObject("error", "empty_payBag");
                mv.setViewName("content/payShoppingBag");
            } else {
                mv.addObject("type", view_type);
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
    public ModelAndView couponChoice(HttpSession session) {
        ModelAndView mv = new ModelAndView("content/couponChoice");
        String member_id = (String) session.getAttribute("member_id");
        List<Map<String, Object>> couponList = storeService.couponList(member_id);
        mv.addObject("couponList", couponList);
        return mv;
    }

    @PostMapping("/payProduct")
    @ResponseBody
    public int payProduct(HttpSession session, @RequestParam int result_price, @RequestParam String pay_type) {
        int result = 0;

        List<Map<String, Object>> productInfo = storeService.checkProductCount(session.getAttribute("member_id"));

        Map<String, Object> deleteCartList = new HashMap<>();
        for(Map<String, Object> product : productInfo) {
            int product_cnt = (int) product.get("product_sell_cnt");
            int product_no = (int) product.get("product_no");

            if(product_cnt < 1) {
                deleteCartList.put("product_no", product_no);
            }
        }

        if(!deleteCartList.isEmpty()) {
            storeService.deleteCart(deleteCartList, session.getAttribute("member_id"));
            result = 2;
        } else {
            int member_point = storeService.checkPoint(session.getAttribute("member_id"));
            if(member_point >= result_price) result = storeService.payProduct(result_price, session.getAttribute("member_id"), pay_type);
        }

        return result;
    }

}
