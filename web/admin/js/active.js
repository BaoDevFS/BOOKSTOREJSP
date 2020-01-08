function activeMenu() {
    var url= window.location.href;
    var key = url.substring(url.lastIndexOf("/")+1,url.length);
    console.log(key.toLowerCase());
    switch (key.toLowerCase()) {
        case "index":
            $('.dashboard').addClass("menu-active");
            break;
        case "userall":
            $('.users').addClass("menu-active");
            $('.contentuser').css("display","block");
            $('.userall').addClass("menu-active");
            break;
        case "useradd":
            $('.users').addClass("menu-active");
            $('.contentuser').css("display","block");
            $('.useradd').addClass("menu-active");
            break;
        case "packageall":
            $('.products').addClass("menu-active");
            $('.contentproduct').css("display","block");
            $('.allproducts').addClass("menu-active");
            break;
        case "packageadd":
            $('.products').addClass("menu-active");
            $('.contentproduct').css("display","block");
            $('.addproducts').addClass("menu-active");
            break;
        case "packagecartall":
            $('.products').addClass("menu-active");
            $('.contentproduct').css("display","block");
            $('.allcategories').addClass("menu-active");
            break;
        case "packagecartadd":
            $('.products').addClass("menu-active");
            $('.contentproduct').css("display","block");
            $('.addcategories').addClass("menu-active");
            break;
        case "authorall":
            $('.products').addClass("menu-active");
            $('.contentproduct').css("display","block");
            $('.allauthor').addClass("menu-active");
            break;
        case "authoradd":
            $('.products').addClass("menu-active");
            $('.contentproduct').css("display","block");
            $('.addauthor').addClass("menu-active");
            break;
        case "discountall":
            $('.discounts').addClass("menu-active");
            $('.contentdiscount').css("display","block");
            $('.alldiscounts').addClass("menu-active");
            break;
        case "discountadd":
            $('.discounts').addClass("menu-active");
            $('.contentdiscount').css("display","block");
            $('.adddiscounts').addClass("menu-active");
            break;
        case "packagebookingall":
            $('.booking').addClass("menu-active");
            $('.contentbooking').css("display","block");
            $('.bookingproduct').addClass("menu-active");
            break;


    }
}