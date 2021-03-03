package kcs.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kcs.dto.BookDTO;
import kcs.dto.ReviewDTO;
import kcs.dto.ReviewFileDTO;

@Mapper
public interface BookMapper {

	// 캠핑장 예약 내역 확인 (일반 사용자 - 마이페이지)
	List<BookDTO> getGuestBookList(String id);

	// 캠핑장 예약 취소 (일반 사용자 - 마이페이지)
	int guestBookCancel(String bno);

	// 캠핑장 후기 등록
	int insertReview(ReviewDTO reviewDTO);

	// 캠핑장 후기 파일 등록
	void insertReviewFile(ReviewFileDTO reviewFileDTO);

	// 캠핑장 후기 번호 생성
	int getRno();

	// 예약 번호 중복 확인
	String checkBno(String bno);

	// 예약 테이블에 추가
	int insertBook(BookDTO dto);

	// 예약 내역 상태 변경 (후기작성완료-3)
	void updateBookStatus(String bno);

	// 사업자의 사업자 번호 가져오기
	String getBizrno(String id);
	
	// 사업자 번호와 일치하는 예약 목록
	ArrayList<BookDTO> getManageBookList(String bizrno);

	// 예약 요청건 수락
	int manageBookAccept(String bno);

	// 예약 요청건 거절
	int manageBookCancel(String bno);

}

