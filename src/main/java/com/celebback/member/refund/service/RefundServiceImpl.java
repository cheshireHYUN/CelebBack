package com.celebback.member.refund.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.member.refund.dao.RefundDAO;
import com.celebback.vo.RefundVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import lombok.Data;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 30.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 30.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class RefundServiceImpl implements RefundService {
	@Inject
	RefundDAO refundDAO;

	private static String impKey = "5396366384017153";
	private static String impSecret="483b3abedb0f4e219f1fe9528a7fe23131a03914c61ecc767f0886e618f94e907da270c735dbd609";
	
	@Data
	private class Response{
		private PaymentInfo response;
	}
	@Data
	private class PaymentInfo{
		private int amount;
	}
	
	public String getToken() throws IOException {
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
//		JSONObject json = new JSONObject();
		Map<String, String> map = new HashMap<String, String>();
		map.put("imp_key", impKey);
		map.put("imp_secret", impSecret);
		
		ObjectMapper om = new ObjectMapper();
		
		String keyBox = om.writeValueAsString(map);
		
//		json.addProperty("imp_key", impKey);
//		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(keyBox.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
		
	}

	public int paymentInfo(String impUid, String token) throws IOException {
		HttpsURLConnection conn = null;
	    
	    URL url = new URL("https://api.iamport.kr/payments/" + impUid);
	 
	    conn = (HttpsURLConnection) url.openConnection();
	 
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Authorization", token);
	    conn.setDoOutput(true);
	 
	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    
	    Gson gson = new Gson();
	    
	    Response response = gson.fromJson(br.readLine(), Response.class);
	    
	    br.close();
	    conn.disconnect();
	    
	    return response.getResponse().getAmount();
	}

	@Transactional
	public void payMentCancle(String token, String impUid, int amount) throws IOException {
		//payAllYn값이 Y면 쿠폰환불(cpn 사용유무N), 아임포트환불, 예약취소(resv ST14, refund ST03 or ST04), 
		//payAllYn값이 N이면 예약취소만
		
		// 아임포트에 환불 요청
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", token);
 
		conn.setDoOutput(true);
		
//		JsonObject json = new JsonObject();
// 
//		json.addProperty("imp_uid", impUid);
//		json.addProperty("amount", amount);
//		json.addProperty("checksum", amount);
		

		Map<String, String> map = new HashMap<String, String>();
		map.put("imp_uid", impUid);
		map.put("amount", amount+"");
		map.put("checksum", amount+"");

		ObjectMapper om = new ObjectMapper();
		String keyBox = om.writeValueAsString(map);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(keyBox.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
		br.close();
		conn.disconnect();
		
	}

	@Override
	public void refundProcess(String payPg, String morderId) {
		// 1. 선결제 여부 조회
		// 2. 쿠폰 사용 여부 조회
		// 3. 예약 상태 변경
		// 4. 환불 정보 등록
		// 5. 환불 요청
		String token;
		
		RefundVO result = refundDAO.selectPayDetail(payPg);

		if("Y".equals(result.getPayallYn())) { // 1. 선결제
			if(result.getMycpnId()!=null) { // 2. 쿠폰 사용
				refundDAO.updateMyCpn(result.getMycpnId());
			}
			
			refundDAO.updateReserve(morderId); // 3. 예약상태 변경
			result.setPayPg(payPg);
			refundDAO.insertRefund(result); // 4. 환불 정보 등록
			
			// 5. 환불 요청
			try {
				token = getToken(); //토큰 가져오기
				int amount = paymentInfo(payPg, token); //결제 정보 가져오기
				payMentCancle(token, payPg, amount); //결제 취소
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	

}
