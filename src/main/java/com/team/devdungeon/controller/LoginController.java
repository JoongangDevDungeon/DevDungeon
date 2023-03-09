package com.team.devdungeon.controller;

import com.team.devdungeon.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
@RequiredArgsConstructor
@Controller
public class LoginController {

    private final LoginService loginService;



}
