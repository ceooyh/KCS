package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class ReviewDTO {
	private int rno;
	private int contentId;
	private String id;
	private double star;
	private String content;
	private String rdate;
	private String facltNm;
	private String bno;
	
	// 조회용
	public ReviewDTO(int rno, int contentId, String id, double star, String content, String rdate, String facltNm, String bno) {
		super();
		this.rno = rno;
		this.contentId = contentId;
		this.id = id;
		this.star = star;
		this.content = content;
		this.rdate = rdate;
		this.facltNm = facltNm;
		this.setBno(bno);
	}

	// 후기 작성용
	public ReviewDTO(int rno, int contentId, String id, double star, String content, String facltNm, String bno) {
		super();
		this.rno = rno;
		this.contentId = contentId;
		this.id = id;
		this.star = star;
		this.content = content;
		this.facltNm = facltNm;
		this.bno = bno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}
	
	
	
}
