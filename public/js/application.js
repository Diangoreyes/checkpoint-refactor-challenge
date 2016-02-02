$(document).ready(function() {
  bindListeners();
});

// calls all methods below at specific events
var bindListeners = function() {
  $("a#new-horse").on('click', displayNewForm);
  $(".container").submit(addNewHorse);
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
  var url = $("#horse-form").attr("action"); // /horses
  var type = $("#horse-form").attr("method"); // post
  var data = $("#horse-form").serialize(); // data from horse form

  ajaxRequest(url, type, data).done(function(response) {
    $("#new-horse-form-container").hide();
    $("new-horse").show();
    $("#horse-list").append(response);
  });
};