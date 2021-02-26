package kcs.service;

import org.springframework.stereotype.Service;

import kcs.mapper.KeepMapper;

@Service
public class KeepService {
	private KeepMapper mapper;

	public KeepService(KeepMapper mapper) {
		super();
		this.mapper = mapper;
	}
	
	// 여기부터 서비스 메서드 작성
}
