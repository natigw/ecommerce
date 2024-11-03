<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<style>
    body {
        background-color: #f4f6f8; /* Light gray background */
    }
    .bg-light {
        background-color: #343a40; /* Dark background for header */
    }
    .bg-light h2 {
        color: #fff; /* White color for header text */
    }
    .form-control {
        border: 1px solid #ced4da; /* Light border */
        border-radius: 0.25rem; /* Rounded corners */
    }
    .form-control:focus {
        border-color: #80bdff; /* Blue border on focus */
        box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25); /* Blue shadow */
    }
    .btn-primary {
        background-color: #28a745; /* Green background for buttons */
        border-color: #28a745; /* Green border */
    }
    .btn-primary:hover {
        background-color: #218838; /* Darker green on hover */
        border-color: #1e7e34; /* Darker green border on hover */
    }
    .border {
        border: 1px solid #dee2e6; /* Light border color for boxes */
    }
    .text-black {
        color: #212529; /* Standard black for text */
    }
    .text-danger {
        color: #dc3545; /* Bootstrap danger color for asterisks */
    }
</style>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/" class="text-white">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-white">Edit product</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Product information</h2>
                </div>

                <div class="col-md-7">
                    <form action="edit-product" method="post" enctype="multipart/form-data">
                        <div class="p-3 border">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="id" class="text-black">Product ID <span class="text-danger">*</span></label>
                                    <input name="product-id" type="text" class="form-control" id="id" value="${product.id}" readonly>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="name" class="text-black">Name <span class="text-danger">*</span></label>
                                    <input name="product-name" type="text" class="form-control" id="name" value="${product.name}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="image" class="text-black">Image <span class="text-danger">*</span></label>
                                    <input name="product-image" type="file" class="form-control" id="image">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="price" class="text-black">Price <span class="text-danger">*</span></label>
                                    <input name="product-price" type="number" class="form-control" id="price" value="${product.price}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="description" class="text-black">Description <span class="text-danger">*</span></label>
                                    <textarea name="product-description" id="description" cols="30" rows="7" class="form-control">${product.description}</textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="amount" class="text-black">Amount <span class="text-danger">*</span></label>
                                    <input name="product-amount" type="number" class="form-control" id="amount" value="${product.amount}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="category" class="text-black">Category <span class="text-danger">*</span></label>
                                    <select name="product-category" id="category" class="form-control">
                                        <c:forEach items="${category_list}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Edit product">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-md-5 ml-auto">
                    <div class="p-3 border">
                        <img src="data:image/jpg;base64,${product.base64Image}" alt="image" width="100%">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>
