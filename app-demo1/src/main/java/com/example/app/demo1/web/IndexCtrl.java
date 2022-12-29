package com.example.app.demo1.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/index")
public class IndexCtrl {

	private static final Logger logger = LoggerFactory.getLogger(IndexCtrl.class);

	@Value("${server.port}")
	private Integer port;

	@RequestMapping("/")
	public Integer index() {
		logger.info(">>> request received: {}", port);
		return port;
	}


}
