package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("book")
public class BookDTO {
	private String bno;
	private String start_date;
	private String end_date;
	private String book_date;
	private int sano;
	private String id;
	private int status;
	private int sno;
	private int price;
	private String sname;
	
	// 예약 목록 확인용
	public BookDTO(String bno, String start_date, String end_date, String book_date, int sano, String id, int status,
			int sno, int price, String sname) {
		super();
		this.bno = bno;
		this.start_date = start_date;
		this.end_date = end_date;
		this.book_date = book_date;
		this.sano = sano;
		this.id = id;
		this.status = status;
		this.sno = sno;
		this.price = price;
		this.sname = sname;
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

	public int getSano() {
		return sano;
	}

	public void setSano(int sano) {
		this.sano = sano;
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

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
}
