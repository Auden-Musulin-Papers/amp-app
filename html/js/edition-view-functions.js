function diplomaticClick(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
        });
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).addClass("unclear");
        });
        $(".space").each(function() {
            $(this).removeClass("fade");
        });
        $(".del").each(function() {
            $(this).addClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("italic");
            $(this).addClass("underline");
        });
        $("#reading-link").removeClass("active");
        $("p").each(function() {
            $(this).removeClass("reading-view-font");
        });
        $(".osd-viewer").each(function() {
            $(this).removeClass("fade-all");
            $(this).addClass("col-md-6");
        });
        $(".text-re").each(function() {
            $(this).removeClass("col-md-12");
            $(this).addClass("col-md-6");            
        });
        $(".expand-wrapper").each(function() {
            $(this).removeClass("fade");
        });
        $(".expand-wrapper input").each(function() {
            $(this).val(201);
        });
    }
}

function diplomaticLoad(el) {
    $(".abbr").each(function() {
        // console.log($(this));
        $(this).addClass("unclear");
    });
    $(".space").each(function() {
        $(this).removeClass("fade");
    });
    $(".del").each(function() {
        $(this).addClass("strikethrough");
    });
    $(".hi-underline").each(function() {
        $(this).addClass("underline");
    });
}

function readingClick(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
            $(this).removeClass("italic");
        });
        $("p").each(function() {
            $(this).removeClass("reading-view-font");
        });
        $(".osd-viewer").each(function() {
            $(this).addClass("fade-all");
        });
        $(".expand-wrapper").each(function() {
            $(this).addClass("fade");
        });
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear");
        });
        $(".space").each(function() {
            $(this).addClass("fade");
        });
        $(".del").each(function() {
            $(this).removeClass("strikethrough");
        });
        $(".hi-underline").each(function() {
            $(this).removeClass("underline");
            $(this).addClass("italic");
        });
        $("#diplomatic-link").removeClass("active");
        $("p").each(function() {
            $(this).addClass("reading-view-font");
        });
        $(".osd-viewer").each(function() {
            $(this).addClass("fade-all");
            $(this).removeClass("col-md-6");
            $(this).css("max-width","100%");  
        });
        $(".text-re").each(function() {
            $(this).removeClass("col-md-6");
            $(this).addClass("col-md-12");      
            $(this).css("max-width","100%");    
        });
        $(".expand-wrapper").each(function() {
            $(this).addClass("fade");
        });
    }
}

function deletions(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".del").each(function() {
            $(this).removeClass("strikethrough badge-item red");
        });
    } else {
        element.addClass("active");
        $(".del").each(function() {
            $(this).addClass("strikethrough badge-item red");
        });
    }
}

function unclear(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".abbr").each(function() {
            $(this).removeClass("unclear badge-item yellow");
        });
    } else {
        element.addClass("active");
        $(".abbr").each(function() {
            $(this).addClass("unclear badge-item yellow");
        });
    }
}

function space(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".space").each(function() {
            $(this).addClass("fade");
            $(this).removeClass("badge-item green");
        });
    } else {
        element.addClass("active");
        $(".space").each(function() {
            $(this).removeClass("fade");
            $(this).addClass("badge-item green");
        });
    }
}

function underline(el) {
    var element = $(el);
    if ( element.hasClass("active") ) {
        element.removeClass("active");
        $(".hi-underline").each(function() {
            $(this).removeClass("underline badge-item blue");
        });
    } else {
        element.addClass("active");
        $(".hi-underline").each(function() {
            $(this).addClass("underline badge-item blue");
        });
    }
}

function clearAll(el) {
    $(".abbr").each(function() {
        $(this).removeClass("unclear badge-item yellow");
    });
    $(".space").each(function() {
        $(this).addClass("fade").removeClass("badge-item green");
    });
    $(".del").each(function() {
        $(this).removeClass("strikethrough badge-item red");
    });
    $(".hi-underline").each(function() {
        $(this).removeClass("italic underline badge-item blue");
    });
    $("#reading-link").removeClass("active");
    $("#diplomatic-link").removeClass("active");
    $("#unclear-link").removeClass("active");
    $("#whitespaces-link").removeClass("active");
    $("#underline-link").removeClass("active");
    $("#deletions-link").removeClass("active");
    $("p").each(function() {
        $(this).removeClass("reading-view-font");
    });
}