package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class ProductJsonObject {
    private ArrayList<Books> products;

    public ProductJsonObject() {
    }

    public ArrayList<Books> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Books> products) {
        this.products = products;
    }

    public ProductJsonObject(ArrayList<Books> products) {
        this.products = products;
    }
}
