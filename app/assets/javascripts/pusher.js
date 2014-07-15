

$(function(){
   // Enable pusher logging - don't include this in production
    Pusher.log = function(message) {
      if (window.console && window.console.log) {
        window.console.log(message);
      }
    };

    $( "#proof_o_sending" ).html(" ")

    $("#new_greeting").submit(function(){
      $("#errors").html("");
      
      $.post("/greetings", $("#new_greeting").serialize());
      $("#greeting_body").val("")

      $( "#proof_o_sending" ).html(" sent ...").fadeOut(500)


      return false;
    });

    var pusher = new Pusher(window.pusher_key);
    var channel = pusher.subscribe(window.pusher_channel);   

    channel.bind('new_greeting', function(data) {
      
      $('#the_greetings').
      prepend(data.greeting)
      
    });
    
});
