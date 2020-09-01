package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class BookingJsonObject {
    ArrayList<Orders> list;

    public BookingJsonObject() {
    }

    public ArrayList<Orders> getList() {
        return list;
    }

    public void setList(ArrayList<Orders> list) {
        this.list = list;
    }

    public BookingJsonObject(ArrayList<Orders> list) {
        this.list = list;
    }
}
