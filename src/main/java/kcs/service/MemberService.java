package kcs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kcs.dto.BusinessDTO;
import kcs.dto.FavoriteDTO;
import kcs.dto.MemberDTO;
import kcs.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		super();
		this.mapper = mapper;
	}

	// 여기부터 서비스 메서드 작성 
	
	// 로그인 메서드 -성진
	public MemberDTO login(String id, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pass", pass);
		return mapper.login(map); 
	}

	// 일반 사용자 회원가입 - 희원,20210219
	public int guestJoin(MemberDTO memberDTO) {
		return mapper.guestJoin(memberDTO);
	}
	
	// 일반 사용자 회원가입 취향입력 - 희원,20210222
	public int guestFavoriteJoin(FavoriteDTO favoriteDTO) {
		return mapper.guestFavoriteJoin(favoriteDTO);
	}

	// 사업자 회원가입 - 희원,20210219
	public int businessJoin(MemberDTO memberDTO, BusinessDTO businessDTO) {
		int count = mapper.businessJoin(memberDTO);
		if(count != 0 && businessDTO != null);
			mapper.insertBusiness(businessDTO);
		return count;
	}

	// 아이디 중복 체크 - 희원,20210222
	public String idCheck(String id) {
		return mapper.idCheck(id);
	}

	// 비밀번호 찾기 - 희원, 20210222
	public String findPw(String id, String name, String email1, String email2) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("email1", email1);
		map.put("email2", email2);
		return mapper.findPw(map);
	}

	// 회원정보 수정을 위한 회원정보 가져오기 (개인정보) - 희원,20210222
	public MemberDTO selectMemberDTO(String id) {
		return mapper.selectMemberDTO(id);
	}

	// 개인정보 수정 진행 (일반 사용자) - 희원,20210222
	public int guestInfoUpdate(MemberDTO memberDTO) {
		return mapper.guestInfoUpdate(memberDTO);
	}

	// 취향정보 수정 진행 (일반 사용자) - 희원,20210223
	public int guestFavoriteUpdate(FavoriteDTO favoriteDTO) {
		return mapper.guestFavoriteUpdate(favoriteDTO);
	}

	// 사업자정보 수정을 위한 사업자정보 가져오기 - 희원,20210223
	public BusinessDTO selectBusinessDTO(String id) {
		return mapper.selectBusinessDTO(id);
	}

	// 사업자 정보 수정 진행 - 희원,20210223
	public int businessUpdate(MemberDTO memberDTO, BusinessDTO businessDTO) {
		int count = mapper.businessUpdate(businessDTO);
		if(count == 0) return 0;
		else return mapper.businessInfoUpdate(memberDTO);
	}

	// 기존에 등록해놓은 취향정보가 있는지 확인 -희원,20210302
	public FavoriteDTO checkFavorite(String id) {
		return mapper.checkFavorite(id);
	}

}
