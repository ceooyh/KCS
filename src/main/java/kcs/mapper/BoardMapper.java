package kcs.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kcs.dto.BoardDTO;
import kcs.dto.BoardCommentDTO;
import kcs.dto.BoardFileDTO;

@Mapper
public interface BoardMapper {
	
	//게시판목록
	List<BoardDTO> selectBoardList(int pageNo);
	//조회수 증가
	void addCount(int bno);
	//해당 게시글 한개
	BoardDTO selectBoard(int bno);
	//게시판 댓글 목록
	List<BoardCommentDTO> selectBoardComment(int bno);
	//게시판 첨부파일 목록
	List<BoardFileDTO> selectFileList(int bno);
	//게시글 갯수 불러오기
	int selectCount();
	//댓글달기 
	int insertBoardComment(BoardCommentDTO dto);
	//댓글 좋아요
	int updateCommentLike(int cno);
	//댓글 싫어요
	int updateCommentHate(int cno);
	//게시판 좋아요,싫어요
	void addBoardLikeHate(HashMap<String, Object> map);
	//게시글 1건 등록
	int insertBoard(BoardDTO dto);
	//첨부파일 등록
	void insertFileList(BoardFileDTO boardFileDTO);
	//게시글 삭제
	int deleteBoard(int bno);
	//게시글 수정
	int updateBoard(BoardDTO dto);
	


}
