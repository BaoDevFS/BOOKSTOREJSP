package vn.edu.nlu.fit.model;

public class ProductWishlist {
    Books books;
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
                '}';
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
        id = books.getId();
    }

    public ProductWishlist() {
    }

    public ProductWishlist(Books books) {
        this.books = books;
    }
}
