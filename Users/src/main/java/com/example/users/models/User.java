package com.example.users.models;

import jakarta.validation.constraints.*;

public class User {
    private int id;

    @NotEmpty(message = "Фамилия не может быть пустой")
    @Size(min = 2, max = 30, message = "Фамилия должна быть в диапазоне от 2 до 30 символов")
    private String lastName;

    @NotEmpty(message = "Имя не может быть пустой")
    @Size(min = 2, max = 30, message = "Имя должна быть в диапазоне от 2 до 30 символов")
    private String firstName;
    private String patronymic;

    @Min(value = 18, message = "Возраст не может быть меньше 18")
    private int age;

    @NotEmpty(message = "Email пользователя не может быть пустым")
    @Email(message = "Вы ввели не email")
    private String email;

    @NotEmpty(message = "Номер телефона не может быть пустым")
    @Pattern(regexp = "^((\\+7|7|8)+([0-9]){10})$", message = "Номер телефона должен быть в формате +7/7/80000000")
    private String phoneNumber;

    public User(int id, String lastName, String firstName, String patronymic, int age, String email, String phoneNumber) {
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.patronymic = patronymic;
        this.age = age;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
