function remove_product(){
    $('.remove_product_quantity').bind('click', function(){
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('tr').hide()
    })
}

$('.add_product_quantity').on('click', function(){
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    $('.product_quantity_table').append($(this).data('fields').replace(regexp, time));
    remove_product();
})

$('.deleteImageProduct').bind('click', function(e){
    $.ajax
    ({
        type: "POST",
        dataType: 'json',
        url: '/admin/products/delete_image',
        data: 'id='+$(this).attr('data')
    });
    $(this).closest('.show-image').remove();
    e.preventDefault();
})

$(document).ready(function(){
    remove_product()
})