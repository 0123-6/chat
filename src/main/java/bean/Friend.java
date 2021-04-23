package bean;

import org.apache.ibatis.type.Alias;

import java.util.Objects;

@Alias("friend")
public class Friend {
    private String user_1;
    private String user_2;
    private String note;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Friend friend = (Friend) o;
        return Objects.equals(user_1, friend.user_1) && Objects.equals(user_2, friend.user_2);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_1, user_2);
    }

    public String getUser_1() {
        return user_1;
    }

    public void setUser_1(String user_1) {
        this.user_1 = user_1;
    }

    public String getUser_2() {
        return user_2;
    }

    public void setUser_2(String user_2) {
        this.user_2 = user_2;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
