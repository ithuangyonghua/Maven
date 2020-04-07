package com.ithuangyonghua.entity;
/**
 * 栏目实体类
 * @author Hyh
 *
 */
public class LanMuEntity {
	private Integer id;
	private String name;
	private String creator;
	private String creatorDate;

	public LanMuEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LanMuEntity(Integer id, String name, String creator, String creatorDate) {
		super();
		this.id = id;
		this.name = name;
		this.creator = creator;
		this.creatorDate = creatorDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreatorDate() {
		return creatorDate;
	}

	public void setCreatorDate(String creatorDate) {
		this.creatorDate = creatorDate;
	}

	@Override
	public String toString() {
		return "LanMuEntity [id=" + id + ", name=" + name + ", creator=" + creator + ", creatorDate=" + creatorDate
				+ "]";
	}

}
