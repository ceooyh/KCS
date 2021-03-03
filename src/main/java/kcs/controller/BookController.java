package kcs.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kcs.dto.BookDTO;
import kcs.dto.ReviewDTO;
import kcs.dto.ReviewFileDTO;
import kcs.service.BookService;

@Controller
public class BookController {
	private BookService service;

	public BookController(BookService service) {
		super();
		this.service = service;
	}

	// 여기부터 RequestMapping 처리
	
	// 캠핑장 예약 내역 확인 (일반 사용자 - 마이페이지) - 희원,20210223
	@RequestMapping("guestBookListView.do")
	public String guestBookListView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if((String)session.getAttribute("id") == null) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				// 예약 내역
				String id = (String) session.getAttribute("id");
				List<BookDTO> list = service.getGuestBookList(id);
				request.setAttribute("list", list);
				
				// 날짜 정보
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				String today = sdf.format(cal.getTime());
				request.setAttribute("today", today);
				
				return "book/guest_book_list";
			}
		} catch (IOException e) {
		}
		return null;
	}
	
	// 캠핑장 예약 취소 (일반 사용자 - 마이페이지) -희원,20210223
	@RequestMapping("/guestBookCancel.do")
	public String guestBookCancel(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String bno = request.getParameter("bno");
		try {
			if((String)session.getAttribute("id") == null) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				int count = service.guestBookCancel(bno);
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');location.href='guestBookListView.do';</script>");
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('해당 예약이 취소되었습니다.');location.href='guestBookListView.do';</script>");
				}
			}
		} catch (IOException e) {
			// TODO: handle exception
		}
		return null;
	}
	
	// 캠핑장 후기 작성 페이지로 이동 - 희원,20210223
    @RequestMapping("/reviewWriteView.do")
    public String reviewWriteView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    	try {
    		if(session.getAttribute("id") == null) {
    			response.setContentType("text/html;charset=utf-8");
    			response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
    		}else {
    			int contentId = Integer.parseInt(request.getParameter("contentId"));
    			String facltNm = request.getParameter("facltNm");
    			String bno = request.getParameter("bno");
    			
    			request.setAttribute("contentId", contentId);
    			request.setAttribute("facltNm", facltNm);
    			request.setAttribute("bno", bno);
    			
    			return "book/review_write";
    		}
		} catch (IOException e) {
		}
        return null;
    }
    
    // 캠핑장 후기 작성 - 희원,20210223
    @RequestMapping("/reviewWriteAction.do")
    public String reviewWriteAction(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) {
    	int contentId = Integer.parseInt(request.getParameter("contentId"));
    	String id = (String) session.getAttribute("id");
    	double star = Double.parseDouble(request.getParameter("star"));
    	String content = request.getParameter("content");
    	String facltNm = request.getParameter("facltNm");
    	String bno = request.getParameter("bno");
    	
    	int rno = service.getRno();
    	ReviewDTO reviewDTO = new ReviewDTO(rno, contentId, id, star, content, facltNm, bno);
    	int count = service.insertReview(reviewDTO);
    	try {
    		if(count == 0) {
    			response.setContentType("text/html;charset=utf-8");
    			response.getWriter().write("<script>alert('페이지 오류');location.href='guestBookListView.do';</script>");
    		}else {
    			// 파일 업로드
				List<MultipartFile> fileList = request.getFiles("file");
				String path = "c:\\fileupload\\review\\"+ id+"\\";
				ArrayList<ReviewFileDTO> fList = new ArrayList<ReviewFileDTO>();
				
				for(MultipartFile mf : fileList) {
					String originalFileName = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					if(fileSize == 0) continue;
					
					// 파일 업로드
					String safeFile = path + originalFileName;
					fList.add(new ReviewFileDTO(contentId, id, originalFileName, facltNm, rno));
					File parentPath = new File(path);
					if(!parentPath.exists()) parentPath.mkdirs();	// 경로 생성
					try {
						mf.transferTo(new File(safeFile));
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				// 후기 파일 테이블에 추가
				service.insertReviewFile(fList);
				// 예약 상태 - 후기 작성 완료 로 변경
				service.updateBookStatus(bno);
				
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('후기등록 완료!');location.href='guestBookListView.do';</script>");
    		}
			
		} catch (IOException e) {
		}
    	return null;
    }
    
    // 예약하기 페이지로 이동 - 희원,20210301
 	@RequestMapping("/bookView.do")
 	public String bookView(HttpServletRequest request) {
 		int contentId = Integer.parseInt(request.getParameter("contentId"));
 		String facltNm = request.getParameter("facltNm");
 		String bizrno = request.getParameter("bizrno");
 		String firstImageUrl = request.getParameter("firstImageUrl");
 		
 		request.setAttribute("contentId", contentId);
 		request.setAttribute("facltNm", facltNm);
 		request.setAttribute("bizrno", bizrno);
 		request.setAttribute("firstImageUrl", firstImageUrl);
 		// 날짜 정보
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String today = sdf.format(cal.getTime());
		request.setAttribute("today", today);
 		return "book/book";
 	}
 	
 	// 랜덤 예약번호 생성 -희원,20210301
 	public static String getRandomStr(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required."; 
	}
 	
 	// 예약 하기 - 희원,20210301
 	@RequestMapping("/bookAction.do")
 	public String bookAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
 		String start_date = request.getParameter("start_date");
 		String end_date = request.getParameter("end_date");
 		int contentId = Integer.parseInt(request.getParameter("contentId"));
 		String id = (String) session.getAttribute("id");
 		String facltNm = request.getParameter("facltNm");
 		String bizrno = request.getParameter("bizrno");
 		
 		// 예약번호 생성
 		String bno = null;
 		// 예약번호 중복 확인
 		while(true) {
 			bno = getRandomStr(6);
 			String check = service.checkBno(bno); 		
 			if(check == null) break;
 		}
 		
 		// 예약 테이블에 추가
 		BookDTO dto = new BookDTO(bno, start_date, end_date, contentId, id, facltNm, bizrno);
 		int count = service.insertBook(dto);
 		try {
 			if(count == 0) {
 				response.setContentType("text/html;charset=utf-8");
 				response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
 			}else {
 				response.setContentType("text/html;charset=utf-8");
 				response.getWriter().write("<script>alert('예약 신청 완료!');location.href='guestBookListView.do';</script>");
 			}
		} catch (IOException e) {
			e.printStackTrace();
		}
 		return null;
 	}
 	
 	// 예약 관리 페이지로 이동 (사업자) - 희원,20210303
 	@RequestMapping("/manageBookListView.do")
	public String manageBookListView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
 		try {
 			if(session.getAttribute("id") == null) {
 				response.setContentType("text/html;charset=utf-8");
 				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
 			}else {
 				String id = (String) session.getAttribute("id");
 				// 사업자의 사업자 번호와 일치하는 예약 목록을 읽어옴
 				// 사업자의 사업자 번호 가져오기
 				String bizrno = service.getBizrno(id);
 				// 사업자 번호와 일치하는 예약 목록
 				ArrayList<BookDTO> list = service.getManageBookList(bizrno); 
 				request.setAttribute("list", list);
 				return "book/manage_book_list";
 			}
		} catch (IOException e) {
			e.printStackTrace();
		}

 		return null;
 	}
 	
}
