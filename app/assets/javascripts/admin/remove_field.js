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

$(document).ready(function(){
    remove_product()
})