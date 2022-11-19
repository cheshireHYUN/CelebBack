package com.celebback.fr.atOrder.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.celebback.fr.atOrder.service.AtOrderService;
import com.celebback.vo.AtOrderVO;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/atOrder/updateAtOrder")
public class AtOrderUpdateController {
	@Inject
	AtOrderService service;
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,@RequestBody Map<String,List<Integer>> trTagMap
			,Model model
		) {
		System.out.println(trTagMap);
		String authName = principal.getName(); //security에서 가져온 owner_id 를 가져온다
		//owner_id로 fran_id 를 구한다
		String franId = service.retrieveFranId(authName);
		
		List<Integer> trTagList = trTagMap.get("trTag");
		
		int cnt=1;
		for (Integer atOrderNum : trTagList) {
			System.out.println(atOrderNum);
			HashMap<String, String> atOrderMap = new HashMap<>();
			if( cnt < 10 ) {
				atOrderMap.put("buyerProdId","00"+cnt);				
			}else {
				atOrderMap.put("buyerProdId","0"+cnt);				
			}
			atOrderMap.put("atOrderQty",Integer.toString(atOrderNum));
			atOrderMap.put("authName", franId);
			System.out.println(authName);
			cnt++;
			service.modifyAtOrder(atOrderMap);			
			model.addAttribute("atOrder", atOrderMap);
		}
		
		
		return "jsonView";
	}

}
