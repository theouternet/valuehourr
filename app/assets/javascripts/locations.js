
$(document).ready(function() {

    addLocationEventListener()

})



function addLocationEventListener() {
    $("form").submit(function(event) {
        event.preventDefault()
        var values = $(this).serializeArray()
        var posting = $.post("/locations.json", values)
        posting.done((data) => {

let location = new Location(data)

document.querySelector("div#locationResult").innerHTML = location.locationHTML()
        })

        
        class Location {
            constructor(data) {
                this.name = data.name
                this.zip = data.zip
            }
        

        locationHTML() {
            return ` 
            <div id="locationResult">
            <h1>Bar Submission Successful:</h1>
            <h2>Bar Name:" ${this.name}</h2>
            <h2>Bar Zip:" ${this.zip}</h2>
            </div> '
        }

    }