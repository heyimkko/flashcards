$(document).ready(function() {
  $('.guess-form').submit(function(e) {
    e.preventDefault();
    
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json'
      // data: $(this).serialize()
    })
    .done(function(data){
      console.log("got here");
      $('.card').append('<p>' + data.card.definition);
      // $('.echo').html();
      // $console.log("WORK!!!")
      // $console.log(data)
      // $(".definition").html(data)

    })
    .fail(function(jqXHR, textStatus, err) {
      console.log("ERROR: " + err);
    });
  });
});
