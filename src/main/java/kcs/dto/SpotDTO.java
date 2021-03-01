package kcs.dto;

import java.util.Arrays;

public class SpotDTO {

	private int contentId;
	private String facltNm;
	private String lineIntro;
	private String intro;
	private String bizrno;
	private String manageSttus;
	private String featureNm;
	private String induty;
	private String lctCl;
	private String doNm;
	private String addr1;
	private String addr2;
	private String mapX;
	private String mapY;
	private String tel;
	private String homepage;
	private String gnrlSiteCo;
	private String autoSiteCo;
	private String glampSiteCo;
	private String caravSiteCo;
	private String indvdlCaravSiteCo;
	private String sitedStnc;
	private String siteMg1Width;
	private String siteMg1Vrticl;
	private String siteMg1Co;
	private String siteBottomCl1;
	private String siteBottomCl2;
	private String siteBottomCl3;
	private String siteBottomCl4;
	private String siteBottomCl5;
	private String operPdCl;
	private String operDeCl;
	private String trlerAcmpnyAt;
	private String caravAcmpnyAt;
	private String toiletCo;
	private String swrmCo;
	private String wtrplCo;
	private String sbrsCl;
	private String themaEnvrnCl;
	private String eqpmnLendCl;
	private String animalCmgCl;
	private String firstImageUrl;
	
	private double star;
	private int review_count;
	
	
	// 기본 생성자
	public SpotDTO(int contentId, String facltNm, String lineIntro, String intro, String bizrno, String manageSttus,
			String featureNm, String induty, String lctCl, String doNm, String addr1, String addr2, String mapX, String mapY,
			String tel, String homepage, String gnrlSiteCo, String autoSiteCo, String glampSiteCo, String caravSiteCo,
			String indvdlCaravSiteCo, String sitedStnc, String siteMg1Width, String siteMg1Vrticl, String siteMg1Co, String siteBottomCl1,
			String siteBottomCl2, String siteBottomCl3, String siteBottomCl4, String siteBottomCl5, String operPdCl,
			String operDeCl, String trlerAcmpnyAt, String caravAcmpnyAt, String toiletCo, String swrmCo, String wtrplCo,
			String sbrsCl, String themaEnvrnCl, String eqpmnLendCl, String animalCmgCl, String firstImageUrl,
			double star, int review_count) {
		super();
		this.contentId = contentId;
		this.facltNm = facltNm;
		this.lineIntro = lineIntro;
		this.intro = intro;
		this.bizrno = bizrno;
		this.manageSttus = manageSttus;
		this.featureNm = featureNm;
		this.induty = induty;
		this.lctCl = lctCl;
		this.doNm = doNm;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.mapX = mapX;
		this.mapY = mapY;
		this.tel = tel;
		this.homepage = homepage;
		this.gnrlSiteCo = gnrlSiteCo;
		this.autoSiteCo = autoSiteCo;
		this.glampSiteCo = glampSiteCo;
		this.caravSiteCo = caravSiteCo;
		this.indvdlCaravSiteCo = indvdlCaravSiteCo;
		this.sitedStnc = sitedStnc;
		this.siteMg1Width = siteMg1Width;
		this.siteMg1Vrticl = siteMg1Vrticl;
		this.siteMg1Co = siteMg1Co;
		this.siteBottomCl1 = siteBottomCl1;
		this.siteBottomCl2 = siteBottomCl2;
		this.siteBottomCl3 = siteBottomCl3;
		this.siteBottomCl4 = siteBottomCl4;
		this.siteBottomCl5 = siteBottomCl5;
		this.operPdCl = operPdCl;
		this.operDeCl = operDeCl;
		this.trlerAcmpnyAt = trlerAcmpnyAt;
		this.caravAcmpnyAt = caravAcmpnyAt;
		this.toiletCo = toiletCo;
		this.swrmCo = swrmCo;
		this.wtrplCo = wtrplCo;
		this.sbrsCl = sbrsCl;
		this.themaEnvrnCl = themaEnvrnCl;
		this.eqpmnLendCl = eqpmnLendCl;
		this.animalCmgCl = animalCmgCl;
		this.firstImageUrl = firstImageUrl;
		this.star = star;
		this.review_count = review_count;
	}


	
	// 검색 목록 노출용
	public SpotDTO(int contentId, String facltNm, String lineIntro, String manageSttus, String addr1, String addr2, String tel, 
			String homepage, String sbrsCl, String firstImageUrl, double star, int review_count) {
		super();
		this.contentId = contentId;
		this.facltNm = facltNm;
		this.lineIntro = lineIntro;
		this.manageSttus = manageSttus;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.tel = tel;
		this.homepage = homepage;
		this.sbrsCl = sbrsCl;
		this.firstImageUrl = firstImageUrl;
		this.star = star;
		this.review_count = review_count;
	}


	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public String getFacltNm() {
		return facltNm;
	}
	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
	public String getLineIntro() {
		return lineIntro;
	}
	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBizrno() {
		return bizrno;
	}
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	public String getFeatureNm() {
		return featureNm;
	}
	public void setFeatureNm(String featureNm) {
		this.featureNm = featureNm;
	}
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	public String getLctCl() {
		return lctCl;
	}
	public void setLctCl(String lctCl) {
		this.lctCl = lctCl;
	}
	public String getDoNm() {
		return doNm;
	}
	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getMapX() {
		return mapX;
	}
	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	public String getMapY() {
		return mapY;
	}
	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getGnrlSiteCo() {
		return gnrlSiteCo;
	}
	public void setGnrlSiteCo(String gnrlSiteCo) {
		this.gnrlSiteCo = gnrlSiteCo;
	}
	public String getAutoSiteCo() {
		return autoSiteCo;
	}
	public void setAutoSiteCo(String autoSiteCo) {
		this.autoSiteCo = autoSiteCo;
	}
	public String getGlampSiteCo() {
		return glampSiteCo;
	}
	public void setGlampSiteCo(String glampSiteCo) {
		this.glampSiteCo = glampSiteCo;
	}
	public String getCaravSiteCo() {
		return caravSiteCo;
	}
	public void setCaravSiteCo(String caravSiteCo) {
		this.caravSiteCo = caravSiteCo;
	}
	public String getIndvdlCaravSiteCo() {
		return indvdlCaravSiteCo;
	}
	public void setIndvdlCaravSiteCo(String indvdlCaravSiteCo) {
		this.indvdlCaravSiteCo = indvdlCaravSiteCo;
	}
	public String getSiteBottomCl1() {
		return siteBottomCl1;
	}
	public void setSiteBottomCl1(String siteBottomCl1) {
		this.siteBottomCl1 = siteBottomCl1;
	}
	public String getSiteBottomCl2() {
		return siteBottomCl2;
	}
	public void setSiteBottomCl2(String siteBottomCl2) {
		this.siteBottomCl2 = siteBottomCl2;
	}
	public String getSiteBottomCl3() {
		return siteBottomCl3;
	}
	public void setSiteBottomCl3(String siteBottomCl3) {
		this.siteBottomCl3 = siteBottomCl3;
	}
	public String getSiteBottomCl4() {
		return siteBottomCl4;
	}
	public void setSiteBottomCl4(String siteBottomCl4) {
		this.siteBottomCl4 = siteBottomCl4;
	}
	public String getSiteBottomCl5() {
		return siteBottomCl5;
	}
	public void setSiteBottomCl5(String siteBottomCl5) {
		this.siteBottomCl5 = siteBottomCl5;
	}
	public String getOperPdCl() {
		return operPdCl;
	}
	public void setOperPdCl(String operPdCl) {
		this.operPdCl = operPdCl;
	}
	public String getOperDeCl() {
		return operDeCl;
	}
	public void setOperDeCl(String operDeCl) {
		this.operDeCl = operDeCl;
	}
	public String getTrlerAcmpnyAt() {
		return trlerAcmpnyAt;
	}
	public void setTrlerAcmpnyAt(String trlerAcmpnyAt) {
		this.trlerAcmpnyAt = trlerAcmpnyAt;
	}
	public String getCaravAcmpnyAt() {
		return caravAcmpnyAt;
	}
	public void setCaravAcmpnyAt(String caravAcmpnyAt) {
		this.caravAcmpnyAt = caravAcmpnyAt;
	}
	public String getSbrsCl() {
		return sbrsCl;
	}
	public void setSbrsCl(String sbrsCl) {
		this.sbrsCl = sbrsCl;
	}
	public String getThemaEnvrnCl() {
		return themaEnvrnCl;
	}
	public void setThemaEnvrnCl(String themaEnvrnCl) {
		this.themaEnvrnCl = themaEnvrnCl;
	}
	public String getEqpmnLendCl() {
		return eqpmnLendCl;
	}
	public void setEqpmnLendCl(String eqpmnLendCl) {
		this.eqpmnLendCl = eqpmnLendCl;
	}
	public String getAnimalCmgCl() {
		return animalCmgCl;
	}
	public void setAnimalCmgCl(String animalCmgCl) {
		this.animalCmgCl = animalCmgCl;
	}
	public String getFirstImageUrl() {
		return firstImageUrl;
	}
	public void setFirstImageUrl(String firstImageUrl) {
		this.firstImageUrl = firstImageUrl;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public String getManageSttus() {
		return manageSttus;
	}
	public void setManageSttus(String manageSttus) {
		this.manageSttus = manageSttus;
	}
	public String getSitedStnc() {
		return sitedStnc;
	}
	public void setSitedStnc(String sitedStnc) {
		this.sitedStnc = sitedStnc;
	}
	public String getSiteMg1Width() {
		return siteMg1Width;
	}
	public void setSiteMg1Width(String siteMg1Width) {
		this.siteMg1Width = siteMg1Width;
	}
	public String getSiteMg1Vrticl() {
		return siteMg1Vrticl;
	}
	public void setSiteMg1Vrticl(String siteMg1Vrticl) {
		this.siteMg1Vrticl = siteMg1Vrticl;
	}
	public String getSiteMg1Co() {
		return siteMg1Co;
	}
	public void setSiteMg1Co(String siteMg1Co) {
		this.siteMg1Co = siteMg1Co;
	}
	public String getToiletCo() {
		return toiletCo;
	}
	public void setToiletCo(String toiletCo) {
		this.toiletCo = toiletCo;
	}
	public String getSwrmCo() {
		return swrmCo;
	}
	public void setSwrmCo(String swrmCo) {
		this.swrmCo = swrmCo;
	}
	public String getWtrplCo() {
		return wtrplCo;
	}
	public void setWtrplCo(String wtrplCo) {
		this.wtrplCo = wtrplCo;
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (!(obj instanceof SpotDTO))
			return false;
		SpotDTO temp = (SpotDTO) obj;
		// temp == searchDTO
		if(!temp.getDoNm().equals("-")) {
			String[] arr_doNm = temp.getDoNm().split(",");
			String[] this_doNm = doNm.split(",");
			int count = arr_doNm.length;
			for(int i=0; i<this_doNm.length; i++) {
				for(int j=0; j<count; j++) {
					if(this_doNm[i].equals(arr_doNm[j])) count--;
				}
			}
			if(count != 0) return false;
		}
		if(!temp.getGnrlSiteCo().equals("-") && !temp.getGnrlSiteCo().equals(gnrlSiteCo)) return false;
		if(!temp.getAutoSiteCo().equals("-") && !temp.getAutoSiteCo().equals(autoSiteCo)) return false;
		if(!temp.getGlampSiteCo().equals("-") && !temp.getGlampSiteCo().equals(glampSiteCo)) return false;
		if(!temp.getCaravSiteCo().equals("-") && !temp.getCaravSiteCo().equals(caravSiteCo)) return false;
		if(!temp.getIndvdlCaravSiteCo().equals("-") && !temp.getIndvdlCaravSiteCo().equals(indvdlCaravSiteCo)) return false;
		if(!temp.getLctCl().equals("-")) {
			String[] arr_lctCl = temp.getLctCl().split(",");
			String[] this_lctCl = lctCl.split(",");
			int count = arr_lctCl.length;
			for(int i=0; i<this_lctCl.length; i++) {
				for(int j=0; j<arr_lctCl.length; j++) {
					if(this_lctCl[i].equals(arr_lctCl[j])) count--;
				}
			}
			if(count != 0) return false;
		}
		if(!temp.getSiteBottomCl1().equals("-") && !temp.getSiteBottomCl1().equals(siteBottomCl1)) return false;
		if(!temp.getSiteBottomCl2().equals("-") && !temp.getSiteBottomCl2().equals(siteBottomCl2)) return false;
		if(!temp.getSiteBottomCl3().equals("-") && !temp.getSiteBottomCl3().equals(siteBottomCl3)) return false;
		if(!temp.getSiteBottomCl4().equals("-") && !temp.getSiteBottomCl4().equals(siteBottomCl4)) return false;
		if(!temp.getSiteBottomCl5().equals("-") && !temp.getSiteBottomCl5().equals(siteBottomCl5)) return false;
		if(!temp.getSbrsCl().equals("-")) {
			String[] arr_sbrsCl = temp.getSbrsCl().split(",");
			String[] this_sbrsCl = sbrsCl.split(",");
			int count = arr_sbrsCl.length;
			for(int i=0; i<this_sbrsCl.length; i++) {
				for(int j=0; j<arr_sbrsCl.length; j++) {
					if(this_sbrsCl[i].equals(arr_sbrsCl[j])) count--;
				}
			}
			if(count != 0) return false;
		}
		if(!temp.getThemaEnvrnCl().equals("-")) {
			String[] arr_themaEnvrnCl = temp.getThemaEnvrnCl().split(",");
			String[] this_themaEnvrnCl = themaEnvrnCl.split(",");
			int count = arr_themaEnvrnCl.length;
			for(int i=0; i<this_themaEnvrnCl.length; i++) {
				for(int j=0; j<arr_themaEnvrnCl.length; j++) {
					if(this_themaEnvrnCl[i].equals(arr_themaEnvrnCl[j])) count--;
				}
			}
			if(count != 0) return false;
		}
		if(!temp.getAnimalCmgCl().equals("-") && !temp.getAnimalCmgCl().equals(animalCmgCl)) return false;
		if(!temp.getTrlerAcmpnyAt().equals("-") && !temp.getTrlerAcmpnyAt().equals(trlerAcmpnyAt)) return false;
		if(!temp.getCaravAcmpnyAt().equals("-") && !temp.getCaravAcmpnyAt().equals(caravAcmpnyAt)) return false;
		
		return true;
	}
	

	@Override
	public String toString() {
		return "SpotDTO [contentId=" + contentId + ", facltNm=" + facltNm + ", lineIntro=" + lineIntro + ", intro="
				+ intro + ", bizrno=" + bizrno + ", manageSttus=" + manageSttus + ", featureNm=" + featureNm
				+ ", induty=" + induty + ", lctCl=" + lctCl + ", doNm=" + doNm + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", mapX=" + mapX + ", mapY=" + mapY + ", tel=" + tel + ", homepage=" + homepage + ", gnrlSiteCo="
				+ gnrlSiteCo + ", autoSiteCo=" + autoSiteCo + ", glampSiteCo=" + glampSiteCo + ", caravSiteCo="
				+ caravSiteCo + ", indvdlCaravSiteCo=" + indvdlCaravSiteCo + ", sitedStnc=" + sitedStnc
				+ ", siteMg1Width=" + siteMg1Width + ", siteMg1Vrticl=" + siteMg1Vrticl + ", siteMg1Co=" + siteMg1Co
				+ ", siteBottomCl1=" + siteBottomCl1 + ", siteBottomCl2=" + siteBottomCl2 + ", siteBottomCl3="
				+ siteBottomCl3 + ", siteBottomCl4=" + siteBottomCl4 + ", siteBottomCl5=" + siteBottomCl5
				+ ", operPdCl=" + operPdCl + ", operDeCl=" + operDeCl + ", trlerAcmpnyAt=" + trlerAcmpnyAt
				+ ", caravAcmpnyAt=" + caravAcmpnyAt + ", toiletCo=" + toiletCo + ", swrmCo=" + swrmCo + ", wtrplCo="
				+ wtrplCo + ", sbrsCl=" + sbrsCl + ", themaEnvrnCl=" + themaEnvrnCl + ", eqpmnLendCl=" + eqpmnLendCl
				+ ", animalCmgCl=" + animalCmgCl + ", firstImageUrl=" + firstImageUrl + ", star=" + star
				+ ", review_count=" + review_count + "]";
	}



	
	
}
