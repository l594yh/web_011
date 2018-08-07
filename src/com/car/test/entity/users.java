package com.car.test.entity;

import java.util.Date;

public class users {

    private int uid;
    private String username;
    private String password;
    private String email;
    private Date birthday;
    private Date regdate;

    public users() {
    }

    public users(int uid, String username, String password, String email, Date birthday, Date regdate) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.email = email;
        this.birthday = birthday;
        this.regdate = regdate;
    }

    public int getUid() {
        return uid;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "users{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", birthday=" + birthday +
                ", regdate=" + regdate +
                '}';
    }
}
