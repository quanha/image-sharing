$('.remove_product_quantity').on('click', function(){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide()
})