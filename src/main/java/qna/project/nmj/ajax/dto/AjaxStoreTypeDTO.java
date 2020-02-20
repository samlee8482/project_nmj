package qna.project.nmj.ajax.dto;

import java.util.ArrayList;

import qna.project.nmj.beans.StoreTypeDTO;

public class AjaxStoreTypeDTO {
	ArrayList<StoreTypeDTO> storeDTO;
	int count;
	String status;
	
	public AjaxStoreTypeDTO() {
	}

	public AjaxStoreTypeDTO(ArrayList<StoreTypeDTO> storeDTO, int count, String status) {
		super();
		this.storeDTO = storeDTO;
		this.count = count;
		this.status = status;
	}

	public ArrayList<StoreTypeDTO> getStoreDTO() {
		return storeDTO;
	}

	public int getCount() {
		return count;
	}

	public String getStatus() {
		return status;
	}

	public void setStoreDTO(ArrayList<StoreTypeDTO> storeDTO) {
		this.storeDTO = storeDTO;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
