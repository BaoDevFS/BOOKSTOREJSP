package vn.edu.nlu.fit.model;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Feedbacks {
    int id;
    String content;
    String nickname;
    String date;
    int rate;
    int id_book;

    int active;

    public Feedbacks() {

    }

    public Feedbacks(int id, String content, String nickname, String date, int id_book, int active, int rate) {
        this.id = id;
        this.content = content;
        this.nickname = nickname;
        this.date = date;
        this.id_book = id_book;
        this.active = active;
        this.rate = rate;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_book() {
        return id_book;
    }

    public void setId_book(int id_book) {
        this.id_book = id_book;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public static List<Feedbacks> getListFeedbackByIDProduct(int id_book) {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "SELECT * FROM feedbacks WHERE id_book=?;";
        try {
            PreparedStatement pre = new GetConnectDatabase().getConnectionSql().prepareStatement(sql);
            pre.setInt(1, id_book);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Feedbacks feedback = new Feedbacks();
                feedback.setId(rs.getInt(1));
                feedback.setContent(rs.getString(2));
                feedback.setNickname(rs.getString(3));
                feedback.setDate(rs.getString(4));
                feedback.setRate(rs.getInt(5));
                feedback.setId_book(rs.getInt(6));
                list.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
