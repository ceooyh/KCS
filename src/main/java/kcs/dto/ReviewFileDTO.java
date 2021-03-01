package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("reviewFile")
public class ReviewFileDTO {
	private int rfno;
	private int contentId;
	private String writer;
	private String fileName;
	private String facltNm;
	private int rno;
	
	public ReviewFileDTO(int rfno, int contentId, String writer, String fileName, String facltNm, int rno) {
		super();
		this.rfno = rfno;
		this.contentId = contentId;
		this.writer = writer;
		this.fileName = fileName;
		this.facltNm = facltNm;
		this.rno = rno;
	}

	// 후기 파일 생성용
	public ReviewFileDTO(int contentId, String writer, String fileName, String facltNm, int rno) {
		super();
		this.contentId = contentId;
		this.writer = writer;
		this.fileName = fileName;
		this.facltNm = facltNm;
		this.rno = rno;
	}

	public int getRfno() {
		return rfno;
	}

	public void setRfno(int rfno) {
		this.rfno = rfno;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}
	
	
	
}
