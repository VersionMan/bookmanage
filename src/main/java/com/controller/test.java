package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
    @RequestMapping("index.jsp")
    public String haha(){
        return "index.jsp";
    }
}
