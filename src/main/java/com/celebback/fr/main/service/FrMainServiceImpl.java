package com.celebback.fr.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.fr.main.dao.FrMainDAO;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class FrMainServiceImpl implements FrMainService{
	@Inject
	FrMainDAO frMainDAO;

}
