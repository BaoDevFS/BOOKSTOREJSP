function addToCart(id) {
    $.ajax({
        url: "http://localhost:8080/BookStore/AjaxCart",
        method: "get",
        data: {
            id: id
        },
        complete:function (data) {
            console.log("helo")
            drawCart();
            $('#success').modal('show');
        }
    });
}

function propupbook(id) {
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