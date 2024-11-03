<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<style>
    /* General Styles */
    body, html {
        margin: 0;
        padding: 0;
        font-family: 'Roboto', sans-serif;
        color: #333;
    }

    .hero {
        position: relative;
        height: 70vh;
        background: url("static/images/blog_1.jpg") center center / cover no-repeat;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
    }

    .hero-overlay {
        background-color: rgba(0, 0, 0, 0.5);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    .hero h1 {
        font-size: 3em;
        margin: 0;
        z-index: 1;
    }

    .section-heading {
        font-size: 2em;
        margin: 20px 0;
        text-align: center;
        color: #007bff;
    }

    /* Team Section */
    .team-section {
        padding: 50px 0;
        background-color: #f9f9f9;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }

    .team-card {
        width: 220px;
        text-align: center;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        background-color: #fff;
        transition: transform 0.3s;
    }

    .team-card:hover {
        transform: scale(1.05);
    }

    .team-card img {
        width: 100%;
        border-bottom: 2px solid #007bff;
    }

    .team-card h3, .team-card p {
        margin: 10px 0;
    }

    /* Services Section */
    .services {
        display: flex;
        justify-content: center;
        gap: 20px;
        padding: 50px 20px;
        background: #e9ecef;
    }

    .service-box {
        flex: 1;
        max-width: 280px;
        text-align: center;
        background: #fff;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        transition: transform 0.3s;
    }

    .service-box:hover {
        transform: scale(1.05);
    }

    .service-box .icon {
        font-size: 3em;
        color: #007bff;
        margin-bottom: 15px;
    }
</style>

<body>
<div class="site-wrap">

    <!-- Set active attribute for navigation -->
    <% request.setAttribute("about_active", "active"); %>
    <jsp:include page="templates/header.jsp"/>

    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-overlay"></div>
        <h1>Welcome to Our Story</h1>
    </div>

    <!-- About Section -->
    <div class="about-section" style="padding: 50px; background: white;">
        <h2 class="section-heading">Our Journey</h2>
        <div class="container" style="display: flex; justify-content: center; gap: 30px;">
            <img src="static/images/shop.png" alt="Our journey" style="width: 45%; border-radius: 8px;">
            <div style="max-width: 500px;">
                <p>Our shop opened its doors last spring, nestled in the heart of the community, ready to offer a unique shopping experience. From the very first day, customers were greeted with a warm welcome and an inviting atmosphere filled with the scent of fresh coffee. The shelves were stocked with a carefully curated selection of handmade goods, showcasing local artisans and their talents.</p>
                <p>As word spread about our unique offerings, more shoppers began to visit, eager to find one-of-a-kind gifts and treasures. Many customers expressed their delight in discovering eco-friendly products that aligned with their values and lifestyle.</p>
            </div>
        </div>
    </div>

    <!-- Team Section -->
    <div class="team-section">
        <h2 class="section-heading">Meet Our Team</h2>
        <div class="team-card">
            <img src="static/images/person_1.jpg" alt="Umman Mammadov">
            <h3>Umman Mammadov</h3>
            <p>CEO/Co-Founder</p>
            <p>He drives the company's growth and fosters a culture of innovation and collaboration among employees.</p>
        </div>
        <div class="team-card">
            <img src="static/images/person_2.jpg" alt="Aran Shirinzade">
            <h3>Aran Shirinzade</h3>
            <p>Co-Founder</p>
            <p>A dedicated entrepreneur who helped shape the company's vision and values from the very beginning.</p>
        </div>
        <div class="team-card">
            <img src="static/images/person_3.jpg" alt="Kamal Allahveranli">
            <h3>Kamal Allahveranli</h3>
            <p>Marketing</p>
            <p>He focuses on creating compelling campaigns that connect with customers, build brand.</p>
        </div>
        <div class="team-card">
            <img src="static/images/natig.jpg" alt="Natig Mammadov">
            <h3>Natig Mammadov</h3>
            <p>Sales Manager</p>
            <p>He leads the team in achieving targets, developing strategies to maximize revenue, relationships with clients.</p>
        </div>
    </div>

    <!-- Services Section -->
    <div class="services">
        <div class="service-box">
            <div class="icon">
                <span class="icon-truck"></span>
            </div>
            <h3>Free Shipping</h3>
            <p>Enjoy free shipping on all orders, ensuring convenience and satisfaction with every purchase.</p>
        </div>
        <div class="service-box">
            <div class="icon">
                <span class="icon-refresh2"></span>
            </div>
            <h3>Easy Returns</h3>
            <p>Our hassle-free return policy makes shopping with us a seamless experience from start to finish.</p>
        </div>
        <div class="service-box">
            <div class="icon">
                <span class="icon-help"></span>
            </div>
            <h3>24/7 Support</h3>
            <p>Our dedicated support team is here for you around the clock, ready to answer any questions.</p>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>
</body>
</html>
