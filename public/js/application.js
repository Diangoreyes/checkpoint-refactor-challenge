$(document).ready(function() {
  bindListeners();
});

// calls all methods below at specific events
var bindListeners = function() {
  $("a#new-horse").on('click', displayNewForm);
  $(".container").on('submit', '#horse-form', addNewHorse);
  $("#horse-list").on('click', ".horse-link", showHorse);
};

// abstracted $.ajax() function
var ajaxRequest = function(url, type, data) {
  console.log("Ajax Request processing!")
  return $.ajax({
    url: url,
    type: type,
    data: data
  });
};

// dynamically load the new horse form to index page
var displayNewForm = function(e) {
  e.preventDefault();
  var url = $(this).attr("href");
  // console.log(url); // "/horses/new"
  ajaxRequest(url, "GET").done(function(response) {
    // console.log(response); // entire html from new.erb
    $("a#new-horse").hide();
    $(".container").append(response);
  });
};

// dynamically add newly created horse to index page
var addNewHorse = function(e) {
  e.preventDefault();
  var $form = $(e.target); // the form itself
  var payload = $form.serialize(); // data from horse form

  $.post('/horses', payload)
    .done(function(response) {
      // console.log(response); // erb details from _show_horse
      $("#new-horse-form-container").hide();
      $("#new-horse").show();
      $("#horse-list").append(response);
    }).fail(function(){
      console.error(arguments);
  });
};

var showHorse = function(e) {
  e.preventDefault();
  var url = $(this).attr("href");
  // console.log(this); // <a></a> on which you clicked
  // console.log(url); // '/horses/:id'
  var horseId = url.match(/\d+/)[0];
  // console.log(horseId) // i.e. 2

  $.get(url)
    .done(function(response) {
      // console.log(response); // details from _horse_details.erb
      $(".horse-details").remove();
      $("#each-horse-container div#horse" + horseId).append(response)
    });
};