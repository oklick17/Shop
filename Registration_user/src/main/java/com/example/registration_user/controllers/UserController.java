package com.example.registration_user.controllers;


import com.example.registration_user.Models.User;
import com.example.registration_user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;


@Controller
@RequestMapping("/user")
public class UserController {
    private final UserDao userDao;
@Autowired
    public UserController(UserDao userDao) {
        this.userDao = userDao;
    }
    //Данный метод отображает страницу добавления пользователя

    @GetMapping ("/add")
    public String userAdd(Model model){
    model.addAttribute("user", new User());
    return  "userAdd";
    }
    //Данный метод принимает объект с формы редактирования и сохраняет нового пользователя
    @PostMapping ("/add")
    public String userAdd(@ModelAttribute("user") User newUser){
        userDao.addUser(newUser);
        return "redirect:/user";
    }
    // Данный метод позволяет отобразить главную страницу со списком всех пользователей
    @GetMapping("")
    public String index(Model model){
    model.addAttribute("user", userDao.getUserList());
    return "user";
    }
    //Данный метод позволяет найти пользователя по id
    @GetMapping("/{id}")
    public String userInfo(Model model, @PathVariable("id") int id){
    model.addAttribute("user", userDao.getUserId(id));
    return "userInfo";
    }
    //Данный метод позволяет получить  объект редактируемого пользователя по Id и вернуть шаблон редактирования
    @GetMapping("/edit/{id}")
    public String userEdit(Model model, @PathVariable("id") int id){
    model.addAttribute("userEdit", userDao.getUserId(id));
    return "userEdit";
    }
    // Данны метод позволяет принять данные с формы редактирования и обновлять данные пользователя
    @PostMapping ("/edit/{id}")
    public String userEditValue(@ModelAttribute("userEdit") User user, @PathVariable("id") int id) {
    userDao.userUpdate(id, user);
    return "redirect:/user/" + id;
    }
    @GetMapping("/delete/{id}") 
    //Данный метод позволяет удалить пользователя
public  String userDelete(@PathVariable("id") int id){
   userDao.userDelete(id);
   return "redirect:/user";
}
}

