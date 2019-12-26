package vn.edu.nlu.fit.model;

public class Contacts {
    int id;
    String firstname;
    String lastName;
    String email;
    String message;
    String subject;
    String website;
    int active;

	@Override
	public String toString() {
		return "Contacts{" +
				"id=" + id +
				", firstname='" + firstname + '\'' +
				", lastName='" + lastName + '\'' +
				", email='" + email + '\'' +
				", message='" + message + '\'' +
				", subject='" + subject + '\'' +
				", website='" + website + '\'' +
				", active=" + active +
				'}';
	}

	public Contacts(int id, String firstname, String lastName, String email, String message, String subject, String website, int active) {
		this.id = id;
		this.firstname = firstname;
		this.lastName = lastName;
		this.email = email;
		this.message = message;
		this.subject = subject;
		this.website = website;
		this.active = active;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Contacts() {
	}
}
