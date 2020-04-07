package com.ithuangyonghua.entity;

/**
 * 内容实体类
 * 
 * @author Hyh
 *
 */
public class ContentEntity {
	private Integer id;
	private String name;
	private String keyword;
	private String titlename;
	private String creator;
	private String writeDate;
	private String jianjie;
	private String content;

	public ContentEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContentEntity(Integer id, String name, String keyword, String titlename, String creator, String writeDate,
			String jianjie, String content) {
		super();
		this.id = id;
		this.name = name;
		this.keyword = keyword;
		this.titlename = titlename;
		this.creator = creator;
		this.writeDate = writeDate;
		this.jianjie = jianjie;
		this.content = content;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTitlename() {
		return titlename;
	}

	public void setTitlename(String titlename) {
		this.titlename = titlename;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getJianjie() {
		return jianjie;
	}

	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ContentEntity [id=" + id + ", name=" + name + ", keyword=" + keyword + ", titlename=" + titlename
				+ ", creator=" + creator + ", writeDate=" + writeDate + ", jianjie=" + jianjie + ", content=" + content
				+ "]";
	}

}
