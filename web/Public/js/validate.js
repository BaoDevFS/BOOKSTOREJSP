var password = document.getElementById("pass");
var confirm_password = document.getElementById("repass");

function validatePassword(){
    console.log(password.value+"-"+confirm_password.value);
    if(password.value!=confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
        console.log("ok");
    } else {
        confirm_password.setCustomValidity('');
        console.log("notok");
    }
}
confirm_password.addEventListener("change",function () {
    console.log("change")
    validatePassword();
});
$('#save').click(function () {
    validatePassword();
})
$('.eye').click(function () {
    if($(this).parent("div").children("input").attr('type')=='password'){
        $(this).parent("div").children("input").attr('type','text');
    }else{
        $(this).parent("div").children("input").attr('type','password');
    }
    var x=setInterval(function () {
        console.log("adasd");
        $('input').attr('type','password');
        clearInterval(x);
    },1500);
});
