package com.modules.kubernetes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class KubernetesApplication {

    @GetMapping("/")
    public String home(){
        return "Hello World";
    }
    public static void main(String[] args) {
        SpringApplication.run(KubernetesApplication.class, args);
    }

}
