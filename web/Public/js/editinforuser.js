function editinfor(type) {
    var x;
    let icon;
    if (type == "contact") {
        x = {
            type: type,
            name: $('input[name="name"]').val(),
            fullname: $('input[name="fullname"]').val(),
            phone: $('input[name="phone"]').val(),
            gender: $('select[name="gender"]').val(),
        };
        icon=$('#contact');
    } else if (type == "address") {
        x = {
            type: type,
            address: $('input[name="address"]').val(),
        };
        icon=$('#address');
    } else {
        x = {
            type: type,
            oldPassword: $('input[name="passwordOld"]').val(),
            newPassword: $('input[name="newPassword"]').val(),
            rePassword: $('input[name="rePassword"]').val(),
        };
        icon=$('#passwordChange');
    }

    $.ajax({
        url: "/UserProfile",
        method: "post",
        data: x,
        success: function (data) {
            var json = JSON.parse(data);
            console.log(json.message);
            if(json.message=="1"){
                console.log("sucs")
                icon.removeClass('hidden');
            }else if(json.message=="0"){
                icon.addClass('hidden');
            }else{
                icon.text(json.message);
            }
        }
    });

}
$(document).on("change", "#imgmain",function () {
    var form = new FormData();
    form.append('avatar',$('#imgmain')[0].files[0]);
    $.ajax({
        url: "/UserProfile",
        method: "post",
        data: form,
        enctype: 'multipart/form-data',
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function (data) {
            var json = JSON.parse(data);
            console.log(json.message);
            if(json.message=="1"){
                console.log("sucs")
            }else if(json.message=="0"){
                console.log("fa")
            }else{
                console.log("nothing")
            }
        }
    });
});
function sendImage() {
    var form = new FormData();
    form.append('type',"avatar")
    form.append('avatar',$('imgmain').prop('files')[0]);
    $.ajax({
        url: "/UserProfile",
        method: "post",
        data: form,
        success: function (data) {
            var json = JSON.parse(data);
            console.log(json.message);
            if(json.message=="1"){
                console.log("sucs")
            }else if(json.message=="0"){
                console.log("fa")
            }else{
                console.log("nothing")
            }
        }
    })
}
function getOtp() {
    $('.before').addClass("hidden");
    $('.after').removeClass("hidden");
    $.ajax(
        {
            url:"/GetOTP",
            method:"GET",
            complete:function (data) {
                var json = JSON.parse(data.responseText);
                if(json.mes=="1"){

                }else{
                    $('.before').removeClass("hidden");
                    $('.after').addClass("hidden");
                }
            }
        }
    );
}
function verifyCode() {
    var code =$('input[name="code"]').val()
    $.ajax({
        url:"/GetOTP",
        method:"POST",
        data:{
            code:code,
            type:'0'
        },
        complete:function (data) {
            console.log(data);
            var json = JSON.parse(data.responseText);
            console.log(json);
            // 1 la thanh cong
            if(json.mes=="1"){
                $('.changpassword').removeClass('hidden');
                $('.authenticar').addClass('hidden');
            }else{
                $('.verify_error').removeClass('hidden');
            }
        }
    });
}
function verifyCodeForKey() {
    var code =$('#submitkey').val()
    $.ajax({
        url:"/GetOTP",
        method:"POST",
        data:{
            code:code,
            type:'1'
        },
        complete:function (data) {
            console.log(data);
            var json = JSON.parse(data.responseText);
            console.log(json);
            // 1 la thanh cong
            if(json.mes=="1"){
                $('.mes').removeClass('hidden');
                $('.authenticarchangekey').addClass('hidden');
            }else{
                $('.verify_error').removeClass('hidden');
            }
        }
    });
}

$('input[name="submit"]').on('click',verifyCode);
$('#buttonconfirm').on('click',verifyCodeForKey);