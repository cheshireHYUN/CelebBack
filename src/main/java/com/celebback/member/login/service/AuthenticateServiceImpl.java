package com.celebback.member.login.service;

import java.lang.reflect.InvocationTargetException;

import javax.inject.Inject;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.stereotype.Service;

import com.celebback.enumpkg.ServiceResult;
import com.celebback.member.login.dao.MemberDAO;
import com.celebback.vo.UserVO;
//import com.celebback.vo.MemVO;


@Service("authService")
public class AuthenticateServiceImpl implements AuthenticateService {
	
	@Inject
	MemberDAO memberDAO;
	
	@Override
	public ServiceResult authenticate(UserVO inputData) {
		ServiceResult result = null;
		UserVO mem = memberDAO.selectMemberForAuth(inputData);
		
		if(mem!=null) { // 암호화 적용 아직 안함 
			String inputPass = inputData.getUserPw();
			String savedPass = mem.getUserPw();
			if(inputPass.equals(savedPass)) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.INVALIDPASSWORD;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

}