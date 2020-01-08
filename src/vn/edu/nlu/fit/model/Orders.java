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
    String note;
    int acitve;
	ArrayList<ProductCart> listBook;

	public ArrayList<ProductCart> getListBook() {
		return listBook;
	}

	public void setListBook(ArrayList<ProductCart> listBook) {
		this.listBook = listBook;
	}

	public Orders() {
	}

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
				", id_user=" + id_user +
				'}';
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
