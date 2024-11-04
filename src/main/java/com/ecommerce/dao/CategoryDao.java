package com.ecommerce.dao;

import com.ecommerce.database.Database;
import com.ecommerce.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

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

    // Method to set amount of products for a category
    private void queryCategoryProductAmount(Category category) {
        String query = "SELECT COUNT(*) FROM product WHERE fk_category_id = ? AND product_is_deleted = false";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, category.getId());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                category.setTotalCategoryProduct(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println("Error getting category product amount: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Method to get category by ID
    public Category getCategory(int categoryId) {
        Category category = new Category();
        String query = "SELECT * FROM category WHERE category_id = ?";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, categoryId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                category.setId(resultSet.getInt(1));
                category.setName(resultSet.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving category: " + e.getMessage());
        } finally {
            closeResources();
        }

        // Set product amount for the category
        queryCategoryProductAmount(category);

        return category;
    }

    // Method to get all categories from the database
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM category";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt(1));
                category.setName(resultSet.getString(2));
                list.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving all categories: " + e.getMessage());
        } finally {
            closeResources();
        }

        // Set product amount for each category
        for (Category category : list) {
            queryCategoryProductAmount(category);
        }

        return list;
    }
}