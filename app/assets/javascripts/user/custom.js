$(document).ready(function(){
    $('.addToCart').on('click', function(e){
        jQuery.ajax
        ({
            type: "POST",
            dataType: 'json',
            url: "/pages/add_to_cart",
            data: {
                product_id: $(this).data('product'),
                size: $(this).data('size')
            },
            success: function(data){
                alert(data.message)
            },
            error: function(){
                alert('Something went wrong');
            }
        });
        e.preventDefault();
    });
});