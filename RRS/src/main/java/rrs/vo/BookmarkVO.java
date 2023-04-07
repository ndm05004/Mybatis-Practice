package rrs.vo;

public class BookmarkVO {
	private String mem_id;
	private String rst_id;

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getRst_id() {
		return rst_id;
	}

	public void setRst_id(String rst_id) {
		this.rst_id = rst_id;
	}

	
	// 테스트용 나중에 지울거임
	@Override
	public String toString() {
		return "BookmarkVO [mem_id=" + mem_id + ", rst_id=" + rst_id + "]";
	}

}
