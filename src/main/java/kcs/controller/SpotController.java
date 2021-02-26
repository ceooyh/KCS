package kcs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcs.dto.SpotDTO;
import kcs.service.SpotService;
import kcs.vo.PaggingVO;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;

@Controller
public class SpotController {
	private SpotService service;

	public SpotController(SpotService service) {
		super();
		this.service = service;
	}
	
	// 여기부터 RequestMapping 처리
	
	// 캠핑장 찾기 페이지로 이동 - 희원,20210225
	@RequestMapping("/findCampSpotView.do")
    public String findCampSpotView(HttpServletRequest request, HttpServletResponse response) {
		
		// 페이징
		String pageNo = "1";
		if(request.getParameter("pageNo") != null)
			pageNo = request.getParameter("pageNo");
		
		//페이징 정보
		int count = 0;
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
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
				ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
				
				// 페이징 처리 위한 총 개수
				count = json.getJSONObject("response").getJSONObject("body").getInt("totalCount");
				
				// 목록 받아오기
				JSONArray arr = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
				for(int i=0; i<arr.length(); i++) {
					JSONObject j = arr.getJSONObject(i);
					
					int contentId = j.has("contentId") ? j.getInt("contentId") : 1;
					String facltNm = j.has("facltNm") ? j.get("facltNm").toString() : "-";
					String lineIntro = j.has("lineIntro") ? j.get("lineIntro").toString() : "-";
					String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
					String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
					String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
					String tel = j.has("tel") ? j.get("tel").toString() : "-";
					String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
					String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					
					// 별점 평균
					double star = service.getStarAvg(contentId);
					//리뷰수
					int review_count = service.getReviewCount(contentId);
					
					// 리스트에 추가
					list.add(
							new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, homepage, sbrsCl, firstImageUrl, star, review_count)
							);
					
				}

				// 페이징 정보
				PaggingVO page = new PaggingVO(count, Integer.parseInt(pageNo));
				
				request.setAttribute("list", list);
				request.setAttribute("pageNo", pageNo);
				request.setAttribute("page", page);
				
				return "spot/spot_search";
				
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
			}
			
			rd.close();
			conn.disconnect();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
    }
	
	// 캠핑장 검색 (캠핑장 이름, 키워드-태그, 지역) - 희원,20210225
	@RequestMapping("/spotSearch.do")
	public String spotSearch(HttpServletRequest request, HttpServletResponse response) {
		// 검색어
		String search = request.getParameter("search");
		
		// 페이징
		String pageNo = "1";
		if(request.getParameter("pageNo") != null)
			pageNo = request.getParameter("pageNo");
		
		// 페이징 정보
		int count = 0;
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(search, "UTF-8")); /*검색 요청할 키워드(인코딩 필요)*/
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
			
			ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
			
			if(conn.getResponseCode() == 200) {
				
				// 페이징 처리 위한 총 개수
				count = json.getJSONObject("response").getJSONObject("body").getInt("totalCount");
				
				// 목록 받아오기
				try {
					// item이 jsonobject일 경우
					JSONObject j = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
					
					int contentId = j.has("contentId") ? j.getInt("contentId") : 1;
					String facltNm = j.has("facltNm") ? j.get("facltNm").toString() : "-";
					String lineIntro = j.has("lineIntro") ? j.get("lineIntro").toString() : "-";
					String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
					String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
					String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
					String tel = j.has("tel") ? j.get("tel").toString() : "-";
					String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
					String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					
					// 별점 평균
					double star = service.getStarAvg(contentId);
					//리뷰수
					int review_count = service.getReviewCount(contentId);
					
					// 리스트에 추가
					list.add(
							new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, homepage, sbrsCl, firstImageUrl, star, review_count)
							);
					
				}catch(Exception e) {
					try {
						// item이 jsonarray일 경우
						// 목록 받아오기
						JSONArray arr = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
						for(int i=0; i<arr.length(); i++) {
							JSONObject j = arr.getJSONObject(i);
							
							int contentId = j.has("contentId") ? j.getInt("contentId") : 1;
							String facltNm = j.has("facltNm") ? j.get("facltNm").toString() : "-";
							String lineIntro = j.has("lineIntro") ? j.get("lineIntro").toString() : "-";
							String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
							String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
							String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
							String tel = j.has("tel") ? j.get("tel").toString() : "-";
							String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
							String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
							String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
							
							// 별점 평균
							double star = service.getStarAvg(contentId);
							//리뷰수
							int review_count = service.getReviewCount(contentId);
							
							// 리스트에 추가
							list.add(
									new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, homepage, sbrsCl, firstImageUrl, star, review_count)
									);
						}
					}catch(Exception e1) {
						// 아무것도 아닐 경우 item : ""
						
					}
				}

				// 페이징 정보
				PaggingVO page = new PaggingVO(count, Integer.parseInt(pageNo));

				request.setAttribute("list", list);
				request.setAttribute("pageNo", pageNo);
				request.setAttribute("page", page);
				
				return "spot/spot_search";
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
			}
			
			rd.close();
			conn.disconnect();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 캠핑장 상세 검색 - 희원,20210226
	@RequestMapping("/spotCategorySearch.do")
	public String spotCategorySearch(HttpServletRequest request, HttpServletResponse response) {
		// 결과값을 담을 list
		ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
		
		// 파라미터
		// 지역
		String[] arr_doNm = null;
		String doNm = "";
		if(request.getParameterValues("doNm") != null) {
			arr_doNm = request.getParameterValues("doNm");
			for(int i=0; i<arr_doNm.length; i++) doNm += arr_doNm[i].trim();
		}else {
			doNm = "-";
		}
		
		// 캠핑유형
		String gnrlSiteCo = request.getParameter("gnrlSiteCo") != null ? request.getParameter("gnrlSiteCo") : "-";
		String autoSiteCo = request.getParameter("autoSiteCo") != null ? request.getParameter("autoSiteCo") : "-";
		String glampSiteCo = request.getParameter("glampSiteCo") != null ? request.getParameter("glampSiteCo") : "-";
		String caravSiteCo = request.getParameter("caravSiteCo") != null ? request.getParameter("caravSiteCo") : "-";
		String indvdlCaravSiteCo = request.getParameter("indvdlCaravSiteCo") != null ? request.getParameter("indvdlCaravSiteCo") : "-";
		
		// 입지구분
		String[] arr_lctCl = request.getParameterValues("lctCl");
		String lctCl = "";
		if(request.getParameterValues("lctCl") != null) {
			arr_lctCl = request.getParameterValues("lctCl");
			for(int i=0; i<arr_lctCl.length; i++) lctCl += arr_lctCl[i].trim();
		}else {
			lctCl = "-";
		}
		
		// 바닥 형태
		String siteBottomCl1 = request.getParameter("siteBottomCl1") != null ? request.getParameter("siteBottomCl1") : "-";
		String siteBottomCl2 = request.getParameter("siteBottomCl2") != null ? request.getParameter("siteBottomCl2") : "-";
		String siteBottomCl3 = request.getParameter("siteBottomCl3") != null ? request.getParameter("siteBottomCl3") : "-";
		String siteBottomCl4 = request.getParameter("siteBottomCl4") != null ? request.getParameter("siteBottomCl4") : "-";
		String siteBottomCl5 = request.getParameter("siteBottomCl5") != null ? request.getParameter("siteBottomCl5") : "-";
		
		// 부가시설
		String[] arr_sbrsCl = request.getParameterValues("sbrsCl");
		String sbrsCl = "";
		if(request.getParameterValues("sbrsCl") != null) {
			arr_sbrsCl = request.getParameterValues("sbrsCl");
			for(int i=0; i<arr_sbrsCl.length; i++) sbrsCl += arr_sbrsCl[i].trim();
		}else {
			sbrsCl = "-";
		}
		
		// 명소
		String[] arr_themaEnvrnCl = request.getParameterValues("themaEnvrnCl");
		String themaEnvrnCl = "";
		if(request.getParameterValues("themaEnvrnCl") != null) {
			arr_themaEnvrnCl = request.getParameterValues("themaEnvrnCl");
			for(int i=0; i<arr_themaEnvrnCl.length; i++) themaEnvrnCl += arr_themaEnvrnCl[i].trim();
		}else {
			themaEnvrnCl = "-";
		}
		
		// 캠핑테마
		String animalCmgCl = request.getParameter("animalCmgCl") != null && !request.getParameter("animalCmgCl").equals("불가능") ? request.getParameter("animalCmgCl") : "-";
		String trlerAcmpnyAt = request.getParameter("trlerAcmpnyAt") != null && !request.getParameter("trlerAcmpnyAt").equals("N") ? request.getParameter("trlerAcmpnyAt") : "-";
		String caravAcmpnyAt = request.getParameter("caravAcmpnyAt") != null && !request.getParameter("caravAcmpnyAt").equals("N") ? request.getParameter("caravAcmpnyAt") : "-";
		
		// 페이징
		String pageNo = "1";
		if(request.getParameter("pageNo") != null)
			pageNo = request.getParameter("pageNo");
		
		// 상세 조건으로 만든 spotDTO
		SpotDTO searchDTO = new SpotDTO(0, "-", "-", "-", "-", "-", "-", "-", lctCl, doNm, "-", "-", "-", "-", "-", "-", gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, "-", "-", "-", "-", siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, "-", "-", trlerAcmpnyAt, caravAcmpnyAt, "-", "-", "-", sbrsCl, themaEnvrnCl, "-", animalCmgCl, "-", 0, 0);
		
		//페이징 정보
		int count = 0;
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
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
				ArrayList<SpotDTO> allList = new ArrayList<SpotDTO>();
				
				// 페이징 처리 위한 총 개수
				count = json.getJSONObject("response").getJSONObject("body").getInt("totalCount");
				
				// 목록 받아오기
				JSONArray arr = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
				for(int i=0; i<arr.length(); i++) {
					JSONObject j = arr.getJSONObject(i);
					int contentId = j.has("contentId") ? j.getInt("contentId") : 1;
					String facltNm = j.has("facltNm") ? j.get("facltNm").toString() : "-";
					String lineIntro = j.has("lineIntro") ? j.get("lineIntro").toString() : "-";
					String intro = j.has("intro") ? j.get("intro").toString() : "-";
					String bizrno = j.has("bizrno") ? j.get("bizrno").toString() : "-";
					String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
					String featureNm = j.has("featureNm") ? j.get("featureNm").toString() : "-";
					String induty = j.has("induty") ? j.get("induty").toString() : "-";
					String lctCl1 = j.has("lctCl") ? j.get("lctCl").toString() : "-";
					String doNm1 = j.has("doNm") ? j.get("doNm").toString() : "-";
					String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
					String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
					String tel = j.has("tel") ? j.get("tel").toString() : "-";
					String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
					String gnrlSiteCo1 = j.has("gnrlSiteCo") ? j.get("gnrlSiteCo").toString() : "-";
					String autoSiteCo1 = j.has("autoSiteCo") ? j.get("autoSiteCo").toString() : "-";
					String glampSiteCo1 = j.has("glampSiteCo") ? j.get("glampSiteCo").toString() : "-";
					String caravSiteCo1 = j.has("caravSiteCo") ? j.get("caravSiteCo").toString() : "-";
					String indvdlCaravSiteCo1 = j.has("indvdlCaravSiteCo") ? j.get("indvdlCaravSiteCo").toString() : "-";
					String sitedStnc = j.has("sitedStnc") ? j.get("sitedStnc").toString() : "-";
					String siteMg1Width = j.has("siteMg1Width") ? j.get("siteMg1Width").toString() : "-";
					String siteMg1Vrticl = j.has("siteMg1Vrticl") ? j.get("siteMg1Vrticl").toString() : "-";
					String siteMg1Co = j.has("siteMg1Co") ? j.get("siteMg1Co").toString() : "-";
					String siteBottomCl11 = j.has("siteBottomCl1") ? j.get("siteBottomCl1").toString() : "-";
					String siteBottomCl21 = j.has("siteBottomCl2") ? j.get("siteBottomCl2").toString() : "-";
					String siteBottomCl31 = j.has("siteBottomCl3") ? j.get("siteBottomCl3").toString() : "-";
					String siteBottomCl41 = j.has("siteBottomCl4") ? j.get("siteBottomCl4").toString() : "-";
					String siteBottomCl51 = j.has("siteBottomCl5") ? j.get("siteBottomCl5").toString() : "-";
					String operPdCl = j.has("operPdCl") ? j.get("operPdCl").toString() : "-";
					String operDeCl = j.has("operDeCl") ? j.get("operDeCl").toString() : "-";
					String trlerAcmpnyAt1 = j.has("trlerAcmpnyAt") ? j.get("trlerAcmpnyAt").toString() : "-";
					String caravAcmpnyAt1 = j.has("caravAcmpnyAt") ? j.get("caravAcmpnyAt").toString() : "-";
					String sbrsCl1 = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String themaEnvrnCl1 = j.has("themaEnvrnCl") ? j.get("themaEnvrnCl").toString() : "-";
					String eqpmnLendCl = j.has("eqpmnLendCl") ? j.get("eqpmnLendCl").toString() : "-";
					String animalCmgCl1 = j.has("animalCmgCl") ? j.get("animalCmgCl").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					
					// 별점 평균
					double star = service.getStarAvg(contentId);
					//리뷰수
					int review_count = service.getReviewCount(contentId);
					
					// 리스트에 추가
					allList.add(
							new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, featureNm, induty, lctCl1, doNm1, addr1, addr2, tel, homepage, tel, homepage, gnrlSiteCo1, autoSiteCo1, glampSiteCo1, caravSiteCo1, indvdlCaravSiteCo1, sitedStnc, siteMg1Width, siteMg1Vrticl, siteMg1Co, siteBottomCl11, siteBottomCl21, siteBottomCl31, siteBottomCl41, siteBottomCl51, operPdCl, operDeCl, trlerAcmpnyAt1, caravAcmpnyAt1, operDeCl, trlerAcmpnyAt1, caravAcmpnyAt1, sbrsCl1, themaEnvrnCl1, eqpmnLendCl, animalCmgCl1, firstImageUrl, star, review_count)
							);
					allList.get(i).toString();
					
				}

				// allList 상세 조건에 맞는 dto를 list에 추가
				for(int i=0; i<allList.size(); i++) {
					if(allList.get(i).equals(searchDTO)) {
						list.add(allList.get(i));
					}else {
					}
				}
				
				// 페이징 정보
				PaggingVO page = new PaggingVO(count, Integer.parseInt(pageNo));
				
				request.setAttribute("list", list);
				request.setAttribute("pageNo", pageNo);
				request.setAttribute("page", page);
				
				return "spot/spot_search";
				
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
			}
			
			rd.close();
			conn.disconnect();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				
		
		return null;
	}
	
	
}
