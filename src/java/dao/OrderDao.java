/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import model.Order;
import model.OrderDetail;
import java.sql.SQLException;
import util.DBUtils;

/**
 *
 * @author thanh
 */
public class OrderDao {

    public static ArrayList<Order> getOrders(String email) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [OrderID],[OrdDate],[shipdate],[dbo].[Orders].[status] as 'status' ,[dbo].[Orders].[AccID] as 'AccID'\n"
                    + "from [dbo].[Orders],[dbo].[Accounts]\n"
                    + "where [dbo].[Orders].[AccID]=[dbo].[Accounts].[accID]\n"
                    + "and [email] like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("OrderID");
                String orderDate = rs.getString("OrdDate");
                String shipDate = rs.getString("shipdate");
                int status = rs.getInt("status");
                int accID = rs.getInt("AccID");
                Order order = new Order(orderId, orderDate, shipDate, status, accID);
                list.add(order);
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) throws Exception {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select [DetailId],[OrderID],[PID],[PName],[price],[imgPath],[quantity]\n"
                    + "from [dbo].[OrderDetails],[dbo].[Plants]\n"
                    + "where [OrderID]=? and [dbo].[OrderDetails].[FID]=[dbo].[Plants].[PID]";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderID);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int orderDetailID = rs.getInt("DetailId");
                int plantID = rs.getInt("PID");
                String plantName = rs.getString("PName");
                int price = rs.getInt("price");
                String imgPath = rs.getString("imgPath");
                int quantity = rs.getInt("quantity");
                OrderDetail orderDetail = new OrderDetail(orderDetailID, orderID, plantID, plantName, price, imgPath,
                        quantity);
                list.add(orderDetail);
            }
            cn.close();
        }
        return list;
    }

    public static int updateOrderStatus(int orderID, int status) {
        int result = -1;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Orders]\n"
                        + "set [status] = ?\n"
                        + "where [OrderID] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                }
            }
        }
        return result;
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        boolean result = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false);
                String sql = "select accID from Accounts\n" +
                        "where Accounts.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next())
                    accid = rs.getInt("accID");
                // insert new a order
                Date date = new Date(System.currentTimeMillis());
                sql = "INSERT Orders(OrdDate,status,AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, date);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                // get order id that is the largest number
                sql = "select top 1 orderID from Orders order by orderId desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next())
                    orderid = rs.getInt("orderID");
                // insert order details
                for (String pid : cart.keySet()) {
                    sql = "insert orderDetails values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);

                }
                return true;
            }
        } catch (Exception e) {
            try {
                if (cn != null)
                    cn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null)
                    cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }
}
