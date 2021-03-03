package kcs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kcs.dto.MemberDTO;
import kcs.mapper.ManageMapper;

@Service
public class ManageService {
	private ManageMapper mapper;

	public ManageService(ManageMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public List<MemberDTO> selectAllMemberList(int pageNo) {
		return mapper.selectAllMemberList(pageNo);
	}

	public int selectCount() {
		return mapper.selectCount();
	}

	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}

	public List<MemberDTO> membersearch(String kind, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		return mapper.membersearch(map);
	}
	
	// 여기부터 서비스 메서드 작성
}
