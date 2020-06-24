
$(document).ready(function() {

    handleShareLinkClick();
    addLocationEventListener()

})



function handleShareLinkClick() {
    $("#share_link").click(getShares)
  }
  
  function getShares(event) {
    event.preventDefault()
    const locationId = event.target.dataset.locationId
    fetch("/locations/"+ locationId + ".json").then(response => response.json()).then(data => displayShares(data.shares)) 
  }
  
  function displayShares(shares) {
    for (var i = 0; i < shares.length; i++) {
      sharesList = "<li>" + shares[i].drink_name + " - " + shares[i].drink_type + " - " + shares[i].price + "</li>"
      document.getElementById('target-id').innerHTML += sharesList
    }
  }
// when clicking bar show page link from bar index pg, js button doesn't fire?

function addLocationEventListener() {
    $("form").submit(function(event) {
        event.preventDefault()
        var values = $(this).serializeArray()
        var posting = $.post("/locations.json", values)
        posting.done((data) => {

let location = new Location(data)

document.querySelector("div#locationResult").innerHTML = location.locationHTML()
        })

    })
}
        
        class Location {
            constructor(data) {
                this.name = data.name
                this.zip = data.zip
            }
        

            locationHTML() {
                return `  
            <div id="locationResult">
            <h1>Bar Submission Successful:</h1>
            <h2>Bar Name: ${this.name}</h2>
            <h2>Bar Zip: ${this.zip}</h2>
            </div> `
              }
            }