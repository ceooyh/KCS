package kcs.service;

import org.springframework.stereotype.Service;

import kcs.mapper.ManageMapper;

@Service
public class ManageService {
	private ManageMapper mapper;

	public ManageService(ManageMapper mapper) {
		super();
		this.mapper = mapper;
	}
	
	// 여기부터 서비스 메서드 작성
}
