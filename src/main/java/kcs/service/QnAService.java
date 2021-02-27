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
	
	// 문의 관리자 답변페이지 - 가현,20210227
	public int insertAdminAnswer(QnADTO qnaDTO) {
		return mapper.insertAdminAnswer(qnaDTO);
	}
	
	// 문의 수정 페이지로 이동 - 가현,20210227
		public QnADTO selectQnADTO(String qno, String writer, String title, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qno", qno);
		map.put("writer", writer);
		map.put("title", title);
		map.put("content", content);
		return mapper.selectQnADTO(map);
	} 
	
	// 문의 수정 진행 - 가현,20210227
	public int qnaUpdateAction(QnADTO qnaDTO) {
		return mapper.qnaUpdateAction(qnaDTO);
	}
	
	// 문의 삭제
	public int deleteQnA(String qno) {
		return mapper.deleteQnA(qno);
	}

	
}
