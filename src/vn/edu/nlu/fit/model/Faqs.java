package vn.edu.nlu.fit.model;

import java.sql.Date;

public class Faqs {
    int id;
    String question;
    String answer;
    int active;
    Date created_at;
    Date updated_at;

    public Faqs(int id, String question, String answer, int active, Date created_at, Date updated_at) {
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.active = active;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

}
