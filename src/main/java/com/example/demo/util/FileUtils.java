package com.example.demo.util;

import java.io.File;


import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.exception.AttachFileException;
import com.example.demo.vo.FileVO;

@Component
public class FileUtils {

	/** 오늘 날짜 */
	private final String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));

	/** 업로드 경로 */
	private final String uploadPath = Paths.get("C:", "develop", "upload", today).toString();
	
//	private final String uploadPath = Paths.get("/opt", "tomcat9", "webapps", "ROOT", "WEB-INF", "classes",
//									"static", "upload").toString();
	/**
	 * 서버에 생성할 파일명을 처리할 랜덤 문자열 반환
	 * @return 랜덤 문자열
	 */
	private final String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 서버에 첨부 파일을 생성하고, 업로드 파일 목록 반환
	 * @param files    - 파일 Array
	 * @param bno - 게시글 번호
	 * @return 업로드 파일 목록
	 */
	public List<FileVO> uploadFiles(MultipartFile[] files, int bno) {

		/* 업로드 파일 정보를 담을 비어있는 리스트 */
		List<FileVO> attachList = new ArrayList<>();

		/* uploadPath에 해당하는 디렉터리가 존재하지 않으면, 부모 디렉터리를 포함한 모든 디렉터리를 생성 */
		System.out.println("파일 저장된 경로 ="+uploadPath);
		File dir = new File(uploadPath);
		if (dir.exists() == false) {
			dir.mkdirs();
		}

		/* 파일 개수만큼 forEach 실행 */
		for (MultipartFile file : files) {
			if (file.getSize() < 1) {
				continue;
			}
			try {
				/* 파일 확장자 */
				final String extension = FilenameUtils.getExtension(file.getOriginalFilename());
				/* 서버에 저장할 파일명 (랜덤 문자열 + 확장자) */
				final String saveName = getRandomString() + "." + extension;

				/* 업로드 경로에 saveName과 동일한 이름을 가진 파일 생성 */
				File target = new File(uploadPath, saveName);
				file.transferTo(target);

				/* 파일 정보 저장 */
				FileVO attach = new FileVO();
				attach.setBno(bno);
				attach.setOriginalName(file.getOriginalFilename());
				attach.setSaveName(saveName);
				attach.setSize(file.getSize());

				/* 파일 정보 추가 */
				attachList.add(attach);

			} catch (IOException e) {
				throw new AttachFileException("[" + file.getOriginalFilename() + "] failed to save file...");

			} catch (Exception e) {
				throw new AttachFileException("[" + file.getOriginalFilename() + "] failed to save file...");
			}
		} // end of for

		return attachList;
	}

}