(function($){

    $.fn.message_popup = function(options) {
      // Default parameters
      $.fn.message_popup.defaults = {
        height : "250",
        width : "500",
        title:"JQuery Message Box",
        content: "Example of how to create a modal box.",
        top: "20%",
        left: "30%",
        div_id: "#message-box",
        status: "pop-out",
        mouseEnterOn: "true",
        mouseLeaveOn: "true"
      };
      options = $.extend({}, $.fn.message_popup.defaults, options);

      return this.each(function() {
        $(this)
          .click( function () {
            if (!$(this).hasClass(options.status)) {
              show_box();
            }
          })
          .bind('mouseenter', function() {
            if (options.mouseEnterOn === "true") {
              if (!$(this).hasClass(options.status)) {
                show_box();
              }
            }
          })
          .bind('mouseleave', function() {
            if (options.mouseLeaveOn === "true") {
              $(options.div_id).fadeOut(150);
            }
          });
      });

      function show_box(){
        add_popup_box();
        add_styles();
        $(options.div_id).fadeIn(150);
      }

      function add_styles(){
            //$("#message-box").css({
            $(options.div_id).css({
                'z-index':    '500000',
                'position':   'absolute',
                'left':       options.left,
                'top':        options.top,
                'display':    'none'
                //'width':      options.width
            });
      }

      function add_popup_box(){
          $(options.div_id).html( options.content );
          $(options.div_id).click(function(){
            $(this).fadeOut();
          });
      }
    };

})(jQuery);