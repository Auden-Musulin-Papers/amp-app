$('.sync').click(function (e) {     
    //get selected href
    var href = $(this).attr('href');
    var dataTab = $(this).attr('data-tab');

    //set all nav tabs to inactive
    $('.pagination .nav-tabs li a[data-tab="'+dataTab+'"]').removeClass('active');

    //get all nav tabs matching the href and set to active
    $('.pagination .nav-tabs li a[href="'+href+'"]').addClass('active');

    //set all nav tabs to inactive
    $('.dropdown-menu li a[data-tab="'+dataTab+'"]').removeClass('active');

    //get all nav tabs matching the href and set to active
    $('.dropdown-menu li a[href="'+href+'"]').addClass('active');

    //active tab
    $('.pagination-tab.tab-pane[data-tab="'+dataTab+'"]').removeClass('active');   
    $('.pagination-tab.tab-pane'+href).addClass('active show');
})