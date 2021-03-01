package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("favorite")
public class FavoriteDTO {
	private String id;
	private String gnrlSiteCo;
	private String autoSiteCo;
	private String glampSiteCo;
	private String caravSiteCo;
	private String indvdlCaravSiteCo;
	private String themaEnvrnCl;
	private String animalCmgCl;
	private String trlerAcmpnyAt;
	private String caravAcmpnyAt;
	private String lctCl;
	private String sbrsCl;
	public FavoriteDTO(String id, String gnrlSiteCo, String autoSiteCo, String glampSiteCo, String caravSiteCo,
			String indvdlCaravSiteCo, String themaEnvrnCl, String animalCmgCl, String trlerAcmpnyAt,
			String caravAcmpnyAt, String lctCl, String sbrsCl) {
		super();
		this.id = id;
		this.gnrlSiteCo = gnrlSiteCo;
		this.autoSiteCo = autoSiteCo;
		this.glampSiteCo = glampSiteCo;
		this.caravSiteCo = caravSiteCo;
		this.indvdlCaravSiteCo = indvdlCaravSiteCo;
		this.themaEnvrnCl = themaEnvrnCl;
		this.animalCmgCl = animalCmgCl;
		this.trlerAcmpnyAt = trlerAcmpnyAt;
		this.caravAcmpnyAt = caravAcmpnyAt;
		this.lctCl = lctCl;
		this.sbrsCl = sbrsCl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGnrlSiteCo() {
		return gnrlSiteCo;
	}
	public void setGnrlSiteCo(String gnrlSiteCo) {
		this.gnrlSiteCo = gnrlSiteCo;
	}
	public String getAutoSiteCo() {
		return autoSiteCo;
	}
	public void setAutoSiteCo(String autoSiteCo) {
		this.autoSiteCo = autoSiteCo;
	}
	public String getGlampSiteCo() {
		return glampSiteCo;
	}
	public void setGlampSiteCo(String glampSiteCo) {
		this.glampSiteCo = glampSiteCo;
	}
	public String getCaravSiteCo() {
		return caravSiteCo;
	}
	public void setCaravSiteCo(String caravSiteCo) {
		this.caravSiteCo = caravSiteCo;
	}
	public String getIndvdlCaravSiteCo() {
		return indvdlCaravSiteCo;
	}
	public void setIndvdlCaravSiteCo(String indvdlCaravSiteCo) {
		this.indvdlCaravSiteCo = indvdlCaravSiteCo;
	}
	public String getThemaEnvrnCl() {
		return themaEnvrnCl;
	}
	public void setThemaEnvrnCl(String themaEnvrnCl) {
		this.themaEnvrnCl = themaEnvrnCl;
	}
	public String getAnimalCmgCl() {
		return animalCmgCl;
	}
	public void setAnimalCmgCl(String animalCmgCl) {
		this.animalCmgCl = animalCmgCl;
	}
	public String getTrlerAcmpnyAt() {
		return trlerAcmpnyAt;
	}
	public void setTrlerAcmpnyAt(String trlerAcmpnyAt) {
		this.trlerAcmpnyAt = trlerAcmpnyAt;
	}
	public String getCaravAcmpnyAt() {
		return caravAcmpnyAt;
	}
	public void setCaravAcmpnyAt(String caravAcmpnyAt) {
		this.caravAcmpnyAt = caravAcmpnyAt;
	}
	public String getLctCl() {
		return lctCl;
	}
	public void setLctCl(String lctCl) {
		this.lctCl = lctCl;
	}
	public String getSbrsCl() {
		return sbrsCl;
	}
	public void setSbrsCl(String sbrsCl) {
		this.sbrsCl = sbrsCl;
	}
	
	
}
