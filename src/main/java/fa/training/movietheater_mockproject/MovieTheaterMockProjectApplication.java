package fa.training.movietheater_mockproject;

import fa.training.movietheater_mockproject.service.impl.EmployeeServiceImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
public class MovieTheaterMockProjectApplication {

    public static void main(String[] args) {
        String text = "asdfkjhsgkhaskfjhasdgkjhsdakjghfkjdghkasdgewtercvbcvnsaaaa";
        Map<Character, Integer> countMap = new HashMap<>();
        for(int i = 0; i < text.length(); i++){
            if(countMap.containsKey(text.charAt(i))){
                Integer count = countMap.get(text.charAt(i));
                countMap.put(text.charAt(i),++count);
            }else {
                countMap.put(text.charAt(i),1);
            }
        }
        Character key = null;
        Integer max = 0;
        for (Map.Entry entry : countMap.entrySet()) {
            if((Integer)entry.getValue() > max){
                max = ((Integer) entry.getValue());
                key = (Character) entry.getKey();
            }
        }
        System.out.println(key+": "+max);
        ApplicationContext applicationContext = SpringApplication.run(MovieTheaterMockProjectApplication.class, args);
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        EmployeeServiceImpl employeeService = applicationContext.getBean("employeeServiceImpl", EmployeeServiceImpl.class);
        employeeService.print();
        System.out.println(passwordEncoder.encode("123"));
    }

}
