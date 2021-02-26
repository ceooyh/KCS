package kcs.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String tel1;
	private String tel2;
	private String tel3;
	private String birth;
	private String email1;
	private String email2;
	private int gender;
	private int user_type;
	
	public MemberDTO(String id, String pass, String name, String tel1, String tel2, String tel3, String birth,
			String email1, String email2, int gender, int user_type) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.birth = birth;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
		this.user_type = user_type;
	}

	
	// 회원정보 수정용
	public MemberDTO(String id, String pass, String name, String tel1, String tel2, String tel3, String birth,
			String email1, String email2, int gender) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.birth = birth;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((email1 == null) ? 0 : email1.hashCode());
		result = prime * result + ((email2 == null) ? 0 : email2.hashCode());
		result = prime * result + gender;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pass == null) ? 0 : pass.hashCode());
		result = prime * result + ((tel1 == null) ? 0 : tel1.hashCode());
		result = prime * result + ((tel2 == null) ? 0 : tel2.hashCode());
		result = prime * result + ((tel3 == null) ? 0 : tel3.hashCode());
		result = prime * result + user_type;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (email1 == null) {
			if (other.email1 != null)
				return false;
		} else if (!email1.equals(other.email1))
			return false;
		if (email2 == null) {
			if (other.email2 != null)
				return false;
		} else if (!email2.equals(other.email2))
			return false;
		if (gender != other.gender)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pass == null) {
			if (other.pass != null)
				return false;
		} else if (!pass.equals(other.pass))
			return false;
		if (tel1 == null) {
			if (other.tel1 != null)
				return false;
		} else if (!tel1.equals(other.tel1))
			return false;
		if (tel2 == null) {
			if (other.tel2 != null)
				return false;
		} else if (!tel2.equals(other.tel2))
			return false;
		if (tel3 == null) {
			if (other.tel3 != null)
				return false;
		} else if (!tel3.equals(other.tel3))
			return false;
		if (user_type != other.user_type)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", tel1=" + tel1 + ", tel2=" + tel2
				+ ", tel3=" + tel3 + ", birth=" + birth + ", email1=" + email1 + ", email2=" + email2 + ", gender="
				+ gender + ", user_type=" + user_type + "]";
	}
	
	
	
	
}
