package vn.edu.nlu.fit.model;
import java.sql.Date;
public class Booktypes{
		int id ;
		String name ;
		int active ;
		Date updated_at ;
		Date created_at ;

	public Booktypes() {
	}

	public Booktypes(int id, String name, int active) {
		this.id = id;
		this.name = name;
		this.active = active;
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
