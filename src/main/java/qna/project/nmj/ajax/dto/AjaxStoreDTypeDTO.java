package qna.project.nmj.ajax.dto;

public class AjaxStoreDTypeDTO {
	int store_dtype;
	String store_dname;
	public AjaxStoreDTypeDTO() {
		// TODO Auto-generated constructor stub
	}
	public AjaxStoreDTypeDTO(int store_dtype, String store_dname) {
		super();
		this.store_dtype = store_dtype;
		this.store_dname = store_dname;
	}
	public int getStore_dtype() {
		return store_dtype;
	}
	public void setStore_dtype(int store_dtype) {
		this.store_dtype = store_dtype;
	}
	public String getStore_dname() {
		return store_dname;
	}
	public void setStore_dname(String store_dname) {
		this.store_dname = store_dname;
	}
	
}
