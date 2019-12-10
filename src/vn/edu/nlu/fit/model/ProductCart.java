package vn.edu.nlu.fit.model;

public class ProductCart {
    Books books;
    int quantity=0;
    double total=0;
    int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "ProductCart{" +
                "books=" + books +
                ", quantity=" + quantity +
                ", total=" + total +
                '}';
    }
    public void updateTotal(){
        if(quantity==0) quantity=1;
        double tmp= books.getPrice()*quantity;
        total= (double) Math.round(tmp*100)/100;
    }
    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
        id= books.getId();
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        updateTotal();
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public ProductCart() {
    }

    public ProductCart(Books books, int quantity, double total) {
        this.books = books;
        this.quantity = quantity;
        this.total = total;
    }
}
