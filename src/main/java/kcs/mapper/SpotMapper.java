package kcs.mapper;

import org.apache.ibatis.annotations.Mapper;

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

}
