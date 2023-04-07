package rrs.vo;

public class MenuVO {
	private int menu_id;
	private String rst_id;
	private String menu_name;
	private int menu_price;
	private String menu_ds;
	private String menu_photo;

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getRst_id() {
		return rst_id;
	}

	public void setRst_id(String rst_id) {
		this.rst_id = rst_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_ds() {
		return menu_ds;
	}

	public void setMenu_ds(String menu_ds) {
		this.menu_ds = menu_ds;
	}

	public String getMenu_photo() {
		return menu_photo;
	}

	public void setMenu_photo(String menu_photo) {
		this.menu_photo = menu_photo;
	}

	@Override
	public String toString() {
		return "MenuVO [menu_id=" + menu_id + ", rst_id=" + rst_id + ", menu_name=" + menu_name + ", menu_price="
				+ menu_price + ", menu_ds=" + menu_ds + ", menu_photo=" + menu_photo + "]";
	}

}
