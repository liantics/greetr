$(function(){
   // Enable pusher logging - don't include this in production
    Pusher.log = function(message) {
      if (window.console && window.console.log) {
        window.console.log(message);
      }
    };

    $("#new_greeting").submit(function(){
      $( "#proof_o_sending" ).html(" sent ...").show().fadeOut(500)
      $("#errors").html("");
      
      $.post("/greetings", $("#new_greeting").serialize());
      $("#greeting_body").val("")

      return false;
    });

    var pusher = new Pusher(window.pusher_key);
    var channel = pusher.subscribe(window.pusher_channel);   

    channel.bind('new_greeting', function(data) {
      
      $('#the_greetings').
      prepend(data.greeting)
      
    });
    
});
