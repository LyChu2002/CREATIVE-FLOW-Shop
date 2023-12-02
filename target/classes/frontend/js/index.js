$(document).ready(function () {
    $('.banner-brand').slick({
        autoplay: true,
        prevArrow: '<button type="button" class="slick-prev custom-prev"><i class="fa-solid fa-chevron-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next custom-next"><i class="fa-solid fa-chevron-right"></i></button>'
    })
})

$(document).ready(function () {
    $('.product-list-slick').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        prevArrow: '<button type="button" class="slick-prev custom-prev"><i class="fa-solid fa-arrow-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next custom-next"><i class="fa-solid fa-arrow-right"></i></button>'
    })
})

$(document).ready(function(){
    $('.product-detail-infor .product-detail-img').slick({
        autoplay: true,
        prevArrow: '<button type="button" class="slick-prev custom-prev"><i class="fa-solid fa-chevron-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next custom-next"><i class="fa-solid fa-chevron-right"></i></button>'
    })
})