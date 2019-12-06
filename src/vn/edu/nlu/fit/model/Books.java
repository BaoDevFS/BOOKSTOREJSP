package vn.edu.nlu.fit.model;
import java.sql.Date;
public class Books{
		int id ;
		String name ;
		String image ;
		String image_hover ;
		String description ;
		double price_old ;
		double price ;
		String note ;
		int quantum ;
		int year ;
		int active ;
		int rate ;
		Date created_at ;
		Date updated_at ;
		int id_type ;
		String author ;

	public Books() {
	}

	public Books(int id,String name, String image, double price, String author) {
		this.id= id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.author = author;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage_hover() {
		return image_hover;
	}

	public void setImage_hover(String image_hover) {
		this.image_hover = image_hover;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice_old() {
		return price_old;
	}

	public void setPrice_old(Double price_old) {
		this.price_old = price_old;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getQuantum() {
		return quantum;
	}

	public void setQuantum(int quantum) {
		this.quantum = quantum;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public int getId_type() {
		return id_type;
	}

	public void setId_type(int id_type) {
		this.id_type = id_type;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Books(int id, String name, String image, String image_hover, String description, Double price_old, Double price, String note, int quantum, int year, int active, int rate, Date created_at, Date updated_at, int id_type, String author) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.image_hover = image_hover;
		this.description = description;
		this.price_old = price_old;
		this.price = price;
		this.note = note;
		this.quantum = quantum;
		this.year = year;
		this.active = active;
		this.rate = rate;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.id_type = id_type;
		this.author = author;
	}
}
