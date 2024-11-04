<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>

<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">Payment</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Stripe Payment Form -->
                <form class="col-md-6" method="post" action="#">
                    <div class="form-group mb-4">
                        <label for="payment-element" class="text-black font-weight-bold">Payment Details</label>
                        <div id="payment-element" class="form-control" style="height: 400px;"></div>
                    </div>

                    <div class="form-group mt-3">
                        <button type="submit" id="pay-now" class="btn btn-primary btn-lg btn-block">
                            Pay Now
                        </button>
                        <div id="payment-errors" class="mt-2" style="color: red;"></div>
                        <div id="payment-success" class="mt-2" style="color: green;"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>

<% String clientSecret = (String) session.getAttribute("clientSecret"); %>
<script src="https://js.stripe.com/v3/"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const stripe = Stripe('pk_test_51PLpomKybfWviVZavtkpwtVIXnFiLJFgSBBd4kZmNZdIeqcbrBEGIChx75V7AomxX3dvWh2sVQfwkBCsO1qvtoY200YXXmgyza');
        const clientSecret = "<%= clientSecret %>";

        const appearance = { /* appearance */};
        const options = { /* options */};
        const elements = stripe.elements({ clientSecret, appearance });
        const paymentElement = elements.create('payment', options);
        paymentElement.mount('#payment-element');

        document.getElementById("pay-now").addEventListener("click", async (event) => {
            event.preventDefault();

            const {error, paymentIntent} = await stripe.confirmPayment({
                elements,
                confirmParams: {
                    return_url: 'http://localhost:8081/thankyou.jsp',
                },
            });

            if (error) {
                document.getElementById("payment-errors").textContent = error.message;
            } else if (paymentIntent && paymentIntent.status === 'succeeded') {
                document.getElementById("payment-success").textContent = "Payment successful!";
                window.location.href = "thankyou";
            }
        });
    });
</script>
</body>
</html>