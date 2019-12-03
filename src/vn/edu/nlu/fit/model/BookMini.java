package vn.edu.nlu.fit.model;

public class BookMini {
    int id;
    String name;
    String image;
    double price;
    String description;
    String booktype;


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBooktype() {
        return booktype;
    }

    public void setBooktype(String booktype) {
        this.booktype = booktype;
    }

    public BookMini() {
    }

    @Override
    public String toString() {
        return "BookMini{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", booktype='" + booktype + '\'' +
                '}';
    }

    public BookMini(int id, String name, double price, String description, String booktype) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.booktype = booktype;
    }
}
