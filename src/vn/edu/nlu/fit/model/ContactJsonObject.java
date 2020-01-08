package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class ContactJsonObject {
    ArrayList<Contacts> contacts;

    public ContactJsonObject(ArrayList<Contacts> contacts) {
        this.contacts = contacts;
    }

    public ContactJsonObject() {
    }

    public ArrayList<Contacts> getContacts() {
        return contacts;
    }

    public void setContacts(ArrayList<Contacts> contacts) {
        this.contacts = contacts;
    }
}
