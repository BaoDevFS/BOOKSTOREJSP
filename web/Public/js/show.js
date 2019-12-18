function gelet() {
    document.getElementById("invalid").style.display = 'block';
    document.getElementById("invalid").style.color = 'red';

}

var ajax = $.ajax({
    url: "http://localhost:8080/BookStore/UserProfile",
    method: "POST",

});
ajax.data({d:'',D:''})