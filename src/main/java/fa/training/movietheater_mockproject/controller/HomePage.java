package fa.training.movietheater_mockproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homePage")
public class HomePage {
    @GetMapping
    public String homePage(){
        return "homePage/index";
    }
}
