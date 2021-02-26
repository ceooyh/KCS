package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("businessFile")
public class BusinessFileDTO {
	private int bno;
	private String id;
	private String fileName;
	public BusinessFileDTO(int bno, String id, String fileName) {
		super();
		this.bno = bno;
		this.id = id;
		this.fileName = fileName;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
