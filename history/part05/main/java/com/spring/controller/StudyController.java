package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.common.util.CommonUtil;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("study")
@RestController
public class StudyController {

    @GetMapping("getMessage1")
    public User getMessage1() {
        log.info(" :: Study.getMessage1 :: ");
        List list = new ArrayList();
        User user = new User("����", "1", list);
        return user;
    }

    @GetMapping("getMessage2")
    public Map getMessage2() {
        log.info(" :: Study.getMessage2 :: ");
        Map map = new HashMap();
        map.put("name", CommonUtil.getSelect());
        return map;
    }

    @GetMapping("exceptionByZero")
    public Map exceptionByZero() {
        log.info(" :: Study.exceptionByZero :: ");
        System.out.println(1/0);
        return new HashMap();
    }

}

@Data
@AllArgsConstructor
class User {
    private String name;
    private String no;
    List list;
}