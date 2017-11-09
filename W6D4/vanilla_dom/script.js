document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const submit = document.getElementsByClassName('favorite-submit')[0];
  
  submit.addEventListener("click", e => {
    e.preventDefault();
    
    const input = document.getElementsByClassName('favorite-input')[0];
    const li = document.createElement('li');
    li.textContent = input.value;
    
    const places = document.getElementById('sf-places');
    places.appendChild(li);
  });
  


  // adding new photos
  const showBtn = document.getElementsByClassName('photo-show-button')[0];
  
  showBtn.addEventListener("click", e => {
    e.preventDefault();
    const dogForm = document.getElementsByClassName('photo-form-container')[0];
    dogForm.classList.toggle('hidden');
  });

  
  const photoSubmit = document.getElementsByClassName('photo-url-submit')[0];
  photoSubmit.addEventListener('click', e => {
    e.preventDefault();
    
    const photoInput = document.getElementsByClassName('photo-url-input')[0];
    console.log(photoInput);
    const dogPhotos = document.getElementsByClassName('dog-photos')[0];
    
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.setAttribute('src', photoInput.value);
    li.appendChild(img);
    dogPhotos.appendChild(li);
  });

});
