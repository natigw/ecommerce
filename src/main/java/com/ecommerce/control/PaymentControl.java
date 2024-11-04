package com.ecommerce.control;

import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.stripe.Stripe;

@WebServlet(name = "PaymentControl", value = "/payment")
public class PaymentControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Stripe.apiKey = "sk_test_51PLpomKybfWviVZaVhx6VN5Lt6a2rvAvgnKJDQhscgVt7fpiH4jG5jjGwmn43GdCiyXwlY1Ieb3O7LRo9q8KvoYt00HegwbDGH";

        // Retrieve total price from session and convert to cents for Stripe
        HttpSession session = request.getSession();
        Double totalPrice = (Double) session.getAttribute("totalPrice");
        long amountInCents = Math.round(totalPrice * 100);

        try {
            // Create PaymentIntent
            PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
                    .setAmount(amountInCents)
                    .setCurrency("usd")
                    .build();

            PaymentIntent paymentIntent = PaymentIntent.create(params);
            String clientSecret = paymentIntent.getClientSecret();

            // Pass client secret to the JSP page
            session.setAttribute("clientSecret", clientSecret);
            session.setAttribute("total_price", totalPrice);
            response.sendRedirect("payment.jsp");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Payment failed: " + e.getMessage());
        }
    }
}