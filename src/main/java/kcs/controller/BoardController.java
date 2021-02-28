package kcs.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.view.RedirectView;

import kcs.dto.BoardDTO;
import kcs.dto.BoardCommentDTO;
import kcs.dto.BoardFileDTO;
import kcs.dto.MemberDTO;
import kcs.service.BoardService;
import kcs.vo.PaggingVO;

@Controller
public class BoardController {
	private BoardService service;

	public BoardController(BoardService service) {
		super();
		this.service = service;
	}
	
	// 여기부터 RequestMapping 처리
	
	//게시판 목록 뽑기 - 성진 -
		@RequestMapping("/boardList.do")
		public String index(HttpServletRequest request) {
			int pageNo = 1;
			//페이지 셋팅
			if(request.getParameter("pageNo") != null)
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			List<BoardDTO> list = service.selectBoardList(pageNo);//글목록 읽어옴
			int count = service.selectCount();
			PaggingVO vo = new PaggingVO(count, pageNo);
			request.setAttribute("list", list);
			request.setAttribute("pagging", vo);
			return "board/board_list";
		}
		
		
		//게시판 하나 읽어오기 - 성진
		@RequestMapping("/boardView.do")
		public String boardView(HttpServletRequest request) {
			int bno = 0;
			if (request.getParameter("bno") != null)
				bno = Integer.parseInt(request.getParameter("bno"));
			else
				bno = Integer.parseInt(request.getParameter("bno"));
			// 1-1. 해당 게시글 조회수 증가
			service.addCount(bno);
			// 2. DB 해당 게시글 정보를 읽어온다.
			BoardDTO dto = service.selectBoard(bno);// 글목록 읽어옴
			// 2-1. 댓글 불러오는 부분
			List<BoardCommentDTO> list = service.selectBoardComment(bno);
			// 2-2 첨부파일 로드 부분
			List<BoardFileDTO> fList = service.selectFileList(bno);

			// 3. request에 BoardDTO 저장
			request.setAttribute("board", dto);
			request.setAttribute("commentList", list);
			request.setAttribute("file", fList);
			System.out.println(fList);

			return "board/board_detail_view";
		}
		// 게시판 좋아요 싫어요 처리 - 성진
		@RequestMapping("/plusLikeHate.do")
		public String plusLikeHate(HttpServletRequest request, HttpServletResponse response) {
			int bno = Integer.parseInt((String)request.getParameter("bno"));
			int mode =Integer.parseInt((String)request.getParameter("mode"));
			
			int count = 0;
			
			count = service.addBoardLikeHate(mode, bno);
			try {
				response.getWriter().write(String.valueOf(count));
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		//게시판 글쓰기 페이지 이동처리 - 성진
		@RequestMapping("/boardWriteView.do")
		public String boardWriterView() {
			return "board/board_write";
		}
		
		//게시판 글쓰기 - 성진
		@RequestMapping("/boardWriteAction.do")
		public RedirectView boardWriteAction(MultipartHttpServletRequest request) throws Exception {
			int bno = service.newBno();

			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			service.insertBoard(new BoardDTO(bno, writer, title, content));
			request.setAttribute("bno", bno);
			
			// 첨부파일 등록 - 성진
			int fbno = service.newFbno();
			List<MultipartFile> fileList = request.getFiles("file");
			String path = "c:\\fileupload\\board\\"+writer+"\\";
			ArrayList<BoardFileDTO> fList = new ArrayList<BoardFileDTO>();
			for(MultipartFile mf : fileList) {
				String originalFileName = mf.getOriginalFilename();
				long fileSize = mf.getSize();
				if(fileSize == 0) continue;
//				System.out.println("originalFileName : " + originalFileName);
//				System.out.println("fileSize : "+ fileSize);
//				System.err.println(mf.getContentType());
				
				try {
				//파일 업로드
				String safeFile = path + originalFileName;
				fList.add(new BoardFileDTO(fbno, bno, originalFileName, writer));
				File parentPath = new File(path);
				if(!parentPath.exists()) parentPath.mkdirs();//경로 생성
					mf.transferTo(new File(safeFile));	
				
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			service.insertFileList(fList);
			
			return new RedirectView("boardView.do?bno="+bno);
			
			
		}
		
		
		// 게시판 댓글달기 - 성진
		@RequestMapping("/insertComment.do") 
		public String insertComment(HttpServletRequest request, HttpServletResponse response) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			service.insertComment(new BoardCommentDTO(bno, writer, content));
			
			
			return null;
		}
		//게시판 좋아요 누름 처리 - 성진
		@RequestMapping("/commentLike.do")
		public String commentLike(HttpServletRequest request) {
			int cno = Integer.parseInt(request.getParameter("cno"));
			service.updateCommentLike(cno);
			return boardView(request);
		}
		//게시판 싫어요 누름 처리 - 성진
		@RequestMapping("/commentHate.do")
		public String commentHate(HttpServletRequest request) {
			int cno = Integer.parseInt(request.getParameter("cno"));
			service.updateCommentHate(cno);
			return boardView(request);
		}
		
		//첨부파일 다운로드 - 성진
		@RequestMapping("/fileDownload.do")
		public String fileDownload(HttpServletRequest request, HttpServletResponse response) {
			String fileName = request.getParameter("fileName");
			String writer = request.getParameter("writer");
			String path = "c:\\fileupload\\board\\"+writer+File.separator+fileName;

			System.out.println(path);
			File file = new File(path);
			try {
				FileInputStream fis = new FileInputStream(file);
				String encodingName = URLEncoder.encode(path,"utf-8");
				fileName = URLEncoder.encode(fileName,"utf-8");
				response.setHeader("Content-Disposition", "attachment;filename="+fileName);
				response.setHeader("Content-Transfer-Encode", "binary");
				response.setContentLength((int)file.length());
				BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
				byte[] buffer = new byte[1024*1024];
				while(true) {
					int count = fis.read(buffer);
					if(count == -1) break;
					bos.write(buffer, 0, count);
					bos.flush();
				}
				fis.close();
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		
		//게시글 삭제
		@RequestMapping("/deleteBoard.do")
		public String deleteBoard(HttpServletRequest request,HttpServletResponse response) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			int count = service.deleteBoard(bno);
			try {
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
						response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
				}else {
							response.setContentType("text/html;charset=utf-8");
							response.getWriter().write("<script>alert('게시글 삭제 성공');location.href='boardList.do';</script>");
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
			return null;
		}
		
		//게시판 파일 삭제
		@RequestMapping("/deleteFile.do")
		public String deleteFile(HttpServletRequest request) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			int fbno = Integer.parseInt(request.getParameter("fbno"));
			int count = service.deleteFile(fbno);
			return boardView(request);
		}
		
		
		//게시글 수정 페이지 이동
		@RequestMapping("/updateBoard.do")
		public String updateBoardView(HttpServletRequest request) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			BoardDTO dto = service.selectBoard(bno);
			List<BoardFileDTO> fList = service.selectFileList(bno);
			request.setAttribute("board", dto);
			request.setAttribute("file", fList);
			return "board/board_update_view";
		}
		
		//게시글 수정
		@RequestMapping("/updateBoardAction.do")
		public RedirectView updateBoard(MultipartHttpServletRequest request,HttpServletResponse response) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			String writer = request.getParameter("writer");
			System.out.println(writer);
			String title = request.getParameter("title");
			System.out.println(title);
			String content = request.getParameter("content");
			System.out.println(content);
			int fbno = service.newFbno();
			System.out.println(fbno);
			BoardDTO dto = new BoardDTO(bno, writer, title, content);
			int count  = service.updateBoard(dto);
			System.out.println(count);
			try {
			if(count == 0) {
				response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
			}else {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write("<script>alert('게시글 수정 성공');location.href='boardView.do?bno='"+bno+";</script>");
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
					
			List<MultipartFile> fileList = request.getFiles("file"); 
			String path = "c:\\fileupload\\board"+writer+"\\";
			ArrayList<BoardFileDTO> fList = new ArrayList<BoardFileDTO>();
			for(MultipartFile mf : fileList) {
				String originalFileName = mf.getOriginalFilename();
				long fileSize = mf.getSize();
				if(fileSize == 0) continue;
				
				try {
				
				String safeFile = path + originalFileName;
				fList.add(new BoardFileDTO(fbno, bno, originalFileName, writer));
				File parentPath = new File(path);
				if(!parentPath.exists()) parentPath.mkdirs();
					mf.transferTo(new File(safeFile));	
				
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			service.insertFileList(fList);
			
			return new RedirectView("boardView.do?bno="+bno);
		}
		
		//게시판 검색
		@RequestMapping("/boardSearch.do")
		public String memberAdminSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String kind = request.getParameter("kind");
			String search = request.getParameter("search");
			List<BoardDTO> list = service.selectSearchBoard(kind, search);
			request.setAttribute("list", list);
			
			return "board/board_search_list";
		}
		
	}
	
	
	
	
	

