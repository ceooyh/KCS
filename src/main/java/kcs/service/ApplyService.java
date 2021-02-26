package kcs.service;

import org.springframework.stereotype.Service;

import kcs.mapper.ApplyMepper;

@Service
public class ApplyService {
	private ApplyMepper mapper;

	public ApplyService(ApplyMepper mapper) {
		super();
		this.mapper = mapper;
	}
	
	// 여기부터 서비스 메서드 작성
}
