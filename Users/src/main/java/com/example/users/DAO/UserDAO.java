package com.example.users.DAO;

import com.example.users.models.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Component
public class UserDAO {
    private int id;
    private List<User> userList;
    {
        userList =  new ArrayList<>();
    }

    // Добавление пользователей в ArrayList
    public void addUser(User newUser){
        userList.add(newUser);
        newUser.setId(++id);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Получение списка всех пользователей
    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    // Получение пользователя из ArrayList по id
    public User getUserId(int id){
        return userList.stream().filter(user -> user.getId() == id).findAny().orElse(null);
    }

    // Редактирование данных конкретного пользователя
    public void userUpdate(int id, User user){
        User userUpdate = getUserId(id);
        userUpdate.setLastName(user.getLastName());
        userUpdate.setFirstName(user.getFirstName());
        userUpdate.setPatronymic(user.getPatronymic());
        userUpdate.setAge(user.getAge());
        userUpdate.setEmail(user.getEmail());
        userUpdate.setPhoneNumber(user.getPhoneNumber());
    }

    // Данный метод позволяет удалить элемент из ArrayList по id
    public void userDelete(int id){
        userList.removeIf(user -> user.getId() == id);
    }


}
