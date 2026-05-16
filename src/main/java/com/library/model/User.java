package com.library.model;

public class User {
    private String userId;
    private String fullName;
    private String email;
    private String phone;
    private String password;
    private String membershipType;
    private String role;
    private String status;

    public User() {
    }

    public User(String userId, String fullName, String email, String phone,
                String password, String membershipType, String role, String status) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.membershipType = membershipType;
        this.role = role;
        this.status = status;
    }

    public String getUserId() {
        return userId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getPassword() {
        return password;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public String getRole() {
        return role;
    }

    public String getStatus() {
        return status;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String toFileString() {
        return userId + "," + fullName + "," + email + "," + phone + "," +
                password + "," + membershipType + "," + role + "," + status;
    }

    public static User fromFileString(String line) {
        String[] data = line.split(",", -1);

        if (data.length < 8) {
            return null;
        }

        return new User(
                data[0],
                data[1],
                data[2],
                data[3],
                data[4],
                data[5],
                data[6],
                data[7]
        );
    }
}