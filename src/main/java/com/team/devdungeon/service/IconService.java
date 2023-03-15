package com.team.devdungeon.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface IconService {
    int iconApply(Map<String, Object> map, MultipartFile iconFile);
}
