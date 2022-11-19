package com.celebback.head.frRepair.controller;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.head.frRepair.service.frRepairService;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 황단비
 * @since 2022. 9. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 9. 2.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@Slf4j
@RequestMapping("/head/frRepair")
public class FrRepairRetrieveController {
	@Inject
	frRepairService service;
	
	@GetMapping
	public String frRepairRetrieve() {
		log.info("hi");
		return "head/frRepair/frRepairList";
	}
	
	@GetMapping("backup")
	public String backupProcess() {
		service.backupProcess();
		
		return "head/frRepair/frRepairList";
	}
}
