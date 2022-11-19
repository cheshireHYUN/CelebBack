package com.celebback.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Base64;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttatchVO implements Serializable {
	private String attatchOrgname;
	private String attatchSavename;
	private String attatchMime;
	private Long attatchSize;
	private String tableName;
	private String tablePk; //postNo나 그런 것들...
	private Integer attatchNo;
	
	private transient MultipartFile atchFile;
	private byte[] profileImg;
	
	public AttatchVO(MultipartFile atchFile) {
		super();
		this.atchFile = atchFile;
		attatchOrgname = atchFile.getOriginalFilename();
		attatchSavename = UUID.randomUUID().toString();
		attatchMime = atchFile.getContentType();
		attatchSize = atchFile.getSize();
	}
	
	public void saveTo(File saveFolder) throws IOException {
		if(atchFile != null) {
			atchFile.transferTo(new File(saveFolder, attatchSavename));
		}
	}
	
	public void setProfileImage(MultipartFile profileImage) throws IOException {
		if(profileImage!=null && !profileImage.isEmpty()) { // 업로드된 이미지가 있으면
			if(!profileImage.getContentType().startsWith("image/")) { // 이미지 파일이 아니면
				throw new IllegalArgumentException(String.format("%s 타입의 파일은 이미지가 아님.", profileImage.getContentType()));
			}
			this.atchFile = profileImage;
			this.profileImg = profileImage.getBytes(); // 데이터 변환 작업 끝
		}
	}
	
	public String getBase64ProfileImage() {
		if(atchFile!=null) {
			return Base64.getEncoder().encodeToString(profileImg); // since 1.8, 1.7일때는 commons-codec사용해보시오
		}else {
			return null;
		}
	}
}
