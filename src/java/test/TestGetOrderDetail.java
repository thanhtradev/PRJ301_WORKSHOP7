/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.util.ArrayList;

import model.OrderDetail;
import dao.OrderDao;

/**
 *
 * @author thanh
 */
public class TestGetOrderDetail {
    public static void main(String[] args) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            list = OrderDao.getOrderDetail(1);
            for (OrderDetail order : list) {
                System.out.println(order.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
