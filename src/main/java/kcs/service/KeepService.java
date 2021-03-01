package kcs.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import kcs.dto.KeepDTO;
import kcs.mapper.KeepMapper;

@Service
public class KeepService {
	private KeepMapper mapper;

	public KeepService(KeepMapper mapper) {
		super();
		this.mapper = mapper;
	}

	// 여기부터 서비스 메서드 작성
	
	// KEEP 테이블에 추가 - 희원,20210301
	public int insertKeep(KeepDTO dto) {
		return mapper.insertKeep(dto);
	}

	// 찜 목록 가져오기 - 희원,20210301
	public ArrayList<KeepDTO> getKeepList(String id) {
		return mapper.getKeepList(id);
	}

	// 이미 찜한 목록인지 확인 - 희원,20210301
	public KeepDTO checkKeep(KeepDTO dto) {
		return mapper.checkKeep(dto);
	}

	// 찜삭제 - 희원,20210301
	public int deleteKeep(int contentId, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contentId", contentId);
		map.put("id", id);
		return mapper.deleteKeep(map);
	}
	
}
