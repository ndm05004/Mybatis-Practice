package rrs.vo;

public class TableTypeVO {	// 테이블 타입 (룸,테이블,바)
	private int tt_id;
	private String rst_id;
	private int tt_capacity;
	private String tt_type;

	public int getTt_id() {
		return tt_id;
	}

	public void setTt_id(int tt_id) {
		this.tt_id = tt_id;
	}

	public String getRst_id() {
		return rst_id;
	}

	public void setRst_id(String rst_id) {
		this.rst_id = rst_id;
	}

	public int getTt_capacity() {
		return tt_capacity;
	}

	public void setTt_capacity(int tt_capacity) {
		this.tt_capacity = tt_capacity;
	}

	public String getTt_type() {
		return tt_type;
	}

	public void setTt_type(String tt_type) {
		this.tt_type = tt_type;
	}

	@Override
	public String toString() {
		return "TableTypeVO [tt_id=" + tt_id + ", rst_id=" + rst_id + ", tt_capacity=" + tt_capacity + ", tt_type="
				+ tt_type + "]";
	}

}
