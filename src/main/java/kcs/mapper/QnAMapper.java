package kcs.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kcs.dto.QnADTO;

@Mapper
public interface QnAMapper {

	int getAllQnACount();

	int getQnACount(String writer);

	List<QnADTO> getAllQnAList(int pageNo);

	List<QnADTO> getQnAList(HashMap<String, Object> map);

	int sendQnA(QnADTO dto);

	int insertAdminAnswer(QnADTO dto);

	int updateQnA(QnADTO dto);

	int deleteQnA(String qno);


}
