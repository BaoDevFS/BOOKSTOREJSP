<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Contact | BookBGQ Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="Public/images/favicon.ico">
    <link rel="apple-touch-icon" href="Public/images/icon.png">

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="Public/css/bootstrap.min.css">
    <link rel="stylesheet" href="Public/css/plugins.css">
    <link rel="stylesheet" href="Public/css/style.css">

    <!-- Cusom css -->
    <link rel="stylesheet" href="Public/css/custom.css">

    <!-- Modernizer js -->
    <script src="Public/js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a
        href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <%@ include file="include/header.jsp" %>
    <!-- //Header -->
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Contact Us</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="Public/index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Contact Us</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Contact Area -->
    <section class="wn_contact_area bg--white pt--80 pb--80">
        <div class="google__map pb--80">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12">
                    <div class="contact-form-wrap">
                        <h2 class="contact__title">Get in touch</h2>
                        <p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim
                            placerat facer
                            possim assum. </p>
                        <form id="contact-form" action="/Contact" method="post">
                            <div class="single-contact-form space-between">
                                <input type="text" name="firstname" placeholder="First Name*">
                                <input type="text" name="lastname" placeholder="Last Name*">
                            </div>
                            <div class="single-contact-form space-between">
                                <input type="email" name="email" placeholder="Email*">
                                <input type="text" name="website" placeholder="Website*">
                            </div>
                            <div class="single-contact-form">
                                <input type="text" name="subject" placeholder="Subject*">
                            </div>
                            <div class="single-contact-form message">
                                <textarea name="message" placeholder="Type your message here.."></textarea>
                            </div>
                            <div class="contact-btn">
                                <button type="submit">Send Email</button>
                            </div>
                        </form>
                    </div>
                    <div class="form-output">
                        <p class="form-messege">
                    </div>
                </div>
                <div class="col-lg-4 col-12 md-mt-40 sm-mt-40">
                    <div class="wn__address">
                        <h2 class="contact__title">Get office info.</h2>
                        <p>Never give up.</p>
                        <div class="wn__addres__wreapper">

                            <div class="single__address">
                                <i class="icon-location-pin icons"></i>
                                <div class="content">
                                    <span>address:</span>
                                    <p>Cam Tu, Nong Lam University</p>
                                </div>
                            </div>

                            <div class="single__address">
                                <i class="icon-phone icons"></i>
                                <div class="content">
                                    <span>Phone Number:</span>
                                    <p>0396940321</p>
                                </div>
                            </div>

                            <div class="single__address">
                                <i class="icon-envelope icons"></i>
                                <div class="content">
                                    <span>Email address:</span>
                                    <p>Bookstorebqg@gmail.com</p>
                                </div>
                            </div>

                            <div class="single__address">
                                <i class="icon-globe icons"></i>
                                <div class="content">
                                    <span>website address:</span>
                                    <p>716-298-1822</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Contact Area -->
    <!-- Footer Area -->
    <%@ include file="include/footer.jsp" %>
    <!-- //Footer Area -->
    <div id="quickview-wrapper">
        <!-- Modal -->
        <div class="modal fade" id="success" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal__container" role="document">
                <div class="modal-content" style="margin-top: 22%">
                    <div id="statusWishlist" class="modal-body" style="margin: auto;font-size: 20px">
                       <i class="fa fa-check-circle fa-5x" style="color: green"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src="Public/js/vendor/jquery-3.2.1.min.js"></script>
<script src="Public/js/popper.min.js"></script>
<script src="Public/js/bootstrap.min.js"></script>
<script src="Public/js/plugins.js"></script>
<!-- Google Map js -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBmGmeot5jcjdaJTvfCmQPfzeoG_pABeWo"></script>
<script>
    // When the window has finished loading create our google map below
    google.maps.event.addDomListener(window, 'load', init);
    function init() {
        // Basic options for a simple Google Map
        // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
        var mapOptions = {
            // How zoomed in you want the map to start at (always required)
            zoom: 12,
            scrollwheel: false,
            // The latitude and longitude to center the map (always required)
            center: new google.maps.LatLng(10.8730575,106.7918104), // New York
            // How you would like to style the map.
            // This is where you would paste any style found on Snazzy Maps.
            styles:
                [
                    {
                        "featureType": "administrative",
                        "elementType": "labels.text.fill",
                        "stylers": [
                            {
                                "color": "#444444"
                            }
                        ]
                    },
                    {
                        "featureType": "landscape",
                        "elementType": "all",
                        "stylers": [
                            {
                                "color": "#f2f2f2"
                            }
                        ]
                    },
                    {
                        "featureType": "poi",
                        "elementType": "all",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "road",
                        "elementType": "all",
                        "stylers": [
                            {
                                "saturation": -100
                            },
                            {
                                "lightness": 45
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "all",
                        "stylers": [
                            {
                                "visibility": "simplified"
                            }
                        ]
                    },
                    {
                        "featureType": "road.arterial",
                        "elementType": "labels.icon",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "transit",
                        "elementType": "all",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "transit.station.bus",
                        "elementType": "labels.icon",
                        "stylers": [
                            {
                                "saturation": "-16"
                            }
                        ]
                    },
                    {
                        "featureType": "water",
                        "elementType": "all",
                        "stylers": [
                            {
                                "color": "#04b7ff"
                            },
                            {
                                "visibility": "on"
                            }
                        ]
                    }
                ]
        };
        // Get the HTML DOM element that will contain your map
        // We are using a div with id="map" seen below in the <body>
        var mapElement = document.getElementById('googleMap');
        // Create the Google Map using our element and options defined above
        var map = new google.maps.Map(mapElement, mapOptions);
        // Let's also add a marker while we're at it
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(23.7286, 90.3854),
            map: map,
            title: 'Dcare!',
            icon: 'images/icons/map.png',
            animation: google.maps.Animation.BOUNCE
        });
    }
</script>
<script src="Public/js/active.js"></script>
<script src="Public/js/carttoheader.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script src="Public/js/show.js"></script>
<script>
    $(function () {
        drawCart();
        sea();
    });
</script>
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/contact.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
</html>