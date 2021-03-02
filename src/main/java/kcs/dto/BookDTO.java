package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("book")
public class BookDTO {
	private String bno;
	private String start_date;
	private String end_date;
	private String book_date;
	private int contentId;
	private String id;
	private int status;
	private String facltNm;
	private String bizrno;
	
	public BookDTO(String bno, String start_date, String end_date, String book_date, int contentId, String id,
			int status, String facltNm, String bizrno) {
		super();
		this.bno = bno;
		this.start_date = start_date;
		this.end_date = end_date;
		this.book_date = book_date;
		this.contentId = contentId;
		this.id = id;
		this.status = status;
		this.facltNm = facltNm;
		this.setBizrno(bizrno);
	}

	// 예약 생성용
	public BookDTO(String bno, String start_date, String end_date, int contentId, String id, String facltNm, String bizrno) {
		super();
		this.bno = bno;
		this.start_date = start_date;
		this.end_date = end_date;
		this.contentId = contentId;
		this.id = id;
		this.facltNm = facltNm;
		this.setBizrno(bizrno);
	}
	
	
	public String getBno() {
		return bno;
	}


	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public String getBizrno() {
		return bizrno;
	}

	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	
	
}
