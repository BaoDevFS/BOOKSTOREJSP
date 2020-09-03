package vn.edu.nlu.fit.model;

import java.sql.Date;
import java.util.ArrayList;

public class Orders {
    int id;
    Double total;
    String name;
    String phone;
    String email;
    String status;
    String address;
    String note="";
    int acitve;
    Date date;

	@Override
	public String toString() {
		return "Orders{" +
				"id=" + id +
				", total=" + total +
				", name='" + name + '\'' +
				", phone='" + phone + '\'' +
				", email='" + email + '\'' +
				", status='" + status + '\'' +
				", address='" + address + '\'' +
				", note='" + note + '\'' +
				", acitve=" + acitve +
				", date=" + date +
				", listBook=" + listBook +
				", id_user=" + id_user +
				'}';
	}

	public Orders(int id, Double total, String name, String phone, String email, String status, String address, String note, int acitve, Date date, ArrayList<ProductCart> listBook, int id_user) {
		this.id = id;
		this.total = total;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.address = address;
		this.note = note;
		this.acitve = acitve;
		this.date = date;
		this.listBook = listBook;
		this.id_user = id_user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	ArrayList<ProductCart> listBook;

	public ArrayList<ProductCart> getListBook() {
		return listBook;
	}

	public void setListBook(ArrayList<ProductCart> listBook) {
		this.listBook = listBook;
	}

	public Orders() {
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getAcitve() {
		return acitve;
	}

	public void setAcitve(int acitve) {
		this.acitve = acitve;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	int id_user;

}
