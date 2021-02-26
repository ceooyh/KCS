package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("board")
public class BoardDTO {
	// 성진님 여기 완성해주시면 됩니다 조회용이랑 글쓰기용 생성자 따로 만들어주시구요~~
	private int bno;
	private String writer;
	private String title;
	private String content;
	private String bdate;
	private int blike;
	private int bhate;
	private int views;
	private int comment_count;
	
	//
	public BoardDTO(int bno, String writer, String title, String content) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	//게시판 글쓰기 등록용 생성자
	public BoardDTO(String writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	//게시판 읽어오기용 생성자
	public BoardDTO(int bno, String writer, String title, String content, String bdate, int blike, int bhate,
			int views) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.bdate = bdate;
		this.blike = blike;
		this.bhate = bhate;
		this.views = views;
	}

	// 게시판 목록 읽어오기용 생성자
	public BoardDTO(int bno, String writer, String title, String content, String bdate, int blike, int bhate, int views,
			int comment_count) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.bdate = bdate;
		this.blike = blike;
		this.bhate = bhate;
		this.views = views;
		this.comment_count = comment_count;
	}
	
	
	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getBdate() {
		return bdate;
	}


	public void setBdate(String bdate) {
		this.bdate = bdate;
	}


	public int getBlike() {
		return blike;
	}


	public void setBlike(int blike) {
		this.blike = blike;
	}


	public int getBhate() {
		return bhate;
	}


	public void setBhate(int bhate) {
		this.bhate = bhate;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", writer=" + writer + ", title=" + title + ", content=" + content + ", bdate="
				+ bdate + ", blike=" + blike + ", bhate=" + bhate + ", views=" + views + "]";
	}
	
	
	
}
