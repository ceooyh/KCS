package kcs.dto;

// 게시판 첨부파일 DTO - 성진


import org.apache.ibatis.type.Alias;


@Alias("boardFile")
public class BoardFileDTO {
	private int fbno;
	private int bno;
	private String fileName;
	private String writer;
	
	
	
	public BoardFileDTO() {
		super();
	
	}



	public BoardFileDTO(int fbno, int bno, String fileName, String writer) {
		super();
		this.fbno = fbno;
		this.bno = bno;
		this.fileName = fileName;
		this.writer = writer;
	}




	public int getFbno() {
		return fbno;
	}



	public void setFbno(int fbno) {
		this.fbno = fbno;
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	@Override
	public String toString() {
		return "BoardFileDTO [fbno=" + fbno + ", bno=" + bno + ", fileName=" + fileName + ", writer=" + writer + "]";
	}



	
	
	
}
