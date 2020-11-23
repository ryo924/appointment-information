window.addEventListener('load', function(){

  const alreadyRead = document.getElementById("lists")

  alreadyRead.addEventListener('click', function(){
    alreadyRead.setAttribute("style", "color: #999;")
  })
})