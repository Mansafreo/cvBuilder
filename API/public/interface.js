window.onload = function() {
const form = document.getElementById('registration-form');
form.addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the default form submission

  // Send an asynchronous request to the server
  const xhr = new XMLHttpRequest();
  xhr.open('POST', '/register'); // Replace with the correct endpoint
  xhr.setRequestHeader('Content-Type', 'application/json');

  xhr.onload = function() {
    if (xhr.status === 200) {
      // Successful registration
      alert('Registration successful');
      form.reset(); // Reset the form fields
    } else {
      // Registration failed
     //To set some data into the error field
     const response=JSON.parse(xhr.response);
     document.getElementById("errors").innerHTML=response.message;
    }
  };

  const formData = new FormData(form);
  const jsonData = JSON.stringify(Object.fromEntries(formData));

  xhr.send(jsonData);
});

}