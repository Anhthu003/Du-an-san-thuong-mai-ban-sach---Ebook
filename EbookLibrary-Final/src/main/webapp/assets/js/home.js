var app = angular.module("myApp", ["ngRoute"]);
app.config(function ($routeProvider) {
  $routeProvider
    .when("/home", {
      templateUrl: "./html/user/main.html"
    })
    .when("/category", {
      templateUrl: "./html/user/listBooks.html"

    })
    .when("/history", {
      templateUrl: "./html/user/historyRead.html"
    })
    .when("/favorite", {
      templateUrl: "./html/user/favoriteBooks.html",
    })
    .when("/detailBook", {
      templateUrl: "./html/user/bookDetails.html",
    })
    .when("/register", {
      templateUrl: "./html/account/register.html",
    })
    .when("/changePass", {
      templateUrl: "./html/account/changePass.html",
    })
    .when("/postBook", {
      templateUrl: "./html/user/postBooks.html",
    })
    .when("/cart", {
      templateUrl: "./html/user/shoppingCart.html",
    })
    
    .otherwise({
      redirectTo: "/home"
    })
});
app.controller('SliderController', function($scope) {
  // Controller logic if needed
});

app.directive('draggableSlider', function() {
  return {
      restrict: 'A',
      link: function(scope, element, attrs) {
          let isDown = false;
          let startX;
          let scrollLeft;

          element.on('mousedown', function(e) {
              isDown = true;
              startX = e.pageX - element[0].offsetLeft;
              scrollLeft = element[0].scrollLeft;
              element.addClass('active');
              console.log("mousedown");
          });

          element.on('mouseleave', function() {
              isDown = false;
              element.removeClass('active');
              console.log("mouseleave");
          });

          element.on('mouseup', function() {
              isDown = false;
              element.removeClass('active');
              console.log("mouseup");
          });

          element.on('mousemove', function(e) {
              if (!isDown) return;
              e.preventDefault();
              const x = e.pageX - element[0].offsetLeft;
              const walk = (x - startX) * 2; // The multiplication factor controls the speed of the scroll
              element[0].scrollLeft = scrollLeft - walk;
              console.log("mousemove");
          });
      }
  };
});