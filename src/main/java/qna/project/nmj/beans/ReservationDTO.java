package qna.project.nmj.beans;

public class ReservationDTO {
	private int reservation_uid;
	private String reservation_start;
	private String reservation_end;
	private int mb_uid;
	private int space_uid;
	private int reservation_check;
	private int reservation_date;
	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationDTO(int reservation_uid, String reservation_start, String reservation_end, int mb_uid,
			int space_uid, int reservation_check, int reservation_date) {
		super();
		this.reservation_uid = reservation_uid;
		this.reservation_start = reservation_start;
		this.reservation_end = reservation_end;
		this.mb_uid = mb_uid;
		this.space_uid = space_uid;
		this.reservation_check = reservation_check;
		this.reservation_date = reservation_date;
	}
	public int getReservation_uid() {
		return reservation_uid;
	}
	public void setReservation_uid(int reservation_uid) {
		this.reservation_uid = reservation_uid;
	}
	public String getReservation_start() {
		return reservation_start;
	}
	public void setReservation_start(String reservation_start) {
		this.reservation_start = reservation_start;
	}
	public String getReservation_end() {
		return reservation_end;
	}
	public void setReservation_end(String reservation_end) {
		this.reservation_end = reservation_end;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public int getSpace_uid() {
		return space_uid;
	}
	public void setSpace_uid(int space_uid) {
		this.space_uid = space_uid;
	}
	public int getReservation_check() {
		return reservation_check;
	}
	public void setReservation_check(int reservation_check) {
		this.reservation_check = reservation_check;
	}
	public int getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(int reservation_date) {
		this.reservation_date = reservation_date;
	}
	
	
}
