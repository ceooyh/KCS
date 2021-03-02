package kcs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcs.dto.KeepDTO;
import kcs.dto.SpotDTO;
import kcs.service.KeepService;
import kcs.service.SpotService;
import kcs.vo.PaggingVO;

@Controller
public class KeepController {
	private KeepService service;
	private SpotService spotService;
	
	public KeepController(KeepService service, SpotService spotService) {
		super();
		this.service = service;
		this.spotService = spotService;
	}

	// 여기부터 RequestMapping 처리
	
	// 찜하기 수행 -희원, 20210301
	@RequestMapping("/keepAction.do")
	public String keepAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if(session.getAttribute("id") != null) {
				String id = (String) session.getAttribute("id");
				int contentId = Integer.parseInt(request.getParameter("contentId"));
				String facltNm = request.getParameter("facltNm");
				
				KeepDTO dto = new KeepDTO(contentId, id, facltNm);
				
				// 이미 찜한 목록인지 확인
				KeepDTO check = service.checkKeep(dto);
				if(check == null) {
					int count = service.insertKeep(dto);
					if(count == 0) {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
					}else {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write("<script>alert('찜하기 완료');location.href='keepSpotView.do';</script>");
					}
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('이미 찜한 캠핑장 입니다.');history.back();</script>");
				}
				
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 찜한 캠핑장 정보 검색 -희원,20210302
	public SpotDTO getSpotInfo(int contentId, String facltNm) {
		SpotDTO dto = null;
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(facltNm, "UTF-8")); /*검색 요청할 키워드(인코딩 필요)*/
			urlBuilder.append("&_type=json"); /*서비스명=어플명*/
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
 			JSONObject json = new JSONObject(sb.toString());
			
			if(conn.getResponseCode() == 200) {
				
				// 목록 받아오기
				try {
					// item이 jsonobject일 경우
					JSONObject j = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
					
					int contentId1 = j.has("contentId") ? j.getInt("contentId") : 1;
					String facltNm1 = j.has("facltNm") ? j.get("facltNm").toString() : "-";
					String lineIntro = j.has("lineIntro") ? j.get("lineIntro").toString() : "-";
					String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
					String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
					String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
					String tel = j.has("tel") ? j.get("tel").toString() : "-";
					String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
					String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					
					// 별점 평균
					double star = spotService.getStarAvg(contentId1);
					//리뷰수
					int review_count = spotService.getReviewCount(contentId1);
					
					if(contentId1 == contentId) {
						dto = new SpotDTO(contentId1, facltNm1, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count);
						return dto;
					}
				}catch(Exception e) {
					try {
						// item이 jsonarray일 경우
						// 목록 받아오기
						JSONArray arr = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
						for(int i=0; i<arr.length(); i++) {
							JSONObject j = arr.getJSONObject(i);
							
							int contentId1 = j.has("contentId") ? j.getInt("contentId") : 1;
							String facltNm1 = j.has("facltNm") ? j.get("facltNm").toString() : "-";
							String lineIntro = j.has("lineIntro") ? j.get("lineIntro").toString() : "-";
							String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
							String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
							String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
							String tel = j.has("tel") ? j.get("tel").toString() : "-";
							String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
							String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
							String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
							
							// 별점 평균
							double star = spotService.getStarAvg(contentId1);
							//리뷰수
							int review_count = spotService.getReviewCount(contentId1);
							
							if(contentId1 == contentId) {
								dto = new SpotDTO(contentId1, facltNm1, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count);
								return dto;
							}
						}
					}catch(Exception e1) {
						return null;
					}
				}
			} else {
				return null;
			}
			
			rd.close();
			conn.disconnect();
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	// 찜한 스팟 페이지로 이동 -희원,20210301
	@RequestMapping("/keepSpotView.do")
	public String keepSpotView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if(session.getAttribute("id") == null) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}else {
				String id = (String) session.getAttribute("id");
				// 사용자가 찜한 목록의 contentId와 facltNm으로 캠핑장 정보를 얻어옴
				ArrayList<KeepDTO> keeplist = service.getKeepList(id);
				
				ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
				
				for(int i=0; i<keeplist.size(); i++) {
					SpotDTO dto = getSpotInfo(keeplist.get(i).getContentId(), keeplist.get(i).getFacltNm());
					list.add(dto);
				}
				request.setAttribute("list", list);
				return "keep/keep_spot_view";
			}
		} catch (IOException e) {
			// TODO: handle exception
		}
		return null;
	}
	
	// 찜삭제 - 희원,20210301
	@RequestMapping("/keepDeleteAction.do")
	public String keepDeleteAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			if(session.getAttribute("id") != null) {
				int contentId = Integer.parseInt(request.getParameter("contentId"));
				String id = (String) session.getAttribute("id");
				int count = service.deleteKeep(contentId, id);
				if(count == 0) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
				}else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('찜한 목록에서 삭제 되었습니다.');location.href='keepSpotView.do';</script>");
				}
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('로그인 후 이용 가능합니다.');location.href='loginView.do';</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
