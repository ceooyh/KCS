package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("business")
public class BusinessDTO {
	private int bno;
	private String id;
	private String business_no;
	public BusinessDTO(int bno, String id, String business_no) {
		super();
		this.bno = bno;
		this.id = id;
		this.business_no = business_no;
	}
	public BusinessDTO(String id, String business_no) {
		super();
		this.id = id;
		this.business_no = business_no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	
	
}
