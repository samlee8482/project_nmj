package qna.project.nmj.beans;

public class FoodDTO {
	private int food_uid;
	private int store_uid;
	private String food_img_org;
	private String food_img_sav;
	private int food_price;
	private int food_name;
	public FoodDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodDTO(int food_uid, int store_uid, String food_img_org, String food_img_sav, int food_price,
			int food_name) {
		super();
		this.food_uid = food_uid;
		this.store_uid = store_uid;
		this.food_img_org = food_img_org;
		this.food_img_sav = food_img_sav;
		this.food_price = food_price;
		this.food_name = food_name;
	}
	public int getFood_uid() {
		return food_uid;
	}
	public void setFood_uid(int food_uid) {
		this.food_uid = food_uid;
	}
	public int getStore_uid() {
		return store_uid;
	}
	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}
	public String getFood_img_org() {
		return food_img_org;
	}
	public void setFood_img_org(String food_img_org) {
		this.food_img_org = food_img_org;
	}
	public String getFood_img_sav() {
		return food_img_sav;
	}
	public void setFood_img_sav(String food_img_sav) {
		this.food_img_sav = food_img_sav;
	}
	public int getFood_price() {
		return food_price;
	}
	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}
	public int getFood_name() {
		return food_name;
	}
	public void setFood_name(int food_name) {
		this.food_name = food_name;
	}
	
	
}
