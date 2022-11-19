package com.celebback.head.coupon.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.celebback.head.coupon.dao.CouponDAO;
import com.celebback.head.coupon.service.CouponService;
import com.celebback.validate.DeleteGroup;
import com.celebback.validate.InsertGroup;
import com.celebback.validate.UpdateGroup;
import com.celebback.vo.CheckingVO;
import com.celebback.vo.CpnVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.SimpleSearchCondition;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/coupon")
public class CouponRetrieveController {
	@Inject
	CouponService service;
	
	@Inject
	CouponDAO cpnDAO; // // 단순 데이터 조회용(셀렉트박스)
	
	@ModelAttribute("cpnLguList")
	public List<Map<String, Object>> cpnLguList(){
		return cpnDAO.selectCpnLgu();
	}
	@ModelAttribute("menuLguList")
	public List<Map<String, Object>> menuLguList(){
		return cpnDAO.selectMenuLgu();
	}
	@ModelAttribute("memIdList")
	public List<Map<String, Object>> memIdList(){
		return cpnDAO.selectMemId();
	}
	
	@ModelAttribute("cpn")
	public CpnVO makeChecking(){
		return new CpnVO();
	}
	
	@GetMapping
	public String couponRetrieve() {
		return "head/coupon/couponList";
	}
	
	/**
	 * 쿠폰 전체조회 json
	 * @param model
	 * @param searchType
	 * @param searchWord
	 * @param currentPage
	 * @return
	 */
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType // searchType파라미터가 필요한데 꼭 필요한건 아니야
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);
		
//		log.info("searchType : {}, searchWord : {}",searchType,searchWord); // info로 설정했기 때문에 그 이상의 등급을 사용해야 콘솔에 출력됨.
					// 메세지 포맷팅 가능

		PagingVO<CpnVO> pagingVO = new PagingVO<CpnVO>(5,3);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveCpnList(pagingVO);
		
		model.addAttribute("cpn", pagingVO);
		
		return  "jsonView";
	}
	
	/**
	 * 쿠폰 상세조회 json
	 * @param paperId
	 * @param model
	 * @return
	 */
	@PostMapping(value="/{cpnId}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String couponDetailRetrieve(
			@PathVariable String cpnId
			,Model model
			) {
		CpnVO detail = service.retrieveCpn(cpnId);
		
		String saveName = detail.getAttatch().getAttatchSavename();
		
		// 이미지 처리
		if(saveName != null) {
			File file = new File("d:/contents/"+saveName);
			try {
				byte[] fileContent = Files.readAllBytes(file.toPath());
				detail.getAttatch().setProfileImg(fileContent);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("cpn",detail);
		
		return "jsonView";
	}
	
	/**
	 * 쿠폰 수정
	 * @param cpn
	 * @param errors
	 * @param model
	 * @return
	 */
	@PutMapping("/{cpnId}")
	public String couponUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("cpn") CpnVO cpn
			,Errors errors
			,Model model
			) {
		String viewName = null;
		if(!errors.hasErrors()) {
			service.modifyCpn(cpn);
			viewName="redirect:/head/coupon";
		}
		return viewName;
	}
	

	/**
	 * 쿠폰 등록
	 * @param cpn
	 * @param errors
	 * @return
	 * @throws IOException 
	 */
	@PostMapping
	public String couponCreate(
			@Validated(InsertGroup.class) @ModelAttribute("cpn") CpnVO cpn
			, Errors errors
			,MultipartHttpServletRequest request
			) throws IOException {
		String viewName = null;
		if(!errors.hasErrors()) {
			service.createCpn(cpn,request);
			viewName="redirect:/head/coupon";
		}
		return viewName;
	}
	
	/**
	 * 쿠폰 삭제
	 * @param cpn
	 * @param errors
	 * @return
	 */
	@DeleteMapping("/{cpnId}")
	public String couponDelete(
			@Validated(DeleteGroup.class) @ModelAttribute("cpn") CpnVO cpn
			,Errors errors
			) {
		String viewName = null;
		String cpnId = cpn.getCpnId();
		if(!errors.hasErrors()) {
			service.deleteCpn(cpnId);
			viewName="redirect:/head/coupon";
		}
		return viewName;
	}
	
	/**
	 * 쿠폰 발송
	 * @param cpn
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/send")
	public String couponSend(
			@ModelAttribute("cpn") CpnVO cpn
			) throws IOException {
		String viewName = null;
		service.sendCpn(cpn);
		
		return "redirect:/head/coupon";
	}
	
}
