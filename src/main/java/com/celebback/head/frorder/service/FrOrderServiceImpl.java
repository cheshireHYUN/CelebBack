package com.celebback.head.frorder.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.head.frorder.dao.HeadFrOrderDAO;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

@Service("head.FrOrderServiceImpl")
@Slf4j
public class FrOrderServiceImpl implements FrOrderService {
	
	@Inject
	HeadFrOrderDAO frOrderDAO;

	/**
	 * 가맹점 주문내역 전체 조회
	 */
	@Override
	public List<FrOrderVO> retrieveFrOrderList(PagingVO<FrOrderVO> pagingVO) {
		pagingVO.setTotalRecord(frOrderDAO.selectTotalRecord(pagingVO));
		List<FrOrderVO> frOrderList = frOrderDAO.selectOrderList(pagingVO);
		pagingVO.setDataList(frOrderList);
		return frOrderList;
	}

	@Override
	public List<FrOrderVO> retrieveFrOrderDetail(String frOrderNo) {
		List<FrOrderVO> orderDetail = frOrderDAO.selectOrderDetail(frOrderNo);
		return orderDetail;
	}

/*	@Override
	public void createHeadout() {
		frOrderDAO.createHeadout();
		
	}

	@Override
	public void updateHstock() {
		frOrderDAO.updateHstock();
	}

	@Override
	public void updateShipStatus() {
		frOrderDAO.updateShipStatus();
	}*/
	
	
	@Override
	@Transactional
	public void headoutAll() {
		frOrderDAO.createHeadout();
		frOrderDAO.updateHstock();
		frOrderDAO.updateShipStatus();
		
	}

	@Override
	public int retrieveST09Count() {
		int ST09Count = frOrderDAO.selectST09Count();
		return ST09Count;
	}

	@Override
	public List<FrOrderVO> retrieveOrderListDashboard() {
		List<FrOrderVO> frOrderListDashboard = frOrderDAO.selectOrderListDashboard();
		return frOrderListDashboard;
	}


}
