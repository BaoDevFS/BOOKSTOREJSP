function addToCart(id) {
    $.ajax({
        url: "http://localhost:8080/BookStore/AjaxCart",
        method: "get",
        data: {
            id: id
        },
        complete:function (data) {
            drawCart();
            $('#success').modal('show');
        }
    });
}

var i=0;

function addToCartShow(id,quantum) {
    $.ajax({
        url: "http://localhost:8080/BookStore/Cart",
        type: "post",
        data: {id: id,quantity:quantum},
        complete: function (resultText) {
            drawCart();
            $('#success').modal('show');
        }
    });
}

function getidshow() {
    return i;
}

function propupbook(id) {
    i=id;
    $.ajax({
        url: "http://localhost:8080/BookStore/AjaxBookMini",
        method: "get",
        data:{
            id:id
        },
        dataType: 'json',
        success: function (data) {
            $('#imageBook').html('<img  src="'+data.image+'">');
            $('#nameBook').text(data.name);
            $('#priceBook').text("$"+data.price);
            $('#descriptionBook').text(data.description);
            $('#typeBook').text(data.booktype);
            $('#productmodal').modal('show');
        }
    });
}
function addToWishList(id) {
    $.ajax({
        url: "http://localhost:8080/BookStore/AjaxWishList",
        method: "get",
        data: {
            id: id

        },
        complete:function (data) {
            $('#success').modal('show');
        }
    });
}

