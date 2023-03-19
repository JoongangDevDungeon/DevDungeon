package com.team.devdungeon.dto;

import lombok.Data;

@Data
public class CouponDTO {
    private int coupon_type, event_no, coupon_content;
    private String coupon_name, coupon_start, coupon_end;
}
