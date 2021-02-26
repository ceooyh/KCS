package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("favorite")
public class FavoriteDTO {
	private String id;
	private String stag;
	public FavoriteDTO(String id, String stag) {
		super();
		this.id = id;
		this.stag = stag;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStag() {
		return stag;
	}
	public void setStag(String stag) {
		this.stag = stag;
	}
}
