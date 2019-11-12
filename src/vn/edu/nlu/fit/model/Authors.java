package vn.edu.nlu.fit.model;
import java.sql.Date;
public class Authors{
		int id ;
		String name ;
		int active ;
		Date created_at ;
		Date updated_at ;

	public Authors(int id, String name, int active) {
		this.id = id;
		this.name = name;
		this.active = active;
	}

	public Authors(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Authors() {
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

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
}
