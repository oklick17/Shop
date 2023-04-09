package com.example.registration_user.dao;

import com.example.registration_user.Models.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserDao {
    private int id;
    private List<User>userList;
    {
        userList = new ArrayList<>();

    }
    //Добавление пользователей в Array list
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

    //Получение списка всех пользователей
    public List<User> getUserList() {

        return userList;
    }
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
    //Получние пользователя из ArrayList по id
    public User getUserId(int Id){

        return userList.stream().filter(user -> user.getId()==id).findAny().orElse(null);
    }
    //Редатирование данных конкретного пользователя
    public void  userUpdate(int id, User user){
        User userUpdate = getUserId(id);
        userUpdate.setLastName(user.getLastName());
        userUpdate.setFirstName(user.getFirstName());
        userUpdate.setPatronymic(user.getPatronymic());
        userUpdate.setAge(user.getAge());
        userUpdate.setEmail(user.getEmail());
        userUpdate.setPhoneNumber(user.getPhoneNumber());
    }
    //Удаление пользователя из ArrayList
    public void userDelete(int id)    {
        userList.removeIf(user -> user.getId()==id);
    }

}
