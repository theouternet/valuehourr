

function Share(data) {
    this.id = data.id
    this.user = data.user

    this.drink.name = data.drink.name
    this.price = data.price
  }
  
  Share.prototype.renderComments = function() {
    let html = "" 
    html += 
    `<br>
      <div class=\'card' id=\'comment-${this.id}'>
      <div class=\'card-body'>
        <h6 class=\'card-subtitle mb-2 text-muted'>Posted by: 
          <a href='/users/${this.user.id}'>${this.user.username}</a>
        </h6>

        <p class=\'card-text'>${this.drink.name}</p>
        <p class=\'card-text'>${this.price}</p>
      
        </div>
    </div>`
  
    $("#submitted-shares").append(html)
  }