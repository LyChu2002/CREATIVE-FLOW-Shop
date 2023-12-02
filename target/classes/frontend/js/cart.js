$('.btn-qty').on('click', function(){
    var action = $(this).attr('data-action');
    var soLuong = $(this).parent().find('input[name="productQuantity"]').val();
    if(action == 'subtract'){
        if(soLuong > 1){
            soLuong = parseInt(soLuong) - 1;
        }else{
            soLuong = 1;
        }
    }
    else{
        soLuong = parseInt(soLuong) + 1;
    }
    $(this).parent().find('input[name="productQuantity"]').val(soLuong);

});

$('.btn-delete').on('click', function(){
    $(this).parents('.row-product').remove();
    
});




