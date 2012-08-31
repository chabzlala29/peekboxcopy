
$(function() {
    return $("#header_wrapper #nav a").hover((function() {
        return $("li div", this).stop().animate({
            opacity: 1.0
        }, {
            queue: false,
            duration: 200
        });
    }), function() {
        return $("li div", this).stop().animate({
            opacity: 0
        }, {
            queue: false,
            duration: 200
        });
    });
});