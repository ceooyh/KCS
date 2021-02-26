package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("reviewFile")
public class ReviewFileDTO {
	private int rfno;
	private int sno;
	private String writer;
	private String fileName;
	
	// 후기 파일 등록용
	public ReviewFileDTO(int sno, String writer, String fileName) {
		super();
		this.sno = sno;
		this.writer = writer;
		this.fileName = fileName;
	}

	public int getRfno() {
		return rfno;
	}

	public void setRfno(int rfno) {
		this.rfno = rfno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
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
	
	
}
