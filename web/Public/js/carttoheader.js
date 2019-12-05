$(document).ready(function () {
function drawCart() {
    $.ajax({
        url: "http://localhost:8080/BookStore/Cart",
        method: "POST",
        complete: function (data) {
            var json = JSON.parse(data.responseText);
            console.log(json);
            $('#total').text('$' + json.totalCart);
            $('#quantity').text(json.productCart.length + ' items');
            $('.product_qun').text(json.productCart.length);
            for (var i = 0; i < json.productCart.length; i++) {
                var product = json.productCart[i];
            }
            $('.miniproduct').html(line);
        }
    });
