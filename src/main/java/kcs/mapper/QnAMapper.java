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

	int selectUpdateQnA(int qno);

	int insertAdminAnswer(QnADTO dto);

	int qnaUpdateAction(QnADTO qnaDTO);

	int deleteQnA(int qno);

	QnADTO selectQnADTO(int qno);

	void qnaStatusUpdate(int qno);




}
