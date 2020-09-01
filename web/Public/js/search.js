var table1;
let keys="ab";
function sea() {
     table1 = $('#search').DataTable({
        "searching": false,   // Search Box will Be Disabled
        "ordering": false,    // Ordering (Sorting on Each Column)will Be Disabled
        "info": false,         // Will show "1 to n of n entries" Text at bottom
        "lengthChange": false,
         "scrollY":        "400px",
         "scrollCollapse": true,
        "ajax": {
            url: "/Search",
            method: "get",
            dataSrc:"listBooks",
            data:function (d) {
                d.tukhoa=keys;
            },
            complete: function (data) {
                console.log(data.listBook);
            },
            success:function (data) {
                // console.log(data.listBook[0].id);
                $('#search tbody').empty();
                let x='';
                $.each(data.listBook,function (a,b) {
                    console.log(b.id);
                    x+='<tr role="row" class="odd">\n' +
                        '                    <td class=" product-thumbnail"><a href="/SingleProduct?id='+b.id+'"><img width="100px" height="100px"\n' +
                        '                src="'+b.image+'"\n' +
                        '                alt="productimg"></a></td>\n' +
                        '                <td class="white product-name"><a class="white" href="#">'+b.name+'</a></td>\n' +
                        '                <td class="white product-price"><span class="amount white">$'+b.price+'</span></td>\n' +
                        '                <td class="white product-remove"><a  class="white" href="#">'+b.author+'</a></td>\n' +
                        '                </tr>';

                });
                $('#search tbody').append(x);
            }
        }
    });
};
$('#key').change(function () {
    keys=$('#key').val();
    console.log(keys);
    table1.ajax.reload();
});
function changes() {
    keys=$('#key').val();
    console.log(keys);
    table1.ajax.reload();
}