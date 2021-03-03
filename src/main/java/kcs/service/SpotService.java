package kcs.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kcs.dto.ReviewDTO;
import kcs.mapper.SpotMapper;

@Service
public class SpotService {
	private SpotMapper mapper;

	public SpotService(SpotMapper mapper) {
		super();
		this.mapper = mapper;
	}

	// 여기부터 서비스 메서드 작성

	// 캠핑장 별점 평균 - 희원,20210225
	public double getStarAvg(int contentId) {
		return mapper.getStarAvg(contentId);
	}

	// 캠핑장 리뷰 개수 - 희원,20210225
	public int getReviewCount(int contentId) {
		return mapper.getReviewCount(contentId);
	}

	// 별점 평균 높은 캠핑장 top3 - 희원,20210303
	public int[] getTopStarRank() {
		return mapper.getTopStarRank();
	}

	// 찜 많은 캠핑장 top3 - 희원,20210303
	public int[] getTopKeepRank() {
		return mapper.getTopKeepRank();
	}

	// 이 캠핑장 contentId를 가지고 있는 리뷰 테이블 로우 검색 - 희원,20210303
	public ArrayList<ReviewDTO> getSpotReview(int contentId) {
		return mapper.getSpotReview(contentId);
	}
	
}
