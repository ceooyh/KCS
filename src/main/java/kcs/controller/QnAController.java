package kcs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcs.dto.QnADTO;
import kcs.service.QnAService;
import kcs.vo.PaggingVO;

@Controller
public class QnAController {
	private QnAService service;

	public QnAController(QnAService service) {
		super();
		this.service = service;
	}

	// 여기부터 RequestMapping 처리
	
	// 문의하기 페이지로 이동 - 희원,20210221
	@RequestMapping("/qnaView.do")
	public String qnaView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// 세션 정보
		int user_type = (int) session.getAttribute("user_type");
		String writer = "";
		// 페이징
		int pageNo = 1;
		if(request.getParameter("pageNo") != null)
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		// 페이징 정보
		int count = 0;
		if(user_type == 0)
			count = service.getAllQnACount();	// 관리자일 경우 전체 문의 개수
		else {
			writer = (String) session.getAttribute("id");
			count = service.getQnACount(writer);	// 일반사용자/사업자일 경우 사용자 문의 개수
		}
		PaggingVO pageVo = new PaggingVO(count, pageNo);
		
		// 문의 목록
		List<QnADTO> list = null;
		if(user_type == 0)
			list = service.getAllQnAList(pageNo);	// 관리자
		else
			list = service.getQnAList(pageNo, writer);	// 일반사용자/사업자
	
		request.setAttribute("list", list);
		request.setAttribute("pageVo", pageVo);
		return "qna/qna";
	}
	
	// 문의 등록 - 희원,20210221
	@RequestMapping("/sendQnA.do")
	public String sendQnA(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if(session.getAttribute("id") == null) {	// 세션 종료된 경우
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				String writer = (String) session.getAttribute("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				QnADTO dto = new QnADTO(title, writer, content); 
				// 문의 등록
				int count = service.sendQnA(dto);
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('문의 등록 완료!');location.href='qnaView.do';</script>");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	// 문의 답변 페이지 - 가현,20210224
	@RequestMapping("/qnaAdminAnswer.do")
	public String qnaAdminAnswer(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if((int)session.getAttribute("user_type") != 0) {	// 세션 종료된 경우
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('관리자만 이용할 수 있는 메뉴입니다.<br> 로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				String qno = (String) session.getAttribute("qno");
				String writer = (String) session.getAttribute("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				QnADTO dto = new QnADTO(qno, writer, content);
				
				// 답변 등록
				int count = service.insertAdminAnswer(dto);
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');location.href='qnaView.do';</script>");
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('답변 등록 완료!');location.href='qnaView.do';</script>");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 문의 수정 페이지 - 가현,20210226
	@RequestMapping("/qnaAjaxUpdate.do")
	public String qnaAjaxUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if(session.getAttribute("id") == null) {	// 세션 종료된 경우
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				String qno = (String) session.getAttribute("qno");
				String writer = (String) session.getAttribute("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				QnADTO dto = new QnADTO(title, writer, content); 
				
				// 문의 수정
				int count = service.updateQnA(dto);
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');location.href='qnaView.do';</script>");
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('문의 수정 완료!');location.href='qnaView.do';</script>");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 문의 삭제 페이지 - 가현,2021026
	@RequestMapping("/qnaAjaxDelete.do")
	public String qnaAjaxDelete(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		try {
			if(session.getAttribute("id") == null) {	// 세션 종료된 경우
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				String qno = (String) session.getAttribute("qno");
				String writer = (String) session.getAttribute("id");
		
				// 문의 삭제
				int count = service.deleteQnA(qno);
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');location.href='qnaView.do';</script>");
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('문의 삭제 완료!');location.href='qnaView.do';</script>");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
