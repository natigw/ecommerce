<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-light py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/">Home</a>
                    <span class="mx-2 mb-0">/</span>
                    <a href="cart.jsp">Cart</a>
                    <span class="mx-2 mb-0">/</span>
                    <strong class="text-primary">Checkout</strong>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <form class="row" method="post" action="checkout">
                <div class="col-md-7 mb-5">
                    <h2 class="h3 mb-4 text-primary">Billing Details</h2>
                    <div class="p-4 border rounded shadow-sm" style="background-color: #ffffff;">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <label for="first-name" class="text-muted">First Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="first-name" name="first-name"
                                       value="${account.firstName}" required>
                            </div>

                            <div class="col-md-6">
                                <label for="last-name" class="text-muted">Last Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="last-name" name="last-name"
                                       value="${account.lastName}" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="text-muted">Address <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="address" name="address"
                                   value="${account.address}" required>
                        </div>

                        <div class="form-group row mb-5">
                            <div class="col-md-6">
                                <label for="email" class="text-muted">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" id="email" name="email"
                                       value="${account.email}" required>
                            </div>
                            <div class="col-md-6">
                                <label for="phone" class="text-muted">Phone <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="phone" name="phone"
                                       value="${account.phone}" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <h2 class="h3 mb-4 text-primary">Your Order</h2>
                    <div class="p-4 border rounded shadow-sm" style="background-color: #ffffff;">
                        <table class="table site-block-order-table mb-4">
                            <thead>
                            <tr>
                                <th style="text-align: center" class="text-muted">Product</th>
                                <th style="text-align: center" class="text-muted">Price</th>
                                <th style="text-align: center" class="text-muted">Quantity</th>
                                <th style="text-align: center" class="text-muted">Total</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${order.cartProducts}" var="o">
                                <tr>
                                    <td>
                                        <input name="product-name" class="form-control-plaintext h5 text-black"
                                               value="${o.product.name}" style="text-align: center" readonly>
                                    </td>
                                    <td>
                                        <input name="product-price" class="form-control-plaintext h5 text-black"
                                               value="${o.price}" style="text-align: center" readonly>
                                    </td>
                                    <td>
                                        <input name="product-quantity"
                                               class="form-control-plaintext h5 text-black"
                                               value="${o.quantity}" style="text-align: center" readonly>
                                    </td>
                                    <td>
                                        <input name="product-total" class="form-control-plaintext h5 text-black"
                                               value="${o.price * o.quantity}" style="text-align: center"
                                               readonly>
                                    </td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <td></td>
                                <td></td>
                                <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                <td class="text-black font-weight-bold">
                                    <input name="order-total-price" class="form-control-plaintext h5 text-black"
                                           value="${total_price}" style="text-align: center" readonly>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                Place Order
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>
