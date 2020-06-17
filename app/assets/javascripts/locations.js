
$(document).ready(function() {

    handleShareLinkClick();
    addLocationEventListener()

})



function handleShareLinkClick() {
    $("#share_link").click(getShares)
  }
  
  function getShares(event) {
    event.preventDefault()
    const shareID = event.target.dataset.shareId
    fetch("/locations/"+ locationId + ".json").then(response => response.json()).then(data => displayShares(data.shares)) 
  }
  
  function displayShares(shares) {
    for (var i = 0; i < shares.length; i++) {
      sharesList = "<li>" + shares[i].content + "</li>"
      document.getElementById('target-id').innerHTML += sharesList
    }
  }


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
            <h2>Bar Name:" ${this.name}</h2>
            <h2>Bar Zip:" ${this.zip}</h2>
            </div> `
              }
            }