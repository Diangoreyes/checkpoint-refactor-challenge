$(document).ready(function() {
  bindListeners();

});

var bindListeners = function() {
  $("a#new-horse").on('click', displayNewForm);
};

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

var ajaxRequest = function(url, method) {
  return $.ajax({
    url: url,
    method: method,
    // dataType: dataType
  });
}