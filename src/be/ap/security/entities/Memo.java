package be.ap.security.entities;

import java.time.OffsetDateTime;
import java.util.Objects;

public class Memo {
    private long id;
    private String author;
    private String text;
    private OffsetDateTime creationDate;

    public Memo(long id, String author, String text, OffsetDateTime creationDate) {
        this.id = id;
        this.author = author;
        this.text = text;
        this.creationDate = creationDate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public OffsetDateTime getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(OffsetDateTime creationDate) {
        this.creationDate = creationDate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Memo memo = (Memo) o;
        return id == memo.id;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id);
    }
}
