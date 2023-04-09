package com.example.products.dao;


import com.example.products.models.Product;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class DaoProduct {
    private int id;
    private List<Product> products = new ArrayList<>();

    // Данный метод позволяет создать объект класса и добавить его в ArrayList
//    public void addProduct(String name, float price, String weight, Provider provider){
//        products.add(new Product(++id, name, price,weight, provider));
//
//    }

    // Данный метод позволяет добавить объект в лист
    public void addProduct(Product product){
        products.add(product);
        product.setId(++id);
    }

    // Данный метод позволяет получить все товары из ArrayList
    public List<Product> getProducts() {
        return products;
    }

    // Данный метод позволяет получить объект из листа по id
    public Product getProductId(int id){
//        for (Product pr: products) {
//            if(pr.getId() == id){
//                return pr;
//            }
//        }
//        return null;
        return products.stream().filter(product -> product.getId() == id).findAny().orElse(null);
    }

    // Данный метод позволяет найти товар по id и заменить поля данного товара на значения, которые придут вместе с объектом формы
    public void updatePerson(int id, Product product) {
        Product productUpdate = getProductId(id); // получаем редактируемый объект по его id
        productUpdate.setName(product.getName());
        productUpdate.setPrice(product.getPrice());
        productUpdate.setWeight(product.getWeight());
        productUpdate.setProvider(product.getProvider());
    }


    // Данный метод позволяет удалить товар по id
    public void deleteProduct(int id){
        products.removeIf(product -> product.getId() == id);
    }
}
