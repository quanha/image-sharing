$(document).ready(function(){
    $('.addToCart').on('click', function(e){
        jQuery.ajax
        ({
            type: "POST",
            dataType: 'json',
            url: "/pages/add_to_cart",
            data: {
                product_id: $(this).data('product')
            },
            success: function(data){
                alert(data.message)
            }
        });
        e.preventDefault();
    });
});