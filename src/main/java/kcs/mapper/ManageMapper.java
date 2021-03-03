package kcs.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kcs.dto.MemberDTO;

@Mapper
public interface ManageMapper {

	List<MemberDTO> selectAllMemberList(int pageNo);

	int selectCount();

	int deleteMember(String id);

	List<MemberDTO> membersearch(HashMap<String, Object> map);

}
