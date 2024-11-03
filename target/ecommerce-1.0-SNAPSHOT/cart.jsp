<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<style>
    /* General Styles */
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        color: #333;
    }

    .site-wrap {
        margin: 0 auto;
        padding: 20px;
    }

    /* Header styles */
    .bg-light {
        background-color: #007bff;
        color: white;
    }

    .bg-light a {
        color: white;
    }

    /* Cart Section */
    .site-section {
        background-color: white;
        border-radius: 12px; /* Rounded corners */
        padding: 40px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
    }

    .table th,
    .table td {
        padding: 15px;
        vertical-align: middle;
        border-top: 1px solid #dee2e6;
    }

    .product-thumbnail img {
        max-width: 80px;
        border-radius: 8px;
    }

    .btn {
        border-radius: 5px;
        padding: 10px 15px; /* Adjusted padding for better text fitting */
        transition: background-color 0.3s;
        text-align: center; /* Center text in buttons */
    }

    .btn-primary {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-primary:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }

    .btn-outline-primary {
        border-color: #007bff;
        color: #007bff;
    }

    .btn-outline-primary:hover {
        background-color: #007bff;
        color: white;
    }

    .h4 {
        color: #007bff;
    }

    /* Input Styles */
    input.form-control-plaintext {
        border: none;
        text-align: center;
        background-color: transparent;
        font-size: 1.2em;
        color: #333;
    }

    /* Coupon Code Section */
    #coupon {
        border: 1px solid #007bff;
        border-radius: 5px; /* Rounded corners for input */
    }

    #coupon:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }

    .product-remove {
        color: #dc3545;
    }
</style>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/">Home</a> <span class="mx-2 mb-0">/</span>
                    <strong class="text-black">Cart</strong>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <form class="container" method="post" action="checkout">
            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="site-blocks-table">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="product-thumbnail">Image</th>
                                <th class="product-name">Product</th>
                                <th class="product-price">Price</th>
                                <th class="product-quantity">Quantity</th>
                                <th class="product-total">Total</th>
                                <th class="product-remove">Remove</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${order.cartProducts}" var="o">
                                <tr>
                                    <td class="product-thumbnail">
                                        <img src="data:image/jpg;base64,${o.product.base64Image}" alt="Image" class="img-fluid">
                                    </td>

                                    <td>
                                        <input name="product-name" class="form-control-plaintext" value="${o.product.name}" readonly>
                                    </td>

                                    <td>
                                        <input name="product-price" class="form-control-plaintext" value="${o.price}" readonly>
                                    </td>

                                    <td style="min-width: 180px">
                                        <div class="input-group" style="max-width: fit-content; margin: 0;">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                            </div>

                                            <input name="product-quantity" type="text" class="form-control text-center" value="${o.quantity}" aria-label="Product Quantity">

                                            <div class="input-group-append">
                                                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <input name="product-price-total" class="form-control-plaintext" value="${o.price * o.quantity}" readonly>
                                    </td>

                                    <td>
                                        <a href="cart?remove-product-id=${o.product.id}" class="btn btn-remove btn-sm">X</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <a href="shop" class="btn btn-outline-primary btn-sm btn-block">Continue shopping</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="text-black h4" for="coupon">Coupon</label>
                            <p>Enter your coupon code if you have one.</p>
                        </div>
                        <div class="col-md-8 mb-3 mb-md-0">
                            <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-primary btn-sm">Apply Coupon</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pl-5">
                    <div class="row justify-content-end">
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-12 text-right border-bottom mb-5">
                                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <span class="text-black" style="font-size: 1.5em">Total</span>
                                </div>

                                <div class="col-md-6 text-right">
                                    <input name="order-price-total" class="form-control-plaintext" value="${total_price}" readonly>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <a href="checkout.jsp" class="btn btn-primary btn-lg py-3 btn-block">
                                        Proceed To Checkout
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>
<style>
    /* General Styles */
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        color: #333;
    }

    .site-wrap {
        margin: 0 auto;
        padding: 20px;
    }

    /* Header styles */
    .bg-light {
        background-color: #007bff;
        color: white;
    }

    .bg-light a {
        color: white;
    }

    /* Cart Section */
    .site-section {
        background-color: white;
        border-radius: 12px; /* Rounded corners */
        padding: 40px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
        border-radius: 12px; /* Rounded corners for the entire table */
        overflow: hidden; /* Ensures the corners are visible */
    }

    .table th,
    .table td {
        padding: 15px;
        vertical-align: middle;
        border-top: 1px solid #dee2e6;
    }

    .product-thumbnail img {
        max-width: 80px;
        border-radius: 8px;
    }

    .btn {
        border-radius: 8px; /* Ensuring buttons have rounded corners */
        padding: 10px 15px;
        transition: background-color 0.3s;
        text-align: center;
    }

    .btn-primary {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-primary:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }

    .btn-outline-primary {
        border-color: #007bff;
        color: #007bff;
    }

    .btn-outline-primary:hover {
        background-color: #007bff;
        color: white;
    }

    .h4 {
        color: #007bff;
    }

    /* Input Styles */
    input.form-control-plaintext, /* For product name, price, and total fields */
    #coupon {
        border-radius: 5px; /* Rounded corners for input fields */
    }

    /* Product Quantity Input */
    .input-group .form-control {
        border-radius: 5px; /* Rounded corners for quantity input */
    }

    /* Coupon Code Section */
    #coupon {
        border: 1px solid #007bff;
    }

    #coupon:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }

    .product-remove {
        color: #dc3545;
    }
</style>
