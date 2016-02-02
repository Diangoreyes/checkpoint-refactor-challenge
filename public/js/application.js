$(document).ready(function() {
  bindListeners();
});

// calls all methods below at specific events
var bindListeners = function() {
  $("a#new-horse").on('click', displayNewForm);
  $().on('submit', addNewHorse);
};

// abstracted $.ajax() function
var ajaxRequest = function(url, method) {
  return $.ajax({
    url: url,
    method: method,
    // dataType: dataType
  });
}

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
  console.log(e);
}