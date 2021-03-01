package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("keep")
public class KeepDTO {
	private int kno;
	private int contentId;
	private String id;
	private String kdate;
	private String facltNm;
	
	// 찜 추가용
	public KeepDTO(int contentId, String id, String facltNm) {
		super();
		this.contentId = contentId;
		this.id = id;
		this.facltNm = facltNm;
	}

	// 조회용
	public KeepDTO(int kno, int contentId, String id, String kdate, String facltNm) {
		super();
		this.kno = kno;
		this.contentId = contentId;
		this.id = id;
		this.kdate = kdate;
		this.facltNm = facltNm;
	}

	public int getKno() {
		return kno;
	}

	public void setKno(int kno) {
		this.kno = kno;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKdate() {
		return kdate;
	}

	public void setKdate(String kdate) {
		this.kdate = kdate;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
	
	
}
