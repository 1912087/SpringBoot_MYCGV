package com.springboot.mycgv.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.mycgv.dto.BoardDto;
import com.springboot.mycgv.dto.FileDto;

@Service
public class FileService {

	@Value("${spring.servlet.multipart.location}")
	private String uploadPath;
	
	private MultipartFile file;
	private MultipartFile[] files;
	
	public boolean fileCheck(MultipartFile file) {
		if(file.getOriginalFilename().equals("")) {
			return false;
		}else {
			this.file = file;
			return true;
		}
	}
	
	public boolean fileCheck(MultipartFile[] files) {
		if(files[0].getOriginalFilename().equals("") && files[1].getOriginalFilename().equals("")) {
			return false;
		}else {
			this.files = files;
			return true;
		}
	}
	
	//BoardDto -> FileDto로 업캐스팅
	public Object init(FileDto dto) {
		if(file != null) {
			if(!file.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				dto.setFile(file.getOriginalFilename());
				dto.setSfile(uuid + file.getOriginalFilename());
			}
		}else if(files != null) {
			for(MultipartFile fileInfo : files) {
				//View에서 File 객체가 2개 넘어오므로 files의 배열의 크기는 자동으로 2로 지정됨
				if(fileInfo != null) {
					if(!fileInfo.getOriginalFilename().equals("")) {
						UUID uuid = UUID.randomUUID();
						dto.getFileList().add(fileInfo.getOriginalFilename());
						dto.getSfileList().add(uuid + fileInfo.getOriginalFilename());
					}else {
						//File 2개 중 하나는 있고 하나는 null일 경우
						dto.getFileList().add("");
						dto.getSfileList().add("");
					}
				}
			}
			
			dto.setFileList(dto.getFileList());
			dto.setSfileList(dto.getSfileList());
		}
		
		return dto;
	}
	
	public void saveFile(FileDto fileDto) throws Exception {
		if(file != null) {
			File filePath = new File(uploadPath + fileDto.getSfile());
			file.transferTo(filePath);
		}else if(files != null){
			for(int i = 0; i < fileDto.getSfileList().size(); i++) {
				if(!fileDto.getSfileList().get(i).equals("")) {
					File filePath = new File(uploadPath + fileDto.getSfileList().get(i));
					files[i].transferTo(filePath);
				}
			}
		}
	}
	
	public void deleteFile(String bsfile) throws Exception {
		File file = new File(uploadPath + bsfile);
		if(file.exists()) {
			file.delete();
		}
	}
}
