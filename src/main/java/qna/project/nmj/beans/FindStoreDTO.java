package qna.project.nmj.beans;

public class FindStoreDTO {
	private int store_uid;
	private String store_img_sav;
	private String store_name;
	private String store_dname;
	private int store_type;
	
	
	
	public FindStoreDTO() {
		super();
	}


	public FindStoreDTO(int store_uid, String store_img_sav, String store_name, String store_dname, int store_type) {
		super();
		this.store_uid = store_uid;
		this.store_img_sav = store_img_sav;
		this.store_name = store_name;
		this.store_dname = store_dname;
		this.store_type = store_type;
	}


	public int getStore_uid() {
		return store_uid;
	}


	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}


	public String getStore_img_sav() {
		return store_img_sav;
	}


	public void setStore_img_sav(String store_img_sav) {
		this.store_img_sav = store_img_sav;
	}


	public String getStore_name() {
		return store_name;
	}


	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}


	public String getStore_dname() {
		return store_dname;
	}


	public void setStore_dname(String store_dname) {
		this.store_dname = store_dname;
	}


	public int getStore_type() {
		return store_type;
	}


	public void setStore_type(int store_type) {
		this.store_type = store_type;
	}
	
	
	
	
	
	
}
