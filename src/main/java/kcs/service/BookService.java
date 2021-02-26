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
	
}
