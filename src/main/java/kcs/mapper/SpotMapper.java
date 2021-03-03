package kcs.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kcs.dto.ReviewDTO;

@Mapper
public interface SpotMapper {

	// 캠핑장 별점 평균
	double getStarAvg(int contentId);
 
	// 캠핑장 리뷰 개수
	int getReviewCount(int contentId);

	// 별점 평균 높은 캠핑장 top3
	int[] getTopStarRank();

	// 찜 많은 캠핑장 top3
	int[] getTopKeepRank();

	// 이 캠핑장 contentId를 가지고 있는 리뷰 테이블 로우 검색 - 희원,20210303
	ArrayList<ReviewDTO> getSpotReview(int contentId);

}
