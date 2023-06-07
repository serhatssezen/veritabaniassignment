package com.example.service;

import com.example.service.base.ServiceException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@SpringBootApplication
@EnableJpaRepositories("com.example.service.dao")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = ServiceException.class)
public class ServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceApplication.class, args);
    }

}
