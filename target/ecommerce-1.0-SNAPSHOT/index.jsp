<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<style>
    body {
        background-color: #f9f9f9; /* Light background color for body */
        font-family: 'Arial', sans-serif; /* Modern font style */
    }

    .site-blocks-cover {
        background-image: url(static/images/shoe.png);
        background-size: cover;
        height: 400px; /* Adjust height to suit your design */
    }

    .site-blocks-cover h1 {
        color: #ffffff; /* White color for the main heading */
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Adding a shadow for better visibility */
    }

    .btn-primary {
        background-color: #28a745; /* Bootstrap success color for buttons */
        border: none;
        color: white; /* White text color for buttons */
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #218838; /* Darker green on hover */
    }

    .site-section h2 {
        color: #343a40; /* Darker color for section headings */
    }

    .icon {
        color: #007bff; /* Blue color for icons */
        font-size: 40px; /* Increase icon size */
    }

    .site-section.site-blocks-1 {
        background-color: #ffffff; /* White background for sections */
        padding: 40px 0; /* Adding padding for spacing */
    }

    .block-8 {
        background-color: #ffcc00; /* Bright yellow for sale section */
        padding: 60px 0; /* Adding padding for spacing */
        color: #333; /* Dark text color for contrast */
    }

    .block-8 h2 a {
        color: #333; /* Dark color for the sale heading */
        text-decoration: underline;
    }

    .post-meta {
        color: #555; /* Gray color for meta info */
    }
</style>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <div class="site-blocks-cover" data-aos="fade">
        <div class="container">
            <div class="row align-items-start align-items-md-center justify-content-end">
                <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
                    <h1 class="mb-2">Finding Your Perfect Clothes</h1>

                    <div class="intro-text text-center text-md-left">
                        <p class="mb-4">Discover the perfect fit for your unique style at our shop – where quality meets
                            comfort in every step. </p>
                        <p>
                            <a href="shop" class="btn btn-sm btn-primary">Shop Now</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section site-section-sm site-blocks-1">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-truck"></span>
                    </div>

                    <div class="text">
                        <h2 class="text-uppercase">Free Shipping</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer
                            accumsan tincidunt fringilla.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-refresh2"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Free Returns</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer
                            accumsan tincidunt fringilla.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-help"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Customer Support</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer
                            accumsan tincidunt fringilla.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="templates/collections-section.jsp"/>

    <div class="site-section block-8">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>The opportunity of the year!</h2>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col-md-12 col-lg-7 mb-5">
                    <a href="#"><img src="static/images/blog_1.jpg" alt="Image placeholder"
                                     class="img-fluid rounded"></a>
                </div>
                <div class="col-md-12 col-lg-5 text-center pl-md-5">
                    <h2><a href="#">50% less in all items</a></h2>
                    <p class="post-meta mb-4">Until November 4, 2024</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam iste dolor accusantium facere
                        corporis ipsum animi deleniti fugiat. Ex, veniam?</p>
                    <p><a href="shop" class="btn btn-primary btn-sm">Shop Now</a></p>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>
