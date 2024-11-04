package com.ecommerce.dao;

import com.ecommerce.database.Database;
import com.ecommerce.entity.Account;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

public class AccountDao {
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

    // Method to get base64 image from Blob
    private String getBase64Image(Blob blob) throws SQLException, IOException {
        try (InputStream inputStream = blob.getBinaryStream();
             ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = byteArrayOutputStream.toByteArray();
            return Base64.getEncoder().encodeToString(imageBytes);
        }
    }

    // Method to execute get account query with parameterized query
    private Account queryGetAccount(String query, Object... parameters) {
        Account account = new Account();
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            for (int i = 0; i < parameters.length; i++) {
                preparedStatement.setObject(i + 1, parameters[i]);
            }
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                account.setId(resultSet.getInt(1));
                account.setUsername(resultSet.getString(2));
                account.setPassword(resultSet.getString(3));
                account.setIsSeller(resultSet.getInt(4));
                account.setIsAdmin(resultSet.getInt(5));
                account.setAddress(resultSet.getString(7));
                account.setFirstName(resultSet.getString(8));
                account.setLastName(resultSet.getString(9));
                account.setEmail(resultSet.getString(10));
                account.setPhone(resultSet.getString(11));

                // Get profile image from database
                Blob imageBlob = resultSet.getBlob(6);
                if (imageBlob != null) {
                    account.setBase64Image(getBase64Image(imageBlob));
                } else {
                    account.setBase64Image(null);
                }
                return account;
            }
        } catch (SQLException | IOException e) {
            System.out.println("Error retrieving account: " + e.getMessage());
        } finally {
            closeResources();
        }
        return null;
    }

    // Method to get account by id
    public Account getAccount(int accountId) {
        String query = "SELECT * FROM account WHERE account_id = ?";
        return queryGetAccount(query, accountId);
    }

    // Method to get login account
    public Account checkLoginAccount(String username, String password) {
        String query = "SELECT * FROM account WHERE account_name = ? AND account_password = ?";
        return queryGetAccount(query, username, password);
    }

    // Method to check if username exists
    public boolean checkUsernameExists(String username) {
        String query = "SELECT * FROM account WHERE account_name = ?";
        return queryGetAccount(query, username) != null;
    }

    // Method to create an account
    public void createAccount(String username, String password, InputStream image) {
        String query = "INSERT INTO account (account_name, account_password, account_image, account_is_seller, account_is_admin) VALUES (?, ?, ?, 0, 0)";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setBinaryStream(3, image);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error creating account: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Method to edit profile information
    public void editProfileInformation(int accountId, String firstName, String lastName, String address, String email, String phone, InputStream image) {
        String query = (image != null) ?
                "UPDATE account SET account_first_name = ?, account_last_name = ?, account_address = ?, account_email = ?, account_phone = ?, account_image = ? WHERE account_id = ?" :
                "UPDATE account SET account_first_name = ?, account_last_name = ?, account_address = ?, account_email = ?, account_phone = ? WHERE account_id = ?";

        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, address);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phone);

            if (image != null) {
                preparedStatement.setBinaryStream(6, image);
                preparedStatement.setInt(7, accountId);
            } else {
                preparedStatement.setInt(6, accountId);
            }

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating profile: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Method to update profile information without image
    public void updateProfileInformation(int accountId, String firstName, String lastName, String address, String email, String phone) {
        String query = "UPDATE account SET account_first_name = ?, account_last_name = ?, account_address = ?, account_email = ?, account_phone = ? WHERE account_id = ?";
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, address);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phone);
            preparedStatement.setInt(6, accountId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating profile: " + e.getMessage());
        } finally {
            closeResources();
        }
    }
}