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