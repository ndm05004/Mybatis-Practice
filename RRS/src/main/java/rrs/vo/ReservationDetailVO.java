package rrs.vo;

public class ReservationDetailVO {
	public String rs_id;
	public String mem_name;
	public String rs_datetime;
	public int rs_people;
	public String mem_tel;
	public String menu_name;
	public int rm_qty;

	public String getRs_id() {
		return rs_id;
	}

	public void setRs_id(String rs_id) {
		this.rs_id = rs_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getRs_datetime() {
		return rs_datetime;
	}

	public void setRs_datetime(String rs_datetime) {
		this.rs_datetime = rs_datetime;
	}

	public int getRs_people() {
		return rs_people;
	}

	public void setRs_people(int rs_people) {
		this.rs_people = rs_people;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getRm_qty() {
		return rm_qty;
	}

	public void setRm_qty(int rm_qty) {
		this.rm_qty = rm_qty;
	}
}
