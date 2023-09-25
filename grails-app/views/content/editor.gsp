<%--
  Created by IntelliJ IDEA.
  User: Houssem
  Date: 24/08/2023
  Time: 11:43
--%>

<%@page defaultCodec="none" %>
<!DOCTYPE html>

<html lang="en">

<head>
                                            %{--    imports--}%
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
                                         %{--    latest version of bootstrap is been used--}%
    <link rel="stylesheet" href="${resource(dir: 'Bootstrap', file: 'bootstrap.min.css')}" type="text/css">
                                            %{--  the jquerry pre installed with grails is been used --}%
    <asset:javascript src="jquery-2.2.0.min.js"></asset:javascript>
    <script src="${resource(dir: 'Angularjs', file: 'angular.min.js')}"></script>

                                        %{--    ng controller--}%
    <script>
       var app = angular.module('EditorModule', []);
        app.controller('EditorController', function($scope,$http) {

            $scope.sendit=function(){
                //console.log('clicked')
                const output=$http.post("http://localhost:3001/api/editor",newcontent)
                console.log(output)
            }
        });
    </script>

                                 %{--    Variables --}%

    <g:javascript>
    let SelectedEventID;
    let newcontent={
         TrackingNumber:`${contents.getTrackingNumber()}`,
         TextHeader:`${contents.getTextHeader()}`,
        TextContent:`${contents.getTextContent()}`,
         DivText: `${contents.getDivText()}`
    }
</g:javascript>

                            %{--        import editor file dynamically--}%
<script>
        function importFile() {
            const script = document.createElement('script');
            script.src = "${resource(dir: 'Editor', file: 'main.js')}";
            script.defer=true;
            script.id="importfile"
            document.head.appendChild(script);
        }

</script>
    <title>This is an editor</title>
</head>
<body>
</div>
                                %{--displayed variables--}%
                                %{--ps : u need to add class div-text to it so it can be boarderd when hovered --}%
                                %{--ps: u need to add name of the field in the id --}%
<div>
<div   class="div-text" id="DivText" >${raw(contents.getDivText())}</div>
<div  class="div-text" id="TrackingNumber">${raw(contents.getTrackingNumber())}</div>
<div  class="div-text" id="TextHeader">${raw(contents.getTextHeader())}</div>
<div  class="div-text" id="TextContent">${raw(contents.getTextContent())}</div>
    <h1>Not Clickable </h1>
</div>
<script>
 // save button that is shown in the editor modal (this button function is called in the react project)
    function handlesavebutton(value){
        let pattern = /{{\w+}}/;
        newcontent[SelectedEventID]=value
        //check if the pattern existed in the output string before it is displayed
        pattern.test(value)?document.getElementById(SelectedEventID).innerHTML= newcontent[SelectedEventID].replace(pattern,''):document.getElementById(SelectedEventID).innerHTML=newcontent[SelectedEventID]
        //hide modal after clicking save button
        $("#exampleModal").modal("hide")
    }
    //when click on any string to edit
    $(".div-text").click(function (evt){
        SelectedEventID=evt.currentTarget.id
        //open editor function gets its value using dynamic field
        openeditor(newcontent[evt.currentTarget.id])
    })
</script>

                                                %{--modal--}%
</div>
<!-- Modal -->
<div class="modal fade  modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"  >
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content w-100" >

            <div class="modal-body">
                <div id="root" data-custom-data=""></div>

            </div>

        </div>
    </div>
</div>
                                            %{--end of modal--}%
<hr>
                                            %{--ng app--}%


                                %{--            confirm button--}%

</div>

<div ng-app="EditorModule">
    <div ng-controller="EditorController">
        <button ng-click="sendit()">
            Confirm
        </button>

    </div>

                    %{--    submit button calling the function submitcontent in the content controller--}%
<script>

        jQuery(function () {
            jQuery("[name='button']").submit(function () {
                jQuery("[name='submittedcontent']").val(JSON.stringify(newcontent));
            });
        });
</script>

    <g:form name="button" controller="content" action="submitcontent">

        <g:hiddenField name="submittedcontent" value=""/>

        <g:submitButton name="submit" value="Submit"/>
    </g:form>


<script>
                                    //open editor function + open modal
    function openeditor(data){
        window.data=data
        importFile()
        $("#exampleModal").modal("show")
    }

                                    //delete added editor script from the dom when the modal is closed
    $("#exampleModal").on('hidden.bs.modal',()=>{
        document.getElementById("importfile").remove()
    })
                                    // Prevent Bootstrap dialog from blocking focusin
    document.addEventListener('focusin', (e) => {
        if (e.target.closest(".tox-tinymce-aux, .moxman-window, .tam-assetmanager-root") !== null) {
            e.stopImmediatePropagation();
        }
    });

</script>

<script src="${resource(dir: 'Bootstrap', file: 'bootstrap.bundle.js')}"></script>
</body>
</html>




                                                %{--Style--}%
<style>
.div-text{
    border: 1px solid transparent;
    transition: border-color 0.3s;
}
.div-text:hover{
    border-color: #0a58ca;
}
</style>