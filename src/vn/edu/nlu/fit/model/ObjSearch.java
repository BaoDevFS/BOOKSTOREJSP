package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class ObjSearch {
    ArrayList<Books> listBook;

    public ArrayList<Books> getListBook() {
        return listBook;
    }

    public void setListBook(ArrayList<Books> listBook) {
        this.listBook = listBook;
    }

    public ObjSearch() {
    }

    public ObjSearch(ArrayList<Books> listBook) {
        this.listBook = listBook;
    }
}
