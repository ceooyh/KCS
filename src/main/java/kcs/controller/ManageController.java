package kcs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcs.dto.BoardDTO;
import kcs.dto.MemberDTO;
import kcs.service.ManageService;
import kcs.vo.PaggingVO;

@Controller
public class ManageController {
	private ManageService service;

	public ManageController(ManageService service) {
		super();
		this.service = service;
	}

	// 여기부터 RequestMapping 처리
	@RequestMapping("/memberManageListView.do")
	public String memberManageList(HttpServletRequest request) {
		int pageNo = 1;
		//페이지 셋팅
		if(request.getParameter("pageNo") != null)
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		List<MemberDTO> list = service.selectAllMemberList(pageNo);//회원목록 읽어옴
		int count = service.selectCount();
		PaggingVO vo = new PaggingVO(count, pageNo);
		request.setAttribute("list", list);
		request.setAttribute("pagging", vo);
		return "manage/member_manage_list";
	}
	
	@RequestMapping("/memberDeleteAction.do")
	public String memberDeleteAction(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int count = service.deleteMember(id);
		System.out.println(count);
			try {
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('회원 삭제 실패')</script>");
				}
				else
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('회원 삭제 성공')</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		return memberManageList(request);
	}
	
	@RequestMapping("/MemberSearch.do")
	public String memberSearch(HttpServletRequest request, HttpServletResponse response) {
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		List<MemberDTO> list = service.membersearch(kind,search);
		request.setAttribute("list", list);
		return "manage/search_member_manage_list";
	}
}
