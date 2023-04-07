package rrs.vo;

public class RsttagVO {	// 식당 태그 모음 테이블
	private String tag_id;
	private String rst_id;

	public String getTag_id() {
		return tag_id;
	}

	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}

	public String getRst_id() {
		return rst_id;
	}

	public void setRst_id(String rst_id) {
		this.rst_id = rst_id;
	}

	@Override
	public String toString() {
		return "RsttagVO [tag_id=" + tag_id + ", rst_id=" + rst_id + "]";
	}

}
