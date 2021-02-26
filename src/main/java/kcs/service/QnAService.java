package kcs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kcs.dto.QnADTO;
import kcs.mapper.QnAMapper;

@Service
public class QnAService {
	private QnAMapper mapper;

	public QnAService(QnAMapper mapper) {
		super();
		this.mapper = mapper;
	}

	// 여기부터 서비스 메서드 작성
	
	// 관리자일 경우 문의 개수 - 희원,20210221
	public int getAllQnACount() {
		return mapper.getAllQnACount();
	}

	// 일반사용자/사업자일 경우 문의 개수 - 희원,20210221
	public int getQnACount(String writer) {
		return mapper.getQnACount(writer);
	}

	// 관리자일 경우 문의 목록 - 희원,20210221
	public List<QnADTO> getAllQnAList(int pageNo) {
		return mapper.getAllQnAList(pageNo); 
	}

	// 일반사용자/사업자일 경우 문의 목록 - 희원,20210221
	public List<QnADTO> getQnAList(int pageNo, String writer) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("writer", writer);
		return mapper.getQnAList(map);
	}

	// 문의 등록 - 희원,20210221
	public int sendQnA(QnADTO dto) {
		return mapper.sendQnA(dto);
	}
	
	// 관리자일 경우 문의 목록 - 가현,20210224
	public List<QnADTO> getAdminQnAList(String title, String writer, int pageNo, String user_type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("writer", writer);
		map.put("pageNo", pageNo);
		map.put("user_type", user_type);
		return mapper.getAdminQnAList(map);
	}
	// 관리자일 경우 문의 개수 - 가현,20210224
	public int getAdminCount() {
		return mapper.getAdminCount();
	}

	
}
