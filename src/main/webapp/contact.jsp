<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="site-wrap">
    <% request.setAttribute("contact_active", "active"); %>
    <jsp:include page="templates/header.jsp"/>

    <div class="bg-info py-3"> <!-- Changed background color -->
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="index.jsp" class="text-white">Home</a> <!-- Changed link color -->
                    <span class="mx-2 mb-0">/</span>
                    <strong class="text-light">Contact</strong> <!-- Changed strong color -->
                </div>
            </div>
        </div>
    </div>

    <div class="site-section bg-light"> <!-- Changed section background -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-dark">Get In Touch</h2> <!-- Changed heading color -->
                </div>

                <div class="col-md-7">
                    <form action="#" method="post">
                        <div class="p-3 p-lg-5 border" style="background-color: #fefefe;"> <!-- Light background for the form -->
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="c_fname" class="text-dark">First Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_fname" name="c_fname" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="c_lname" class="text-dark">Last Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_lname" name="c_lname" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_email" class="text-dark">Email <span class="text-danger">*</span></label>
                                    <input type="email" class="form-control" id="c_email" name="c_email" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_subject" class="text-dark">Subject </label>
                                    <input type="text" class="form-control" id="c_subject" name="c_subject">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_message" class="text-dark">Message </label>
                                    <textarea name="c_message" id="c_message" cols="30" rows="7" class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <input type="submit" class="btn btn-success btn-lg btn-block" value="Send Message"> <!-- Changed button color -->
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-md-5 ml-auto">
                    <div class="p-4 border mb-3 bg-white">
                        <span class="d-block text-success h6 text-uppercase">New York</span> <!-- Changed text color -->
                        <p class="mb-0">207 Fake St. Mountain View, San Jose, NYC, USA</p>
                    </div>

                    <div class="p-4 border mb-3 bg-white">
                        <span class="d-block text-success h6 text-uppercase">London</span>
                        <p class="mb-0">18 Fake St. Mountain View, Utah, UK</p>
                    </div>

                    <div class="p-4 border mb-3 bg-white">
                        <span class="d-block text-success h6 text-uppercase">Canada</span>
                        <p class="mb-0">342 Fake St. Flower dist., Canberra, Canada</p>
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
