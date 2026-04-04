package me.manishcodes.connectsphere.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestingController {

    @GetMapping("public/health")
    public String publicHealth(){
        return "Public Health for without Authentication";
    }

    @GetMapping("protected/health")
    public String protectedHealth(){
        return "Protected Health";
    }
}
