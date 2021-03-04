package kcs.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcs.dto.FavoriteDTO;
import kcs.dto.SpotDTO;
import kcs.service.MemberService;
import kcs.service.SpotService;

@Controller
public class MainController {
	
	private SpotService spotService;
	private MemberService memberService;

	public MainController(SpotService spotService, MemberService memberService) {
		super();
		this.spotService = spotService;
		this.memberService = memberService;
	}

	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return index(request, response, session);
	}
	
	// 비로그인, (사업자)로그인, (관리자)로그인 : 별점, 리뷰순 추천 / (일반 사용자)로그인 : 별점, 취향순 추천 -희원,20210302
	@RequestMapping("indexView.do")
	public String index(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// 모든 목록을 100개씩 가져오고
		// 총 캠핑장 개수
		int total = getTotal();
		// 100개씩 총 돌아갈 횟수
		int totalPage = total / 100 + 1;
		
		if(session.getAttribute("id") != null && session.getAttribute("user_type") != null && (int)session.getAttribute("user_type") == 1) {
			// (일반 사용자)로그인 : 별점, 취향순 추천
			
			/*S:취향 추천*/
			ArrayList<SpotDTO> favoriteList = new ArrayList<SpotDTO>();
			
			
			// 취향 dto
			String id = (String) session.getAttribute("id");
			FavoriteDTO favoriteDTO = memberService.checkFavorite(id);
			
			// 취향정보를 등록했을 경우만 추천 알고리즘 실행
			if(favoriteDTO != null) {
				// favoriteDTO를 spotDTO로 변환
				SpotDTO favoriteSpotDTO = new SpotDTO(0, "", favoriteDTO.getLctCl(), favoriteDTO.getGnrlSiteCo(), favoriteDTO.getAutoSiteCo(), favoriteDTO.getGlampSiteCo(), favoriteDTO.getCaravSiteCo(), favoriteDTO.getIndvdlCaravSiteCo(), favoriteDTO.getTrlerAcmpnyAt(), favoriteDTO.getCaravAcmpnyAt(), favoriteDTO.getSbrsCl(), favoriteDTO.getThemaEnvrnCl(), favoriteDTO.getAnimalCmgCl(), "");
				
				ArrayList<SpotDTO> originList = new ArrayList<SpotDTO>();
				// 100개의 캠핑장 목록
				for(int i=0; i<totalPage; i++) {
					if(favoriteList.size() > 2) break;
					originList = getSpotList(i);
					// 100개씩 가져와서 내가 설정한 취향 dto와 맞는지 비교
					for(int j=0; j<originList.size(); j++) {
						if(originList.get(j).favoriteEquals(favoriteSpotDTO)) {
							if(favoriteList.size() > 2) break;
							// 일치하면 결과 favoriteList에 추가
							favoriteList.add(originList.get(j));
						}
					}
				}
			}
			// 취향 추천 목록 보내주기
			request.setAttribute("favoritelist", favoriteList);
			/*E:취향 추천*/
			
			/*S:별점 추천*/
			// 별점 추천 목록
			ArrayList<SpotDTO> starList = new ArrayList<SpotDTO>();
			starList = getTop3StarSpotRank(totalPage);
			// 별점 추천 목록 보내주기
			request.setAttribute("starlist", starList);
			/*E:별점 추천*/
			
			
		}else {
			// 비로그인, (사업자)로그인, (관리자)로그인 : 별점, 리뷰순 추천
			
			/*S:별점 추천*/
			// 별점 추천 목록
			ArrayList<SpotDTO> starList = new ArrayList<SpotDTO>();
			starList = getTop3StarSpotRank(totalPage);
			// 별점 추천 목록 보내주기
			request.setAttribute("starlist", starList);
			/*E:별점 추천*/
			
			/*S:찜 많은 순 추천*/
			// 찜 추천 목록
			ArrayList<SpotDTO> keepList = new ArrayList<SpotDTO>();
			keepList = getTop3KeepSpotRank(totalPage);
			// 찜 추천 목록 보내주기
			request.setAttribute("keeplist", keepList);
			/*E:찜 많은 순 추천*/
		}
		return "index";
	}
	


	@RequestMapping("/infoView.do")
	public String info() {
		return "main/info";
	}
	
	// 캠핑장 총 개수 -희원,20210302
	public int getTotal() {
		int count = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
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
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("S2V0C9cclDogOKMDuuZNy2WTNHN4m00csLxViyUB2E5DbGITXMTKsQFUAsY22H5QPqiPGBmTtsgDX4cPUM39zQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
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
					String lctCl = j.has("lctCl") ? j.get("lctCl").toString() : "-";
					String gnrlSiteCo = j.has("gnrlSiteCo") ? j.get("gnrlSiteCo").toString() : "-";
					String autoSiteCo = j.has("autoSiteCo") ? j.get("autoSiteCo").toString() : "-";
					String glampSiteCo = j.has("glampSiteCo") ? j.get("glampSiteCo").toString() : "-";
					String caravSiteCo = j.has("caravSiteCo") ? j.get("caravSiteCo").toString() : "-";
					String indvdlCaravSiteCo = j.has("indvdlCaravSiteCo") ? j.get("indvdlCaravSiteCo").toString() : "-";
					String sbrsCl = j.has("sbrsCl") ? j.get("sbrsCl").toString() : "-";
					String themaEnvrnCl = j.has("themaEnvrnCl") ? j.get("themaEnvrnCl").toString() : "-";
					String animalCmgCl = j.has("animalCmgCl") ? j.get("animalCmgCl").toString() : "-";
					String trlerAcmpnyAt = j.has("trlerAcmpnyAt") ? j.get("trlerAcmpnyAt").toString() : "-";
					String caravAcmpnyAt = j.has("caravAcmpnyAt") ? j.get("caravAcmpnyAt").toString() : "-";
					String firstImageUrl = j.has("firstImageUrl") ? j.get("firstImageUrl").toString() : "-";
					if(firstImageUrl != "-") {
						// 이미지 있을 경우만 리스트에 추가
						list.add(
								new SpotDTO(contentId, facltNm, lctCl, gnrlSiteCo, autoSiteCo, glampSiteCo, caravSiteCo, indvdlCaravSiteCo, trlerAcmpnyAt, caravAcmpnyAt, sbrsCl, themaEnvrnCl, animalCmgCl, firstImageUrl)
								);
					}
					
				}
				
			} else {
			}
			
			rd.close();
			conn.disconnect();
			
		}catch(Exception e) {
//			e.printStackTrace();
		}
		return list;
	}
	
	// 별점 추천 목록을 반환하는 메서드 -희원,20210302
	public ArrayList<SpotDTO> getTop3StarSpotRank(int totalPage){
		
		ArrayList<SpotDTO> starList = new ArrayList<SpotDTO>();
		
		// review 테이블에서 별점 평균이 가장 높은 3개의 캠핑장 번호를 출력
		int[] arr_contentId = spotService.getTopStarRank();
		
		// 캠핑장 검색
		ArrayList<SpotDTO> originList = new ArrayList<SpotDTO>();
		// 100개의 캠핑장 목록을 totalPage만큼 반복
		for(int i=0; i<totalPage; i++) {
			if(starList.size() > 2) break;
			originList = getSpotList(i);
			// 100개씩 가져와서 arr_contentId와 맞는지 비교
			for(int j=0; j<originList.size(); j++) {
				for(int k=0; k<3; k++) {
					if(originList.get(j).getContentId() == (arr_contentId[k])) {
						if(starList.size() > 2) break;
						// 일치하면 결과 starList에 추가
						starList.add(originList.get(j));
					}
				}
			}
		} 
		
		return starList; 
	}
	
	// 찜 많은 순 추천 목록을 반환하는 메서드 -희원,20210302
	private ArrayList<SpotDTO> getTop3KeepSpotRank(int totalPage) {

		ArrayList<SpotDTO> reviewList = new ArrayList<SpotDTO>();
		
		// keep 테이블에서 찜개수가 가장 높은 3개의 캠핑장 번호를 출력
		int[] arr_contentId = spotService.getTopKeepRank();
		
		// 캠핑장 검색
		ArrayList<SpotDTO> originList = new ArrayList<SpotDTO>();
		// 100개의 캠핑장 목록을 totalPage만큼 반복
		for(int i=0; i<totalPage; i++) {
			if(reviewList.size() > 2) break;
			originList = getSpotList(i);
			// 100개씩 가져와서 arr_contentId와 맞는지 비교
			for(int j=0; j<originList.size(); j++) {
				for(int k=0; k<3; k++) {
					if(originList.get(j).getContentId() == (arr_contentId[k])) {
						if(reviewList.size() > 2) break;
						// 일치하면 결과 starList에 추가
						reviewList.add(originList.get(j));
					}
				}
			}
		} 
		
		return reviewList; 
	}
}
