package kcs.mapper;

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

}

