package com.ecommerce.dao;

import com.ecommerce.database.Database;
import com.ecommerce.entity.Account;
import com.ecommerce.entity.CartProduct;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    // Call ProductDao and AccountDao classes to interact with the database.
    ProductDao productDao = new ProductDao();
    AccountDao accountDao = new AccountDao();

    // Method to close resources
    private void closeResources() {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }

    // Method to get the last order ID in the database.
    public int getLastOrderId() {
        String query = "SELECT order_id FROM order ORDER BY order_id DESC LIMIT 1";
        int orderId = 0;
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                orderId = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeResources();
        }
        return orderId;
    }

    // Method to insert order detail information.
    private void createOrderDetail(List<CartProduct> cartProducts) {
        String query = "INSERT INTO order_detail (fk_order_id, fk_product_id, product_quantity, product_price) VALUES (?, ?, ?, ?)";
        int orderId = getLastOrderId();

        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);

            for (CartProduct cartProduct : cartProducts) {
                productDao.decreaseProductAmount(cartProduct.getProduct().getId(), cartProduct.getQuantity());

                preparedStatement.setInt(1, orderId);
                preparedStatement.setInt(2, cartProduct.getProduct().getId());
                preparedStatement.setInt(3, cartProduct.getQuantity());
                preparedStatement.setDouble(4, cartProduct.getPrice());
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Create order_detail catch: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Method to insert order information to the database.
    public void createOrder(int accountId, double totalPrice, List<CartProduct> cartProducts) {
        String query = "INSERT INTO order (fk_account_id, order_total) VALUES (?, ?)";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, accountId);
            preparedStatement.setDouble(2, totalPrice);
            preparedStatement.executeUpdate();

            // Call create order detail method.
            createOrderDetail(cartProducts);
        } catch (SQLException e) {
            System.out.println("Create order catch: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Method to get order detail list of a seller.
    public List<CartProduct> getSellerOrderDetail(int productId) {
        List<CartProduct> list = new ArrayList<>();
        String query = "SELECT * FROM order_detail WHERE fk_product_id = ?";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = productDao.getProduct(resultSet.getInt(2));
                int productQuantity = resultSet.getInt(3);
                double productPrice = resultSet.getDouble(4);

                list.add(new CartProduct(product, productQuantity, productPrice));
            }
        } catch (SQLException e) {
            System.out.println("Query cart product list catch: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    // Method to get order history of a customer.
    public List<Order> getOrderHistory(int accountId) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM order WHERE fk_account_id = ?";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, accountId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt(1);
                double orderTotal = resultSet.getDouble(3);
                Date orderDate = resultSet.getDate(4);

                list.add(new Order(orderId, orderTotal, orderDate));
            }
        } catch (SQLException e) {
            System.out.println("Order history catch: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }

    // Method to get order detail history.
    public List<CartProduct> getOrderDetailHistory(int orderId) {
        List<CartProduct> list = new ArrayList<>();
        String query = "SELECT * FROM order_detail WHERE fk_order_id = ?";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, orderId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = productDao.getProduct(resultSet.getInt(2));
                int quantity = resultSet.getInt(3);
                double price = resultSet.getDouble(4);

                list.add(new CartProduct(product, quantity, price));
            }
        } catch (SQLException e) {
            System.out.println("Get order detail catch: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
    }
}