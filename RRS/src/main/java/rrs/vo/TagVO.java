package rrs.vo;

public class TagVO {
	private String tag_id;
	private String tag_name;

	public String getTag_id() {
		return tag_id;
	}

	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	@Override
	public String toString() {
		return "TagVO [tag_id=" + tag_id + ", tag_name=" + tag_name + "]";
	}

}
