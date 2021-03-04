package kcs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcs.dto.ReviewDTO;
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
	
	// 캠핑장 키워드검색 페이지로 이동 - 희원,20210225
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
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
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
							new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count)
							);
					
				}

				// 페이징 정보
				PaggingVO page = new PaggingVO(count, Integer.parseInt(pageNo));
				
				request.setAttribute("search", "");
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
	
	// 캠핑장 키워드 검색 - 희원,20210304
	@RequestMapping("/spotSearch.do")
	public String spotSearch(HttpServletRequest request, HttpServletResponse response) {
		// 검색어
				String search = "";
				if(request.getParameter("search") != null)
					search = request.getParameter("search");
						
				// 페이징
				String pageNo = "1";
				if(request.getParameter("pageNo") != null)
					pageNo = request.getParameter("pageNo");
				
				// 페이징 정보
				int count = 0;
				
				try {
					StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"); /*URL*/
					urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D"); /*Service Key*/
					urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
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
									new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count)
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
											new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count)
											);
								}
							}catch(Exception e1) {
								// 아무것도 아닐 경우 item : ""
								response.setContentType("text/html;charset=utf-8");
								response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
							}
						}

						// 페이징 정보
						PaggingVO page = new PaggingVO(count, Integer.parseInt(pageNo));

						request.setAttribute("search", search);
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
		// 총 캠핑장 개수
		int total = getTotal();
		// 100개씩 총 돌아갈 횟수
		int totalPage = total / 100 + 1;
		
		// 결과값을 담을 list
		ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
		
		// 파라미터
		// 지역
		String[] arr_doNm = null;
		String doNm = "";
		if(request.getParameterValues("doNm") != null) {
			arr_doNm = request.getParameterValues("doNm");
			for(int i=0; i<arr_doNm.length; i++) doNm += arr_doNm[i] + ",";
			if(arr_doNm.length > 1) doNm = doNm.substring(0, doNm.length()-1);
			else doNm = arr_doNm[0];
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
			for(int i=0; i<arr_lctCl.length; i++) lctCl += arr_lctCl[i] + ",";
			if(arr_lctCl.length > 1) lctCl = lctCl.substring(0, lctCl.length()-1);
			else lctCl = arr_lctCl[0];
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
			for(int i=0; i<arr_sbrsCl.length; i++) sbrsCl += arr_sbrsCl[i] + ",";
			if(arr_sbrsCl.length > 1) sbrsCl = sbrsCl.substring(0, sbrsCl.length()-1);
			else sbrsCl = arr_sbrsCl[0];
		}else {
			sbrsCl = "-";
		}
		
		// 명소
		String[] arr_themaEnvrnCl = request.getParameterValues("themaEnvrnCl");
		String themaEnvrnCl = "";
		if(request.getParameterValues("themaEnvrnCl") != null) {
			arr_themaEnvrnCl = request.getParameterValues("themaEnvrnCl");
			for(int i=0; i<arr_themaEnvrnCl.length; i++) themaEnvrnCl += arr_themaEnvrnCl[i] + ",";
			if(arr_themaEnvrnCl.length > 1) themaEnvrnCl = themaEnvrnCl.substring(0, themaEnvrnCl.length()-1);
			else themaEnvrnCl = arr_themaEnvrnCl[0];
		}else {
			themaEnvrnCl = "-";
		}
		
		// 캠핑테마
		String animalCmgCl = request.getParameter("animalCmgCl") != null && !request.getParameter("animalCmgCl").equals("불가능") ? request.getParameter("animalCmgCl") : "-";
		String trlerAcmpnyAt = request.getParameter("trlerAcmpnyAt") != null && !request.getParameter("trlerAcmpnyAt").equals("N") ? request.getParameter("trlerAcmpnyAt") : "-";
		String caravAcmpnyAt = request.getParameter("caravAcmpnyAt") != null && !request.getParameter("caravAcmpnyAt").equals("N") ? request.getParameter("caravAcmpnyAt") : "-";
		
		// 페이지 정보
		String pageNo = "1";
		if(request.getParameter("pageNo") != null)
			pageNo = request.getParameter("pageNo");
		
		// 상세 조건으로 만든 spotDTO
		SpotDTO searchDTO = new SpotDTO(0, "-", "-", "-", "-", "-", "-", "-", lctCl, doNm, "-", "-", "-", "-", "-", "-", gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, "-", "-", "-", "-", siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, "-", "-", trlerAcmpnyAt, caravAcmpnyAt, "-", "-", "-", sbrsCl, themaEnvrnCl, "-", animalCmgCl, "-", 0, 0);
		
		// 조건 검색과 일치하는 리스트
		ArrayList<SpotDTO> searchList = new ArrayList<SpotDTO>();
		
		// 100개씩 totalPage까지 돌면서 originList에서 spotDTO와 일치하는 항목을 list에 추가
		ArrayList<SpotDTO> originList = new ArrayList<SpotDTO>();
		for(int i=0; i<totalPage; i++) {
			originList = getSpotList(i);
			for(int j=0; j<originList.size(); j++) {
				if(originList.get(j).equals(searchDTO))
					searchList.add(originList.get(j));
			}
		}
		
		//페이징 정보
		int count = searchList.size();
		
		// 선택한 페이징만큼 리스트 보여줌
		for(int i=Integer.parseInt(pageNo)-1; i<Integer.parseInt(pageNo)*10; i++)
			list.add(searchList.get(i));
		
		// 페이징 정보
		PaggingVO page = new PaggingVO(count, Integer.parseInt(pageNo));
		
		request.setAttribute("searchDTO", searchDTO);
		request.setAttribute("list", list);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("page", page);
		
		return "spot/spot_search_category";
	}
	
	// 캠핑장 상세 보기 페이지 - 희원,20210228
	@RequestMapping("/spotDetailView.do")
	public String spotDetailView(HttpServletRequest request, HttpServletResponse response) {
		// 선택한 캠핑장 이름
		String spotName = request.getParameter("facltNm");
		// 선택한 캠핑장 번호
		String spotContentId = request.getParameter("contentId");
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(spotName, "UTF-8")); /*검색 요청할 키워드(인코딩 필요)*/
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
				
				// 목록 받아오기
				try {
					// item이 jsonobject일 경우
					JSONObject j = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
					
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
					String mapX = j.has("mapX") ? j.get("mapX").toString() : "-";
					String mapY = j.has("mapY") ? j.get("mapY").toString() : "-";
					String tel = j.has("tel") ? j.get("tel").toString() : "-";
					String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
					String gnrlSiteCo = j.has("gnrlSiteCo") ? j.get("gnrlSiteCo").toString() : "-";
					String autoSiteCo = j.has("autoSiteCo") ? j.get("autoSiteCo").toString() : "-";
					String glampSiteCo = j.has("glampSiteCo") ? j.get("glampSiteCo").toString() : "-";
					String caravSiteCo = j.has("caravSiteCo") ? j.get("caravSiteCo").toString() : "-";
					String indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.get("indvdlCaravSiteCo").toString() : "-";
					String sitedStnc = j.has("sitedStnc") ? j.get("sitedStnc").toString() : "-";
					String siteMg1Width = j.has("siteMg1Width") ? j.get("siteMg1Width").toString() : "-";
					String siteMg1Vrticl = j.has("siteMg1Vrticl") ? j.get("siteMg1Vrticl").toString() : "-";
					String siteMg1Co = j.has("siteMg1Co") ? j.get("siteMg1Co").toString() : "-";
					String siteBottomCl1 = j.has("siteBottomCl1") ? j.get("siteBottomCl1").toString() : "-";
					String siteBottomCl2 = j.has("siteBottomCl2") ? j.get("siteBottomCl2").toString() : "-";
					String siteBottomCl3 = j.has("siteBottomCl3") ? j.get("siteBottomCl3").toString() : "-";
					String siteBottomCl4 = j.has("siteBottomCl4") ? j.get("siteBottomCl4").toString() : "-";
					String siteBottomCl5 = j.has("siteBottomCl5") ? j.get("siteBottomCl5").toString() : "-";
					String operPdCl = j.has("operPdCl") ? j.get("operPdCl").toString() : "-";
					String operDeCl = j.has("operDeCl") ? j.get("operDeCl").toString() : "-";
					String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.get("trlerAcmpnyAt").toString() : "-";
					String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.get("caravAcmpnyAt").toString() : "-";
					String toiletCo = j.has("toiletCo") ? j.get("toiletCo").toString() : "-";
					String swrmCo = j.has("swrmCo") ? j.get("swrmCo").toString() : "-";
					String wtrplCo = j.has("wtrplCo") ? j.get("wtrplCo").toString() : "-";
					String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String themaEnvrnCl1 = j.has("themaEnvrnCl") ? j.get("themaEnvrnCl").toString() : "-";
					String eqpmnLendCl = j.has("eqpmnLendCl") ? j.get("eqpmnLendCl").toString() : "-";
					String animalCmgCl1 = j.has("animalCmgCl") ? j.get("animalCmgCl").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					
					// 별점 평균
					double star = service.getStarAvg(contentId);
					//리뷰수
					int review_count = service.getReviewCount(contentId);
					
					// 리스트에 추가
					list.add(
							new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, featureNm, induty, lctCl1, doNm1, addr1, addr2, mapX, mapY, tel, homepage, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, sitedStnc, siteMg1Width, siteMg1Vrticl, siteMg1Co, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, operPdCl, operDeCl, trlerAcmpnyAt, caravAcmpnyAt, toiletCo, swrmCo, wtrplCo, sbrsCl, themaEnvrnCl1, eqpmnLendCl, animalCmgCl1, firstImageUrl, star, review_count)
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
							String intro = j.has("intro") ? j.get("intro").toString() : "-";
							String bizrno = j.has("bizrno") ? j.get("bizrno").toString() : "-";
							String manageSttus = j.has("manageSttus") ? j.get("manageSttus").toString() : "-";
							String featureNm = j.has("featureNm") ? j.get("featureNm").toString() : "-";
							String induty = j.has("induty") ? j.get("induty").toString() : "-";
							String lctCl1 = j.has("lctCl") ? j.get("lctCl").toString() : "-";
							String doNm1 = j.has("doNm") ? j.get("doNm").toString() : "-";
							String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
							String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
							String mapX = j.has("mapX") ? j.get("mapX").toString() : "-";
							String mapY = j.has("mapY") ? j.get("mapY").toString() : "-";
							String tel = j.has("tel") ? j.get("tel").toString() : "-";
							String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
							String gnrlSiteCo = j.has("gnrlSiteCo") ? j.get("gnrlSiteCo").toString() : "-";
							String autoSiteCo = j.has("autoSiteCo") ? j.get("autoSiteCo").toString() : "-";
							String glampSiteCo = j.has("glampSiteCo") ? j.get("glampSiteCo").toString() : "-";
							String caravSiteCo = j.has("caravSiteCo") ? j.get("caravSiteCo").toString() : "-";
							String indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.get("indvdlCaravSiteCo").toString() : "-";
							String sitedStnc = j.has("sitedStnc") ? j.get("sitedStnc").toString() : "-";
							String siteMg1Width = j.has("siteMg1Width") ? j.get("siteMg1Width").toString() : "-";
							String siteMg1Vrticl = j.has("siteMg1Vrticl") ? j.get("siteMg1Vrticl").toString() : "-";
							String siteMg1Co = j.has("siteMg1Co") ? j.get("siteMg1Co").toString() : "-";
							String siteBottomCl1 = j.has("siteBottomCl1") ? j.get("siteBottomCl1").toString() : "-";
							String siteBottomCl2 = j.has("siteBottomCl2") ? j.get("siteBottomCl2").toString() : "-";
							String siteBottomCl3 = j.has("siteBottomCl3") ? j.get("siteBottomCl3").toString() : "-";
							String siteBottomCl4 = j.has("siteBottomCl4") ? j.get("siteBottomCl4").toString() : "-";
							String siteBottomCl5 = j.has("siteBottomCl5") ? j.get("siteBottomCl5").toString() : "-";
							String operPdCl = j.has("operPdCl") ? j.get("operPdCl").toString() : "-";
							String operDeCl = j.has("operDeCl") ? j.get("operDeCl").toString() : "-";
							String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.get("trlerAcmpnyAt").toString() : "-";
							String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.get("caravAcmpnyAt").toString() : "-";
							String toiletCo = j.has("toiletCo") ? j.get("toiletCo").toString() : "-";
							String swrmCo = j.has("swrmCo") ? j.get("swrmCo").toString() : "-";
							String wtrplCo = j.has("wtrplCo") ? j.get("wtrplCo").toString() : "-";
							String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
							String themaEnvrnCl1 = j.has("themaEnvrnCl") ? j.get("themaEnvrnCl").toString() : "-";
							String eqpmnLendCl = j.has("eqpmnLendCl") ? j.get("eqpmnLendCl").toString() : "-";
							String animalCmgCl1 = j.has("animalCmgCl") ? j.get("animalCmgCl").toString() : "-";
							String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
							
							// 별점 평균
							double star = service.getStarAvg(contentId);
							//리뷰수
							int review_count = service.getReviewCount(contentId);
							
							// 리스트에 추가
							list.add(
									new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, featureNm, induty, lctCl1, doNm1, addr1, addr2, mapX, mapY, tel, homepage, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, sitedStnc, siteMg1Width, siteMg1Vrticl, siteMg1Co, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, operPdCl, operDeCl, trlerAcmpnyAt, caravAcmpnyAt, toiletCo, swrmCo, wtrplCo, sbrsCl, themaEnvrnCl1, eqpmnLendCl, animalCmgCl1, firstImageUrl, star, review_count)
									);
						}
					}catch(Exception e1) {
						// 아무것도 아닐 경우 item : ""
					}
				}

				// 캠핑장 정보 DTO
				SpotDTO spotDTO = null;
				
				if(list.size() > 1) {
					// 같은 이름의 캠핑장이 있을 경우 contentId로 다시 비교
					for(int i=0; i<list.size(); i++) {
						if(Integer.toString(list.get(i).getContentId()).equals(spotContentId)){
							spotDTO = list.get(i);
						}
					}
				}else if(list.size() == 1) {
					// 하나의 캠핑장이 나올 경우 contentId로 한번 더 비교
					if(Integer.toString(list.get(0).getContentId()).equals(spotContentId)){
						spotDTO = list.get(0);
					}
				}
				
				// 캠핑장 데이터 설정
				if(spotDTO == null) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write("<script>alert('페이지 오류');history.back();</script>");
				}else {
					// 캠핑장 시설 정보 설정
					String[] sbrsClList = {"-"};
					if(spotDTO.getSbrsCl() != "" && spotDTO.getSbrsCl() != "-") {
						sbrsClList = spotDTO.getSbrsCl().split(",");
					}
					
					// 후기 정보 설정
					ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
					// 이 캠핑장 contentId를 가지고 있는 리뷰 테이블 로우 검색
					reviewList = service.getSpotReview(spotDTO.getContentId());
					
					request.setAttribute("sbrsClList", sbrsClList);
					request.setAttribute("spotDTO", spotDTO);
					request.setAttribute("reviewlist", reviewList);
					return "spot/spot_detail_view";
				}
				
				
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
	
	// 캠핑장 총 개수 -희원,20210302
	public int getTotal() {
		int count = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
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
				// 페이징 처리 위한 총 개수
				count = json.getJSONObject("response").getJSONObject("body").getInt("totalCount");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}
	
	// 캠핑장 리스트 -희원,20210302
	public ArrayList<SpotDTO> getSpotList(int pageNo) {
		ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("de4n60BId3f9KozHqu47z%2FtxC6YjJEtG0KeMQojtPltNyV702A9d5lltXnQdN7W25Q9R71S0krGaTtdfEIEoQw%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(pageNo), "UTF-8")); /*현재 페이지번호*/
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
					String lctCl = j.has("lctCl") ? j.get("lctCl").toString() : "-";
					String doNm = j.has("doNm") ? j.get("doNm").toString() : "-";
					String addr1 = j.has("addr1") ? j.get("addr1").toString() : "-";
					String addr2 = j.has("addr2") ? j.get("addr2").toString() : "-";
					String tel = j.has("tel") ? j.get("tel").toString() : "-";
					String homepage = j.has("homepage") ? j.get("homepage").toString() : "-";
					String gnrlSiteCo = j.has("gnrlSiteCo") ? j.get("gnrlSiteCo").toString() : "-";
					String autoSiteCo = j.has("autoSiteCo") ? j.get("autoSiteCo").toString() : "-";
					String glampSiteCo = j.has("glampSiteCo") ? j.get("glampSiteCo").toString() : "-";
					String caravSiteCo = j.has("caravSiteCo") ? j.get("caravSiteCo").toString() : "-";
					String indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.get("indvdlCaravSiteCo").toString() : "-";
					String sitedStnc = j.has("sitedStnc") ? j.get("sitedStnc").toString() : "-";
					String siteMg1Width = j.has("siteMg1Width") ? j.get("siteMg1Width").toString() : "-";
					String siteMg1Vrticl = j.has("siteMg1Vrticl") ? j.get("siteMg1Vrticl").toString() : "-";
					String siteMg1Co = j.has("siteMg1Co") ? j.get("siteMg1Co").toString() : "-";
					String siteBottomCl1 = j.has("siteBottomCl1") ? j.get("siteBottomCl1").toString() : "-";
					String siteBottomCl2 = j.has("siteBottomCl2") ? j.get("siteBottomCl2").toString() : "-";
					String siteBottomCl3 = j.has("siteBottomCl3") ? j.get("siteBottomCl3").toString() : "-";
					String siteBottomCl4 = j.has("siteBottomCl4") ? j.get("siteBottomCl4").toString() : "-";
					String siteBottomCl5 = j.has("siteBottomCl5") ? j.get("siteBottomCl5").toString() : "-";
					String operPdCl = j.has("operPdCl") ? j.get("operPdCl").toString() : "-";
					String operDeCl = j.has("operDeCl") ? j.get("operDeCl").toString() : "-";
					String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.get("trlerAcmpnyAt").toString() : "-";
					String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.get("caravAcmpnyAt").toString() : "-";
					String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String themaEnvrnCl = j.has("themaEnvrnCl") ? j.get("themaEnvrnCl").toString() : "-";
					String eqpmnLendCl = j.has("eqpmnLendCl") ? j.get("eqpmnLendCl").toString() : "-";
					String animalCmgCl = j.has("animalCmgCl") ? j.get("animalCmgCl").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					// 별점 평균
					double star = service.getStarAvg(contentId);
					//리뷰수
					int review_count = service.getReviewCount(contentId);
					
					list.add(
							new SpotDTO(contentId, facltNm, lineIntro, intro, bizrno, manageSttus, featureNm, induty, lctCl, doNm, addr1, addr2, tel, homepage, tel, homepage, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, sitedStnc, siteMg1Width, siteMg1Vrticl, siteMg1Co, siteBottomCl1, siteBottomCl2, siteBottomCl3, siteBottomCl4, siteBottomCl5, operPdCl, operDeCl, trlerAcmpnyAt, caravAcmpnyAt, operDeCl, trlerAcmpnyAt, caravAcmpnyAt, sbrsCl, themaEnvrnCl, eqpmnLendCl, animalCmgCl, firstImageUrl, star, review_count)
							);
					
				}
				
			} else {
			}
			
			rd.close();
			conn.disconnect();
			
		}catch(Exception e) {
//				e.printStackTrace();
		}
		return list;
	}
	
	// 캠핑장 키워드 검색 결과 리스트 -희원,20210304
	public ArrayList<SpotDTO> getSpotKeywordList(int pageNo, String search){
		ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(pageNo), "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
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
			if(conn.getResponseCode() == 200) {
				
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
							new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count)
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
									new SpotDTO(contentId, facltNm, lineIntro, manageSttus, addr1, addr2, tel, homepage, sbrsCl, firstImageUrl, star, review_count)
									);
						}
					}catch(Exception e1) {
						// 아무것도 아닐 경우 item : ""
					}
				}
				
			} else {
			}
			
			rd.close();
			conn.disconnect();
			
		}catch(Exception e) {
//				e.printStackTrace();
		}
		return list;
	}
}
