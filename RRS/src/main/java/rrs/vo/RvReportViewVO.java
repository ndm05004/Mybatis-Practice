package rrs.vo;

public class RvReportViewVO {
	
	private int rvr_id;
	private String rvr_reason;
	private String rvr_date;
	private String reporter;
	private String rv_title;
	private String defendant;
	private String rv_content;
	  
	public int getRvr_id() {
		return rvr_id;
	}
	public void setRvr_id(int rvr_id) {
		this.rvr_id = rvr_id;
	}
	public String getRvr_reason() {
		return rvr_reason;
	}
	public void setRvr_reason(String rvr_reason) {
		this.rvr_reason = rvr_reason;
	}
	public String getRvr_date() {
		return rvr_date;
	}
	public void setRvr_date(String rvr_date) {
		this.rvr_date = rvr_date;
	}

	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getDefendant() {
		return defendant;
	}
	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	
	
	

}
