function show( i) {
    if(i==0){
        alert("thêm thất bại!");
    }else{
        alert("thêm thành công");
    }
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#avatar').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#file").change(function() {
    readURL(this);
});

function readURL1(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#main').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#imgmain").change(function() {
    readURL1(this);
});
function readURL2(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#hover').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#imghover").change(function() {
    readURL2(this);
});
"use strict";

$(document).ready(function() {
    "use strict";

    $('#datable_1').DataTable();
    $('#datable_2').DataTable({ "lengthChange": false});
} );