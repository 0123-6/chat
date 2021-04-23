package bean;

import java.util.Objects;

public class User {
    private String userName;
    private String password;
    private String nickName;
    private String sex;
    private String personal_signature;
    private String email;

    public User(String userName, String nickName, String sex, String personal_signature) {
        this.userName = userName;
        this.nickName = nickName;
        this.sex = sex;
        this.personal_signature = personal_signature;
    }

    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", sex='" + sex + '\'' +
                ", personal_signature='" + personal_signature + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public User(String userName, String password, String nickName, String sex, String personal_signature, String email) {
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
        this.sex = sex;
        this.personal_signature = personal_signature;
        this.email = email;
    }

    public User() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(userName, user.userName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userName);
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPersonal_signature() {
        return personal_signature;
    }

    public void setPersonal_signature(String personal_signature) {
        this.personal_signature = personal_signature;
    }
}
