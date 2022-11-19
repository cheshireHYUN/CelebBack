package com.celebback.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자          수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.   최서현      최초작성
 * Copyright (c) 2022 by seohyun All right reserved
 * </pre>
 */

public class UploadFileUtils {
	
	// 1. 날짜로 구성된 폴더를 생성
	// 2. 같은 파일명을 등록하더라도 중복되지 않도록 랜덤문자와 파일명을 조합
	// 3. 날짜 폴더에 원본파일을 저장하며 썸네일을 생성
	// 4. 썸네일은 별도의 폴더에 저장하도록 한다.
	// cf) 썸네일 생성을 위해 thumbnailator라는 라이브러리를 사용하였음
	
	
   static final int THUMB_WIDTH = 300;
   static final int THUMB_HEIGHT = 300;
   
   public static String fileUpload(String uploadPath,
           String fileName,
           byte[] fileData, String ymdPath) throws Exception {

    UUID uid = UUID.randomUUID();
    
    String newFileName = uid + "_" + fileName;
    String imgPath = uploadPath + ymdPath;

    File target = new File(imgPath, newFileName);
    FileCopyUtils.copy(fileData, target);
    
    String thumbFileName = "thumb_" + newFileName;
    File image = new File(imgPath + File.separator + newFileName);

    File thumbnail = new File(imgPath + File.separator + "thumb" + File.separator + thumbFileName);

    if (image.exists()) {
     thumbnail.getParentFile().mkdirs();
     Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
    }
    return newFileName;
   }

   public static String calcPath(String uploadPath) {
    Calendar cal = Calendar.getInstance();
    String yearPath = File.separator + cal.get(Calendar.YEAR);
    String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
    String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

    makeDir(uploadPath, yearPath, monthPath, datePath);
    makeDir(uploadPath, yearPath, monthPath, datePath + "\\thumb");

    return datePath; 
   }

   private static void makeDir(String uploadPath, String... paths) {

    if (new File(paths[paths.length - 1]).exists()) { return; }

    for (String path : paths) {
     File dirPath = new File(uploadPath + path);

     if (!dirPath.exists()) {
      dirPath.mkdir();
     }
    }
   }
}
