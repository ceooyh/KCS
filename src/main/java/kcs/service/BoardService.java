package kcs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kcs.dto.BoardDTO;
import kcs.dto.BoardCommentDTO;
import kcs.dto.BoardFileDTO;
import kcs.mapper.BoardMapper;

@Service
public class BoardService {
	private BoardMapper mapper;

	public BoardService(BoardMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public void addCount(int bno) {
		mapper.addCount(bno);
		
	}
	// 여기부터 서비스 메서드 작성
	
	//게시판 1개 읽어오기 - 성진
	public BoardDTO selectBoard(int bno) {
		return mapper.selectBoard(bno);
	}
	//게시판 댓글목록 읽어오기 - 성진
	public List<BoardCommentDTO> selectBoardComment(int bno) {
		return mapper.selectBoardComment(bno);
	}

	// 게시판 파일 목록 읽어오기 - 성진
	public List<BoardFileDTO> selectFileList(int bno) {
		return mapper.selectFileList(bno);
	}
	//게시판 목록 읽어오기 - 성진
	public List<BoardDTO> selectBoardList(int pageNo) {
		return mapper.selectBoardList(pageNo);
	}
	//게시판 갯수 - 성진
	public int selectCount() {
		return mapper.selectCount();
	}
	//댓글 등록 - 성진
	public int insertComment(BoardCommentDTO dto) {
		return mapper.insertBoardComment(dto);
	}
	// 댓글 좋아요 - 성진
	public int updateCommentLike(int cno) {
		return mapper.updateCommentLike(cno);
	}
	// 댓글 싫어요 - 성진
	public int updateCommentHate(int cno) {
		return mapper.updateCommentHate(cno);
	}
	// 게시판 좋아요 싫어요 증가 - 성진
	public int addBoardLikeHate(int mode, int bno) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mode", mode);
		map.put("bno", bno);
		mapper.addBoardLikeHate(map);
		BoardDTO dto = mapper.selectBoard(bno);
		if(mode == 0) {
			return dto.getBlike();
		}else {
			return dto.getBhate();
		}
	}

	// 게시글 등록 - 성진
	public int insertBoard(BoardDTO dto) {
		return mapper.insertBoard(dto);
	} 
	// 첨부파일 등록 - 성진
	public void insertFileList(ArrayList<BoardFileDTO> fList) {
		for(int i = 0; i < fList.size();i++)
			mapper.insertFileList(fList.get(i));
		
	}
	
	// 게시글 삭제 - 성진
	public int deleteBoard(int bno) {
		return mapper.deleteBoard(bno);
	}

	public int updateBoard(BoardDTO dto) {
		return mapper.updateBoard(dto);
		
	}


	
	
}
