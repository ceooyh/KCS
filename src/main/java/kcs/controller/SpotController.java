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
					String facltNm = j.has("facltNm") ? j.getString("facltNm") : "-";
					String lineIntro = j.has("lineIntro") ? j.getString("lineIntro") : "-";
					String intro = j.has("intro") ? j.getString("intro") : "-";
					String bizrno = j.has("bizrno") ? j.getString("bizrno") : "-";
					String manageSttus = j.has("manageSttus") ? j.getString("manageSttus") : "-";
					String hvofBgnde = j.has("hvofBgnde") ? j.getString("hvofBgnde") : "-";
					String hvofEnddle = j.has("hvofEnddle") ? j.getString("hvofEnddle") : "-";
					String featureNm = j.has("featureNm") ? j.getString("featureNm") : "-";
					String induty = j.has("induty") ? j.getString("induty") : "-";
					String lctCl = j.has("lctCl") ? j.getString("lctCl") : "-";
					String doNm = j.has("doNm") ? j.getString("doNm") : "-";
					String sigunguNm = j.has("sigunguNm") ? j.getString("sigunguNm") : "-";
					int zipcode = j.has("zipcode") ? j.getInt("zipcode") : 1;
					String addr1 = j.has("addr1") ? j.getString("addr1") : "-";
					String addr2 = j.has("addr2") ? j.getString("addr2") : "-";
					String tel = j.has("tel") ? j.getString("tel") : "-";
					String homepage = j.has("homepage") ? j.getString("homepage") : "-";
					int gnrlSiteCo = j.has("gnrlSiteCo") ? j.getInt("gnrlSiteCo") : 1;
					int autoSiteCo = j.has("autoSiteCo") ? j.getInt("autoSiteCo") : 1;
					int glampSiteCo = j.has("glampSiteCo") ? j.getInt("glampSiteCo") : 1;
					int caravSiteCo = j.has("caravSiteCo") ? j.getInt("caravSiteCo") : 1;
					int indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.getInt("indvdlCaravSiteCo") : 1;
					int siteBottomCl1 = j.has("siteBottomCl1") ? j.getInt("siteBottomCl1") : 1;
					int siteBottomCl2 = j.has("siteBottomCl2") ? j.getInt("siteBottomCl2") : 1;
					int siteBottomCl3 = j.has("siteBottomCl3") ? j.getInt("siteBottomCl3") : 1;
					int siteBottomCl4 = j.has("siteBottomCl4") ? j.getInt("siteBottomCl4") : 1;
					int siteBottomCl5 = j.has("siteBottomCl5") ? j.getInt("siteBottomCl5") : 1;
					String glampInnerFclty = j.has("glampInnerFclty") ? j.getString("glampInnerFclty") : "-";
					String caravInnerFclty = j.has("caravInnerFclty") ? j.getString("caravInnerFclty") : "-";
					String operPdCl = j.has("operPdCl") ? j.getString("operPdCl") : "-";
					String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.getString("trlerAcmpnyAt") : "-";
					String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.getString("caravAcmpnyAt") : "-";
					int toiletCo = j.has("toiletCo") ? j.getInt("toiletCo") : 1;
					int swrmCo = j.has("swrmCo") ? j.getInt("swrmCo") : 1;
					int wtrplCo = j.has("wtrplCo") ? j.getInt("wtrplCo") : 1;
					String brazierCl = j.has("brazierCl") ? j.getString("brazierCl") : "-";
					String sbrsCl = j.has("sbrsCl") ? j.getString("sbrsCl") : "-";
					String sbrsEtc = j.has("sbrsEtc") ? j.getString("sbrsEtc") : "-";
					String posblFcltyCl = j.has("posblFcltyCl") ? j.getString("posblFcltyCl") : "-";
					String posblFcltyEtc = j.has("posblFcltyEtc") ? j.getString("posblFcltyEtc") : "-";
					String exprnProgrm = j.has("exprnProgrm") ? j.getString("exprnProgrm") : "-";
					String themaEnvrnCl = j.has("themaEnvrnCl") ? j.getString("themaEnvrnCl") : "-";
					String eqpmnLendCl = j.has("eqpmnLendCl") ? j.getString("eqpmnLendCl") : "-";
					String animalCmgCl = j.has("animalCmgCl") ? j.getString("animalCmgCl") : "-";
					String tourEraCl = j.has("tourEraCl") ? j.getString("tourEraCl") : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.getString("firstImageUrl") : "-";
					
					// 별점 평균
					double star = service.getStarAvg(contentId);
					//리뷰수
					int review_count = service.getReviewCount(contentId);
					
					// 리스트에 추가
					list.add(
							new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, hvofBgnde, hvofEnddle, featureNm, induty, lctCl, doNm, sigunguNm, zipcode, addr1, addr2, tel, homepage, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, glampInnerFclty, caravInnerFclty, operPdCl, trlerAcmpnyAt, caravAcmpnyAt, toiletCo, swrmCo, wtrplCo, brazierCl, sbrsCl, sbrsEtc, posblFcltyCl, posblFcltyEtc, exprnProgrm, themaEnvrnCl, eqpmnLendCl, animalCmgCl, tourEraCl, firstImageUrl, star, review_count)
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
					String facltNm = j.has("facltNm") ? j.getString("facltNm") : "-";
					String lineIntro = j.has("lineIntro") ? j.getString("lineIntro") : "-";
					String intro = j.has("intro") ? j.getString("intro") : "-";
					String bizrno = j.has("bizrno") ? j.getString("bizrno") : "-";
					String manageSttus = j.has("manageSttus") ? j.getString("manageSttus") : "-";
					String hvofBgnde = j.has("hvofBgnde") ? j.getString("hvofBgnde") : "-";
					String hvofEnddle = j.has("hvofEnddle") ? j.getString("hvofEnddle") : "-";
					String featureNm = j.has("featureNm") ? j.getString("featureNm") : "-";
					String induty = j.has("induty") ? j.getString("induty") : "-";
					String lctCl = j.has("lctCl") ? j.getString("lctCl") : "-";
					String doNm = j.has("doNm") ? j.getString("doNm") : "-";
					String sigunguNm = j.has("sigunguNm") ? j.getString("sigunguNm") : "-";
					int zipcode = j.has("zipcode") ? j.getInt("zipcode") : 1;
					String addr1 = j.has("addr1") ? j.getString("addr1") : "-";
					String addr2 = j.has("addr2") ? j.getString("addr2") : "-";
					String tel = j.has("tel") ? j.getString("tel") : "-";
					String homepage = j.has("homepage") ? j.getString("homepage") : "-";
					int gnrlSiteCo = j.has("gnrlSiteCo") ? j.getInt("gnrlSiteCo") : 1;
					int autoSiteCo = j.has("autoSiteCo") ? j.getInt("autoSiteCo") : 1;
					int glampSiteCo = j.has("glampSiteCo") ? j.getInt("glampSiteCo") : 1;
					int caravSiteCo = j.has("caravSiteCo") ? j.getInt("caravSiteCo") : 1;
					int indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.getInt("indvdlCaravSiteCo") : 1;
					int siteBottomCl1 = j.has("siteBottomCl1") ? j.getInt("siteBottomCl1") : 1;
					int siteBottomCl2 = j.has("siteBottomCl2") ? j.getInt("siteBottomCl2") : 1;
					int siteBottomCl3 = j.has("siteBottomCl3") ? j.getInt("siteBottomCl3") : 1;
					int siteBottomCl4 = j.has("siteBottomCl4") ? j.getInt("siteBottomCl4") : 1;
					int siteBottomCl5 = j.has("siteBottomCl5") ? j.getInt("siteBottomCl5") : 1;
					String glampInnerFclty = j.has("glampInnerFclty") ? j.getString("glampInnerFclty") : "-";
					String caravInnerFclty = j.has("caravInnerFclty") ? j.getString("caravInnerFclty") : "-";
					String operPdCl = j.has("operPdCl") ? j.getString("operPdCl") : "-";
					String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.getString("trlerAcmpnyAt") : "-";
					String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.getString("caravAcmpnyAt") : "-";
					int toiletCo = j.has("toiletCo") ? j.getInt("toiletCo") : 1;
					int swrmCo = j.has("swrmCo") ? j.getInt("swrmCo") : 1;
					int wtrplCo = j.has("wtrplCo") ? j.getInt("wtrplCo") : 1;
					String brazierCl = j.has("brazierCl") ? j.getString("brazierCl") : "-";
					String sbrsCl = j.has("sbrsCl") ? j.getString("sbrsCl") : "-";
					String sbrsEtc = j.has("sbrsEtc") ? j.getString("sbrsEtc") : "-";
					String posblFcltyCl = j.has("posblFcltyCl") ? j.getString("posblFcltyCl") : "-";
					String posblFcltyEtc = j.has("posblFcltyEtc") ? j.getString("posblFcltyEtc") : "-";
					String exprnProgrm = j.has("exprnProgrm") ? j.getString("exprnProgrm") : "-";
					String themaEnvrnCl = j.has("themaEnvrnCl") ? j.getString("themaEnvrnCl") : "-";
					String eqpmnLendCl = j.has("eqpmnLendCl") ? j.getString("eqpmnLendCl") : "-";
					String animalCmgCl = j.has("animalCmgCl") ? j.getString("animalCmgCl") : "-";
					String tourEraCl = j.has("tourEraCl") ? j.getString("tourEraCl") : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.getString("firstImageUrl") : "-";
					// 별점 평균
					double star = 0;
					//리뷰수
					int review_count = 0;
					
					// 리스트에 추가
					list.add(
							new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, hvofBgnde, hvofEnddle, featureNm, induty, lctCl, doNm, sigunguNm, zipcode, addr1, addr2, tel, homepage, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, glampInnerFclty, caravInnerFclty, operPdCl, trlerAcmpnyAt, caravAcmpnyAt, toiletCo, swrmCo, wtrplCo, brazierCl, sbrsCl, sbrsEtc, posblFcltyCl, posblFcltyEtc, exprnProgrm, themaEnvrnCl, eqpmnLendCl, animalCmgCl, tourEraCl, firstImageUrl, star, review_count)
							);
					
					
				}catch(Exception e) {
					try {
						// item이 jsonarray일 경우
						// 목록 받아오기
						JSONArray arr = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
						for(int i=0; i<arr.length(); i++) {
							JSONObject j = arr.getJSONObject(i);
							int contentId = j.has("contentId") ? j.getInt("contentId") : 1;
							String facltNm = j.has("facltNm") ? j.getString("facltNm") : "-";
							String lineIntro = j.has("lineIntro") ? j.getString("lineIntro") : "-";
							String intro = j.has("intro") ? j.getString("intro") : "-";
							String bizrno = j.has("bizrno") ? j.getString("bizrno") : "-";
							String manageSttus = j.has("manageSttus") ? j.getString("manageSttus") : "-";
							String hvofBgnde = j.has("hvofBgnde") ? j.getString("hvofBgnde") : "-";
							String hvofEnddle = j.has("hvofEnddle") ? j.getString("hvofEnddle") : "-";
							String featureNm = j.has("featureNm") ? j.getString("featureNm") : "-";
							String induty = j.has("induty") ? j.getString("induty") : "-";
							String lctCl = j.has("lctCl") ? j.getString("lctCl") : "-";
							String doNm = j.has("doNm") ? j.getString("doNm") : "-";
							String sigunguNm = j.has("sigunguNm") ? j.getString("sigunguNm") : "-";
							int zipcode = j.has("zipcode") ? j.getInt("zipcode") : 1;
							String addr1 = j.has("addr1") ? j.getString("addr1") : "-";
							String addr2 = j.has("addr2") ? j.getString("addr2") : "-";
							String tel = j.has("tel") ? j.getString("tel") : "-";
							String homepage = j.has("homepage") ? j.getString("homepage") : "-";
							int gnrlSiteCo = j.has("gnrlSiteCo") ? j.getInt("gnrlSiteCo") : 1;
							int autoSiteCo = j.has("autoSiteCo") ? j.getInt("autoSiteCo") : 1;
							int glampSiteCo = j.has("glampSiteCo") ? j.getInt("glampSiteCo") : 1;
							int caravSiteCo = j.has("caravSiteCo") ? j.getInt("caravSiteCo") : 1;
							int indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.getInt("indvdlCaravSiteCo") : 1;
							int siteBottomCl1 = j.has("siteBottomCl1") ? j.getInt("siteBottomCl1") : 1;
							int siteBottomCl2 = j.has("siteBottomCl2") ? j.getInt("siteBottomCl2") : 1;
							int siteBottomCl3 = j.has("siteBottomCl3") ? j.getInt("siteBottomCl3") : 1;
							int siteBottomCl4 = j.has("siteBottomCl4") ? j.getInt("siteBottomCl4") : 1;
							int siteBottomCl5 = j.has("siteBottomCl5") ? j.getInt("siteBottomCl5") : 1;
							String glampInnerFclty = j.has("glampInnerFclty") ? j.getString("glampInnerFclty") : "-";
							String caravInnerFclty = j.has("caravInnerFclty") ? j.getString("caravInnerFclty") : "-";
							String operPdCl = j.has("operPdCl") ? j.getString("operPdCl") : "-";
							String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.getString("trlerAcmpnyAt") : "-";
							String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.getString("caravAcmpnyAt") : "-";
							int toiletCo = j.has("toiletCo") ? j.getInt("toiletCo") : 1;
							int swrmCo = j.has("swrmCo") ? j.getInt("swrmCo") : 1;
							int wtrplCo = j.has("wtrplCo") ? j.getInt("wtrplCo") : 1;
							String brazierCl = j.has("brazierCl") ? j.getString("brazierCl") : "-";
							String sbrsCl = j.has("sbrsCl") ? j.getString("sbrsCl") : "-";
							String sbrsEtc = j.has("sbrsEtc") ? j.getString("sbrsEtc") : "-";
							String posblFcltyCl = j.has("posblFcltyCl") ? j.getString("posblFcltyCl") : "-";
							String posblFcltyEtc = j.has("posblFcltyEtc") ? j.getString("posblFcltyEtc") : "-";
							String exprnProgrm = j.has("exprnProgrm") ? j.getString("exprnProgrm") : "-";
							String themaEnvrnCl = j.has("themaEnvrnCl") ? j.getString("themaEnvrnCl") : "-";
							String eqpmnLendCl = j.has("eqpmnLendCl") ? j.getString("eqpmnLendCl") : "-";
							String animalCmgCl = j.has("animalCmgCl") ? j.getString("animalCmgCl") : "-";
							String tourEraCl = j.has("tourEraCl") ? j.getString("tourEraCl") : "-";
							String firstImageUrl = j.has("firstImageUrl") ? j.getString("firstImageUrl") : "-";
							// 별점 평균
							double star = 0;
							//리뷰수
							int review_count = 0;
							
							// 리스트에 추가
							list.add(
									new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, hvofBgnde, hvofEnddle, featureNm, induty, lctCl, doNm, sigunguNm, zipcode, addr1, addr2, tel, homepage, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, glampInnerFclty, caravInnerFclty, operPdCl, trlerAcmpnyAt, caravAcmpnyAt, toiletCo, swrmCo, wtrplCo, brazierCl, sbrsCl, sbrsEtc, posblFcltyCl, posblFcltyEtc, exprnProgrm, themaEnvrnCl, eqpmnLendCl, animalCmgCl, tourEraCl, firstImageUrl, star, review_count)
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
	
	// 캠핑장 상세 검색 - 희원,20210225
	@RequestMapping("/spotCategorySearch.do")
	public String spotCategorySearch(HttpServletRequest request) {
		 
		// 사용자가 선택한 상세 정보를 가진 가상의 SpotDTO 객체 생성 파라미터가 있으면 0 없으면 - or 1
		int contentId = request.getParameter("contentId") != null ? Integer.parseInt(request.getParameter("contentId")) : 1;
		String facltNm = request.getParameter("facltNm") != null ? request.getParameter("facltNm") : "-";
		String lineIntro = request.getParameter("lineIntro") != null ? request.getParameter("lineIntro") : "-";
		String intro = request.getParameter("intro") != null ? request.getParameter("intro") : "-";
		String bizrno = request.getParameter("bizrno") != null ? request.getParameter("bizrno") : "-";
		String manageSttus = request.getParameter("manageSttus") != null ? request.getParameter("manageSttus") : "-";
		String hvofBgnde = request.getParameter("hvofBgnde") != null ? request.getParameter("hvofBgnde") : "-";
		String hvofEnddle = request.getParameter("hvofEnddle") != null ? request.getParameter("hvofEnddle") : "-";
		String featureNm = request.getParameter("featureNm") != null ? request.getParameter("featureNm") : "-";
		String induty = request.getParameter("induty") != null ? request.getParameter("induty") : "-";
		String lctCl = request.getParameter("lctCl") != null ? request.getParameter("lctCl") : "-";
		String doNm = request.getParameter("doNm") != null ? request.getParameter("doNm") : "-";
		String sigunguNm = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		int zipcode = request.getParameter("contentId") != null ? Integer.parseInt(request.getParameter("contentId")) : 1;
		String addr1 = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String addr2 = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String tel = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String homepage = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		int gnrlSiteCo = request.getParameter("gnrlSiteCo") != null ? Integer.parseInt(request.getParameter("gnrlSiteCo")) : 1;
		int autoSiteCo = request.getParameter("autoSiteCo") != null ? Integer.parseInt(request.getParameter("autoSiteCo")) : 1;
		int glampSiteCo = request.getParameter("glampSiteCo") != null ? Integer.parseInt(request.getParameter("glampSiteCo")) : 1;
		int caravSiteCo = request.getParameter("caravSiteCo") != null ? Integer.parseInt(request.getParameter("caravSiteCo")) : 1;
		int indvdlCaravSiteCo = request.getParameter("indvdlCaravSiteCo") != null ? Integer.parseInt(request.getParameter("indvdlCaravSiteCo")) : 1;
		int siteBottomCl1 = request.getParameter("siteBottomCl1") != null ? Integer.parseInt(request.getParameter("siteBottomCl1")) : 1;
		int siteBottomCl2 = request.getParameter("siteBottomCl2") != null ? Integer.parseInt(request.getParameter("siteBottomCl2")) : 1;
		int siteBottomCl3 = request.getParameter("siteBottomCl3") != null ? Integer.parseInt(request.getParameter("siteBottomCl3")) : 1;
		int siteBottomCl4 = request.getParameter("siteBottomCl4") != null ? Integer.parseInt(request.getParameter("siteBottomCl4")) : 1;
		int siteBottomCl5 = request.getParameter("siteBottomCl5") != null ? Integer.parseInt(request.getParameter("siteBottomCl5")) : 1;
		String glampInnerFclty = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String caravInnerFclty = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String operPdCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String trlerAcmpnyAt = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String caravAcmpnyAt = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		int toiletCo = request.getParameter("toiletCo") != null ? Integer.parseInt(request.getParameter("toiletCo")) : 1;
		int swrmCo = request.getParameter("swrmCo") != null ? Integer.parseInt(request.getParameter("swrmCo")) : 1;
		int wtrplCo = request.getParameter("wtrplCo") != null ? Integer.parseInt(request.getParameter("wtrplCo")) : 1;
		String brazierCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String sbrsCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String sbrsEtc = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String posblFcltyCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String posblFcltyEtc = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String exprnProgrm = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String themaEnvrnCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String eqpmnLendCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String animalCmgCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String tourEraCl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		String firstImageUrl = request.getParameter("sigunguNm") != null ? request.getParameter("sigunguNm") : "-";
		
		
		return null;
	}
	
}
