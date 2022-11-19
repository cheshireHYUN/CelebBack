package com.celebback;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.head.frPayment.service.FrPaymentService;
import com.celebback.head.frorder.service.FrOrderService;
import com.celebback.vo.FeeVO;
import com.celebback.vo.FrOrderVO;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * 2022. 9. 2.       서재원      가맹점 주문, 가맹점 미납건 서비스 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
public class HeadMainController {
	
	@Inject
	FrOrderService service;
	
	@Inject
	FrPaymentService paymentService;
	
	@RequestMapping("/head")
	public String headIndex(Model model){
		
		List<FrOrderVO> orderList = service.retrieveOrderListDashboard();
		List<FeeVO> notPaymentList = paymentService.retrieveFrPaymentListDashboard();
		int orderCnt = service.retrieveST09Count();
		int notPaymentCnt = paymentService.retrieveFrPaymentListCountDashboard();
		model.addAttribute("orderList", orderList);
		model.addAttribute("notPaymentList", notPaymentList);
		model.addAttribute("orderCnt", orderCnt);
		model.addAttribute("notPaymentCnt", notPaymentCnt);
		
		return "head";
	}
}
