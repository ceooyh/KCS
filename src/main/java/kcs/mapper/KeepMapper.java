package kcs.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kcs.dto.KeepDTO;

@Mapper
public interface KeepMapper {

	// KEEP 테이블에 추가
	int insertKeep(KeepDTO dto);

	// 찜 목록 가져오기
	ArrayList<KeepDTO> getKeepList(String id);

	// 이미 찜한 목록인지 확인
	KeepDTO checkKeep(KeepDTO dto);

	// 찜삭제
	int deleteKeep(HashMap<String, Object> map);

}
