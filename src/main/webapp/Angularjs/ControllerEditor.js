let app =angular.module('EditorModule')

 angular.module('EditorModule', []);
       app.controller('EditorController', function($scope,$http) {
              // Controller logic here--
           $scope.sendit=function(){
               //console.log('clicked')
              const output=$http.post("http://localhost:3001/api/editor",newcontent)
               console.log(output)
          }
      });