package com.yaa.config;

import com.yaa.constant.WebConst;
import com.yaa.service.OptionsServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(value=2)
public class OptionsConfig implements CommandLineRunner {

    private Logger logger = LoggerFactory.getLogger(OptionsConfig.class);

    @Autowired
    private OptionsServer optionsServer;

    @Override
    public void run(String... args) {
        logger.info("initialize common options");
        WebConst.initConfig = optionsServer.getOptionsConfig();
    }
}
