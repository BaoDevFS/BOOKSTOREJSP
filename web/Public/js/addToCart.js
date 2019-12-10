function addToCart(id) {
    $.ajax({
        url: "http://localhost:8080/BookStore/Cart",
        method: "post",
        data: {
            id: id, quantity: 0
        },
        complete:function (data) {
            console.log(data);
            if(data.responseText==""){
                drawCart();
                $('#success').modal('show');
            }else{
                try{
                    var json = JSON.parse(data.responseText);
                    console.log(json);
                }catch (e) {
                    console.log(e);
                    // window.location.replace("http://localhost:8080/BookStore/Login")
                }
            }

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
            var json  = JSON.parse(data.responseText);
            if(json.status==1){
                $('#statusWishlist').text("Added to wishlist");
            }else{
                $('#statusWishlist').text("Had in wishlist ");
            }
            $('#success').modal('show');
        }
    });
}

