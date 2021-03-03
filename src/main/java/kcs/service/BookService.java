package kcs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kcs.dto.BookDTO;
import kcs.dto.ReviewDTO;
import kcs.dto.ReviewFileDTO;
import kcs.mapper.BookMapper;

@Service
public class BookService {
	private BookMapper mapper;

	public BookService(BookMapper mapper) {
		super();
		this.mapper = mapper;
	}

	// 여기부터 서비스 메서드 작성

	// 캠핑장 예약 내역 확인 (일반 사용자 - 마이페이지) - 희원,20210223
	public List<BookDTO> getGuestBookList(String id) {
		return mapper.getGuestBookList(id);
	}

	// 캠핑장 예약 취소 (일반 사용자 - 마이페이지) - 희원,20210223
	public int guestBookCancel(String bno) {
		return mapper.guestBookCancel(bno);
	}

	// 캠핑장 후기 등록 - 희원,20210223
	public int insertReview(ReviewDTO reviewDTO) {
		return mapper.insertReview(reviewDTO);
	}

	// 캠핑장 후기 파일 등록 - 희원,20210223
	public void insertReviewFile(ArrayList<ReviewFileDTO> fList) {
		for(int i=0; i<fList.size(); i++)
			mapper.insertReviewFile(fList.get(i));
	}

	// 캠핑장 후기 번호(rno) 생성
	public int getRno() {
		return mapper.getRno();
	}

	// 예약 번호 중복 확인
	public String checkBno(String bno) {
		return mapper.checkBno(bno);
	}

	// 예약 테이블에 추가
	public int insertBook(BookDTO dto) {
		return mapper.insertBook(dto);
	}

	// 예약 내역 상태 변경 (후기작성완료-3)
	public void updateBookStatus(String bno) {
		mapper.updateBookStatus(bno);
	}

	// 사업자의 사업자 번호 가져오기
	public String getBizrno(String id) {
		return mapper.getBizrno(id);
	}

	// 사업자 번호와 일치하는 예약 목록
	public ArrayList<BookDTO> getManageBookList(String bizrno) {
		return mapper.getManageBookList(bizrno);
	}

	// 예약 요청건 수락
	public int manageBookAccept(String bno) {
		return mapper.manageBookAccept(bno);
	}

	// 예약 요청건 거절
	public int manageBookCancel(String bno) {
		return mapper.manageBookCancel(bno);
	}

	
}
