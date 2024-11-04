package com.ecommerce.control;

import com.ecommerce.dao.AccountDao;
import com.ecommerce.dao.OrderDao;
import com.ecommerce.entity.Account;
import com.ecommerce.entity.Order;
import com.ecommerce.util.EmailUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutControl", value = "/checkout")
public class CheckoutControl extends HttpServlet {
    // Call DAO class to access with database.
    OrderDao orderDao = new OrderDao();
    AccountDao accountDao = new AccountDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Get information from input fields
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
        } else {
            double totalPrice = (double) session.getAttribute("total_price");
            Order order = (Order) session.getAttribute("order");
            Account account = (Account) session.getAttribute("account");

            // Update profile information
            int accountId = account.getId();
            accountDao.updateProfileInformation(accountId, firstName, lastName, address, email, phone);

            // Insert order into database
            orderDao.createOrder(accountId, totalPrice, order.getCartProducts());

            // Send email notification
            EmailUtil emailUtil = new EmailUtil();
            String subject = "Order Confirmation";
            String body = "Dear " + firstName + " " + lastName + ",\n\n" +
                    "Thank you for your order! Your order total is $" + totalPrice + ".\n\n" +
                    "Best regards,\nE-commerce Team";
            emailUtil.sendEmail(email, subject, body);

            // Remove session attributes
            session.removeAttribute("order");
            session.setAttribute("total_price", 0);

            // Forward totalPrice to PaymentServlet by setting it in the session
            session.setAttribute("totalPrice", totalPrice);

            response.sendRedirect("payment");
        }
    }
}