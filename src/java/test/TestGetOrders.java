/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.util.ArrayList;

import model.Order;
import dao.OrderDao;

/**
 *
 * @author thanh
 */
public class TestGetOrders {
    public static void main(String[] args) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            list = OrderDao.getOrders("nguyenthanhdangkhoa@gmail.com");
            for (Order order : list) {
                System.out.println(order.getOrderDate());
            }
        } catch (Exception e) {
        }
    }
}
